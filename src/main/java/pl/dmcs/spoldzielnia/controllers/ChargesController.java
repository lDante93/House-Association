package pl.dmcs.spoldzielnia.controllers;

import java.security.Principal;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import pl.dmcs.spoldzielnia.domain.Charges;
import pl.dmcs.spoldzielnia.domain.ChargesAmount;
import pl.dmcs.spoldzielnia.domain.ChargesPrice;
import pl.dmcs.spoldzielnia.domain.User;
import pl.dmcs.spoldzielnia.service.ApplicationMailer;
import pl.dmcs.spoldzielnia.service.ChargesAmountService;
import pl.dmcs.spoldzielnia.service.ChargesPriceService;
import pl.dmcs.spoldzielnia.service.ChargesService;
import pl.dmcs.spoldzielnia.service.UserService;

@Controller
@SessionAttributes
public class ChargesController {
	@Autowired
	ChargesPriceService chargesPriceService;

	@Autowired
	ChargesAmountService chargesAmountService;

	@Autowired
	ChargesService chargesService;

	@Autowired
	UserService userService;

	@RequestMapping("admin/charges")
	public String listChargesPrice(Map<String, Object> map, HttpServletRequest request) {

		map.put("chargesPrice", chargesPriceService.getChargesPrice(1));
		map.put("userList", userService.listUser());
		return "makeCharges";
	}

	@RequestMapping(value = "admin/editChargesPrice", method = RequestMethod.GET)
	public String GETeditChargesPrice(Map<String, Object> map, HttpServletRequest request) {
		int chargesPriceId = ServletRequestUtils.getIntParameter(request, "chargesPriceId", -1);
		map.put("chargesPrice", chargesPriceService.getChargesPrice(chargesPriceId));

		return "editCharges";
	}

	@RequestMapping(value = "admin/editChargesPrice", method = RequestMethod.POST)
	public String editChargesPrice(@ModelAttribute("chargesPrice") ChargesPrice chargesPrice, BindingResult result) {

		chargesPriceService.editChargesPrice(chargesPrice);

		return "redirect:charges.html";
	}

	@RequestMapping("admin/oneCharge")
	public String listOneUserChargesPrice(HttpServletRequest request, Model model, Principal principal) {
		chargesPriceService.getChargesPrice(1);
		int userId = ServletRequestUtils.getIntParameter(request, "userId", -1);

		User user = userService.getUser(userId);
		int numberofTenants = Integer.valueOf(user.getAmountOfLocators());

		ChargesPrice chargesPrice = chargesPriceService.getChargesPrice(1);
		double electricityPrice = chargesPrice.getElectricityPrice();
		double hotWaterPrice = chargesPrice.getHotWaterPrice();
		double coldWaterPrice = chargesPrice.getColdWaterPrice();
		double gasPrice = chargesPrice.getGasPrice();
		double heatingPrice = chargesPrice.getHeatingPrice();
		double garbagePrice = chargesPrice.getGarbagePrice();
		double sewagePrice = chargesPrice.getSewagePrice();
		double repairFundPrice = chargesPrice.getRepairFundPrice();

		ChargesAmount chargesAmount = user.getChargesAmount();
		double electricityAmount = chargesAmount.getElectricityAmount();
		double hotWaterAmount = chargesAmount.getHotWaterAmount();
		double coldWaterAmount = chargesAmount.getColdWaterAmount();
		double gasAmount = chargesAmount.getGasAmount();

		double chargeElectricity = chargesService.makeCharge(electricityPrice, electricityAmount);
		double chargeHotWater = chargesService.makeCharge(hotWaterPrice, hotWaterAmount);
		double chargeColdWater = chargesService.makeCharge(coldWaterPrice, coldWaterAmount);
		double chargeGas = chargesService.makeCharge(gasPrice, gasAmount);
		double chargeHeating = chargesService.makeCharge(heatingPrice, numberofTenants);
		double chargeGarbage = chargesService.makeCharge(garbagePrice, numberofTenants);
		double chargeSewage = chargesService.makeCharge(sewagePrice, numberofTenants);
		double chargeRepairFund = chargesService.makeCharge(repairFundPrice, numberofTenants);

		Charges charge = new Charges();
		charge.setElectricity(chargeElectricity);
		charge.setHotWater(chargeHotWater);
		charge.setColdWater(chargeColdWater);
		charge.setGas(chargeGas);
		charge.setHeating(chargeHeating);
		charge.setGarbage(chargeGarbage);
		charge.setSewage(chargeSewage);
		charge.setRepairFund(chargeRepairFund);
		chargesService.addCharges(charge);

		user.setCharges(charge);
		userService.editWithoutHashUser(user);
		model.addAttribute("charges", charge);
		return "redirect:charges.html";
	}

