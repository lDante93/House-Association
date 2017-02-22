package pl.dmcs.spoldzielnia.controllers;

import java.security.Principal;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import pl.dmcs.spoldzielnia.domain.Apartment;
import pl.dmcs.spoldzielnia.domain.Building;
import pl.dmcs.spoldzielnia.domain.Charges;
import pl.dmcs.spoldzielnia.domain.ChargesAmount;
import pl.dmcs.spoldzielnia.domain.User;
import pl.dmcs.spoldzielnia.service.ApartmentService;
import pl.dmcs.spoldzielnia.service.ApplicationMailerImpl;
import pl.dmcs.spoldzielnia.service.BuildingService;
import pl.dmcs.spoldzielnia.service.UserService;
import pl.dmcs.spoldzielnia.validators.UserValidator;

@Controller
@SessionAttributes
public class UserController {

	@Autowired
	UserService userService;

	@Autowired
	BuildingService buildingService;
	@Autowired
	ApartmentService apartmentService;

	UserValidator userValidator = new UserValidator();
	@Autowired
	ApplicationMailerImpl applicationMailerImpl;

	@RequestMapping("/admin/users")
	public String listUsers(Map<String, Object> map, HttpServletRequest request) {

		int buildingId = ServletRequestUtils.getIntParameter(request, "building", 1);
		int userId = ServletRequestUtils.getIntParameter(request, "userId", -1);

		if (userId > 0)
		{	map.put("user", userService.getUser(userId));
		map.put("selectedBuilding", userService.getUser(userId).getBuilding().getId());
		}
		else
			map.put("user", new User());

		map.put("userList", userService.listUser());
		map.put("selectedBuilding", buildingId);
		map.put("apartmentList", buildingService.getBuilding(buildingId).getApartmentList());
		map.put("buildingList", buildingService.listBuilding());
		return "user";

	}

	@RequestMapping(value = "admin/addUsers", method = RequestMethod.POST)
	public String addContact(@ModelAttribute("user") User user, BindingResult result, HttpServletRequest request,
			Map<String, Object> map, Model model) {
	
		int buildingId = ServletRequestUtils.getIntParameter(request, "building", 1);
		userValidator.validate(user, result);

		if (result.getErrorCount() == 0) {
			if (user.getId() == 0) {

				ChargesAmount chargesAmount = new ChargesAmount();
				chargesAmount.setColdWaterAmount(0);
				chargesAmount.setElectricityAmount(0);

				chargesAmount.setGasAmount(0);

				chargesAmount.setHotWaterAmount(0);

				user.setChargesAmount(chargesAmount);
				user.setPassword("defaultpassword");
				userService.addUser(user);
			} else {

				user.getUserRole().add((userService.getUserRole(2)));
				ChargesAmount chargesAmount = userService.getUser(user.getId()).getChargesAmount();
				user.setChargesAmount(chargesAmount);
				Charges charges = userService.getUser(user.getId()).getCharges();
				user.setCharges(charges);

				userService.editWithoutHashUser(user);

			}

			return "redirect:users";
		}

		map.put("selectedBuilding", buildingId);
		map.put("userList", userService.listUser());
		map.put("apartmentList", user.getBuilding().getApartmentList());
		map.put("buildingList", buildingService.listBuilding());

		return "user";
	}

	@RequestMapping("admin/delete/users/{userId}")
	public String deleteUser(@PathVariable("userId") Integer userId) {
		
	
userService.editUser(userService.getUser(userId));
		userService.removeUser(userId);

		return "redirect:/admin/users.html";
	}

	@RequestMapping(value = "admin/userEditPassword", method = RequestMethod.GET)
	public String adminPassword(Map<String, Object> map, HttpServletRequest request, Principal principal) {

		int userId = ServletRequestUtils.getIntParameter(request, "userId", 2);

		User user = (userService.getUser(userId));

		int buildingId = ServletRequestUtils.getIntParameter(request, "buildingId", 2);

		map.put("user", userService.getUser(user.getId()));

		map.put("selectedBuilding", buildingId);
		map.put("apartmentList", buildingService.getBuilding(buildingId).getApartmentList());
		map.put("buildingList", buildingService.listBuilding());

		return "editPassword";
	}

