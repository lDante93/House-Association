package pl.dmcs.spoldzielnia.controllers;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pl.dmcs.spoldzielnia.domain.Apartment;
import pl.dmcs.spoldzielnia.service.ApartmentService;
import pl.dmcs.spoldzielnia.service.BuildingService;
import pl.dmcs.spoldzielnia.service.UserService;

@Controller
public class AdminController {


	@Autowired
	UserService userService;

	@Autowired
	BuildingService buildingService;

	@Autowired
	ApartmentService apartmentService;
	
	@RequestMapping(value = "/admin**", method = RequestMethod.GET)
	public ModelAndView adminPage() {

		ModelAndView model = new ModelAndView();
		model.addObject("title", "Spring Security Hello World");
		model.addObject("message", "This is protected page!");
		model.setViewName("user");

		return model;
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {

		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", "Niepoprawny login lub has³o.");
		}

		if (logout != null) {
			model.addObject("msg", "Zosta³eœ wylogowany.");
		}
		model.setViewName("login");

		return model;
	}

	@RequestMapping(value = "/404", method = RequestMethod.GET)
	public ModelAndView accessDenied404() {

		ModelAndView model = new ModelAndView();
		model.setViewName("404");

		return model;

	}
	
	@RequestMapping("admin/management")
	public String listApartment(Map<String, Object> map, HttpServletRequest request) {

		int apartmentId = ServletRequestUtils.getIntParameter(request, "apartmentId", -1);

		if (apartmentId > 0) {
			Apartment apartment = apartmentService.getApartment(apartmentId);

			apartment.setBuilding(
					buildingService.getBuilding(apartmentService.getApartment(apartmentId).getBuilding().getId()));
			map.put("selectedBuilding", apartmentService.getApartment(apartmentId).getBuilding().getId());
			map.put("apartment", apartment);
		} else
			map.put("apartment", new Apartment());

		map.put("buildingList", buildingService.listBuilding());
		map.put("apartmentList", apartmentService.listApartment());
		map.put("userList", userService.listUser());
		return "management";
	}
	
	


}