	// USER

	@RequestMapping("user/charges")
	public String listUserCharges(Map<String, Object> map, HttpServletRequest request, Principal principal,
			Model model) {
		//
		String login = principal.getName();
		User user = (userService.findIdByLogin(login));
		map.put("chargesPrice", chargesPriceService.getChargesPrice(1));
		model.addAttribute("charges", user.getCharges());
		return "userCharges";
	}

	@RequestMapping(value = "user/editChargesPrice", method = RequestMethod.GET)
	public String GETeditUserChargesPrice(Map<String, Object> map, HttpServletRequest request) {
		int chargesPriceId = ServletRequestUtils.getIntParameter(request, "chargesPriceId", -1);
		map.put("chargesPrice", chargesPriceService.getChargesPrice(chargesPriceId));

		return "editCharges";
	}

	@RequestMapping(value = "user/editChargesPrice", method = RequestMethod.POST)
	public String editUserChargesPrice(@ModelAttribute("chargesPrice") ChargesPrice chargesPrice,
			BindingResult result) {

		chargesPriceService.editChargesPrice(chargesPrice);

		return "redirect:charges.html";
	}

	@RequestMapping("user/counter")
	public String listChargesAmount(Map<String, Object> map, HttpServletRequest request, Principal principal,
			Model model) {

		String login = principal.getName();
		User user = (userService.findIdByLogin(login));

		ChargesAmount chargesAmount = user.getChargesAmount();

		model.addAttribute("chargesAmount", chargesAmount);

		return "userCounter";
	}

	@RequestMapping(value = "user/editChargesAmount", method = RequestMethod.GET)
	public String GETeditChargesAmount(Map<String, Object> map, HttpServletRequest request) {
		int chargesAmountId = ServletRequestUtils.getIntParameter(request, "chargesAmountId", -1);
		map.put("chargesAmount", chargesAmountService.getChargesAmount(chargesAmountId));

		return "userEditCounter";
	}

	@RequestMapping(value = "user/editChargesAmount", method = RequestMethod.POST)
	public String editChargesAmount(@ModelAttribute("chargesAmount") ChargesAmount chargesAmount) {

		chargesAmountService.editChargesAmount(chargesAmount);

		return "redirect:counter.html";
	}

	@RequestMapping("user/Payment")
	public String Payment(Map<String, Object> map, HttpServletRequest request, Principal principal, Model model) {

		// applicationMailer.sendPreConfiguredMail("trolol");
		return "userPayment";
	}

	@RequestMapping(value = "user/makePayment", method = RequestMethod.POST)
	public String makePayment(@ModelAttribute("charges") Charges charges, BindingResult result, Principal principal) {

		String login = principal.getName();
		User user = (userService.findIdByLogin(login));
		Charges charge = user.getCharges();
		System.out.println("tutaj");
		charge.setPaid(true);
		chargesService.editCharges(charge);
		return "redirect:charges.html";
	}

	@RequestMapping(value = "user/process", method = RequestMethod.GET)
	public String process2() {

		return "process";
	}
}