	@RequestMapping(value = "admin/userEditPassword", method = RequestMethod.POST)
	public String adminEditPassword(@ModelAttribute("user") User user, BindingResult result, HttpServletRequest request,
			Map<String, Object> map, Model model) {
		userValidator.validate(user, result);

		if (result.getErrorCount() == 0) {
			if (user.getId() == 0) {

				userService.addUser(user);
			} else {

				user.getUserRole().add((userService.getUserRole(2)));
				ChargesAmount chargesAmount = userService.getUser(user.getId()).getChargesAmount();
				user.setChargesAmount(chargesAmount);
				Charges charges = userService.getUser(user.getId()).getCharges();
				user.setCharges(charges);
				Apartment apartment = userService.getUser(user.getId()).getApartment();
				user.setApartment(apartment);
				Building building = userService.getUser(user.getId()).getBuilding();
				user.setBuilding(building);
				userService.editUser(user);

			}

			return "redirect:userEditPassword";
		}

		return "user";

	}

	@RequestMapping("/registration")
	public String Registration(Map<String, Object> map, HttpServletRequest request) {

		int buildingId = ServletRequestUtils.getIntParameter(request, "building", 1);
		int userId = ServletRequestUtils.getIntParameter(request, "userId", -1);

		if (userId > 0)
			map.put("user", userService.getUser(userId));

		else
			map.put("user", new User());

		map.put("userList", userService.listUser());
		map.put("selectedBuilding", buildingId);
		map.put("apartmentList", buildingService.getBuilding(buildingId).getApartmentList());
		map.put("buildingList", buildingService.listBuilding());

		return "registration";

	}

	@RequestMapping(value = "/registerNewUser", method = RequestMethod.POST)
	public String registerUser(@ModelAttribute("user") User user, BindingResult result, HttpServletRequest request,
			Map<String, Object> map, Model model) {

		int buildingId = ServletRequestUtils.getIntParameter(request, "building", 1);
		userValidator.validate(user, result);

		if (result.getErrorCount() == 0) {
			if (user.getId() == 0) {

				ChargesAmount chargesAmount = new ChargesAmount();
				chargesAmount.setColdWaterAmount(0);
				chargesAmount.setElectricityAmount(0);

				chargesAmount.setGasAmount(0);

				chargesAmount.setHotWaterAmount(0);

				user.setChargesAmount(chargesAmount);
				String uuid = UUID.randomUUID().toString();
				user.setPassword(uuid);
				userService.addUser(user);
				String message = "Witaj!\nDziêkujemy Ci "+user.getFirstname()+" "+user.getLastname()+ " za rejestracjê.\nTwój login to: "+user.getLogin()+"\nTwoje has³o to: "+uuid;
				 applicationMailerImpl.sendMail(user.getEmail(), "Dane do logowania do Spó³dzielni Mieszkaniowej META", message);
			}

			return "registrationSuccess";
		}

		map.put("selectedBuilding", buildingId);
		map.put("userList", userService.listUser());
		map.put("apartmentList", user.getBuilding().getApartmentList());
		map.put("buildingList", buildingService.listBuilding());
		return "registration";

	}

	@RequestMapping("/user/home")
	public String userPage(Model model, Principal principal) {

		String login = principal.getName();
		User user = (userService.findIdByLogin(login));

		model.addAttribute("userData", user);
		return "userPage";

	}

	@RequestMapping(value = "user/editPassword", method = RequestMethod.GET)
	public String Password(Map<String, Object> map, HttpServletRequest request, Principal principal) {
		String login = principal.getName();
		User user = (userService.findIdByLogin(login));

		int buildingId = ServletRequestUtils.getIntParameter(request, "building", 1);

		map.put("user", userService.getUser(user.getId()));

		map.put("selectedBuilding", buildingId);
		map.put("apartmentList", buildingService.getBuilding(buildingId).getApartmentList());
		map.put("buildingList", buildingService.listBuilding());

		return "userEditPassword";
	}

	@RequestMapping(value = "user/editPassword", method = RequestMethod.POST)
	public String EditPassword(@ModelAttribute("user") User user, BindingResult result, HttpServletRequest request,
			Map<String, Object> map, Model model) {

		userValidator.validate(user, result);

		if (result.getErrorCount() == 0) {
			if (user.getId() == 0) {

				userService.addUser(user);
			} else {

				user.getUserRole().add((userService.getUserRole(2)));
				ChargesAmount chargesAmount = userService.getUser(user.getId()).getChargesAmount();
				user.setChargesAmount(chargesAmount);
				Charges charges = userService.getUser(user.getId()).getCharges();
				user.setCharges(charges);
				Apartment apartment = userService.getUser(user.getId()).getApartment();
				user.setApartment(apartment);
				Building building = userService.getUser(user.getId()).getBuilding();
				user.setBuilding(building);
				userService.editUser(user);

			}

			return "redirect:editPassword";
		}

		return "userPage";

	}

}
