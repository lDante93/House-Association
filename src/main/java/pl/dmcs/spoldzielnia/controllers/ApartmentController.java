package pl.dmcs.spoldzielnia.controllers;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import pl.dmcs.spoldzielnia.domain.Apartment;
import pl.dmcs.spoldzielnia.service.ApartmentService;
import pl.dmcs.spoldzielnia.service.BuildingService;

@Controller
@SessionAttributes
public class ApartmentController {

	@Autowired
	ApartmentService apartmentService;

	@Autowired
	BuildingService buildingService;

	@RequestMapping("admin/apartment")
	public String listApartment(Map<String, Object> map, HttpServletRequest request) {

		int apartmentId = ServletRequestUtils.getIntParameter(request, "apartmentId", -1);

		if (apartmentId > 0) {
			map.put("apartment", apartmentService.getApartment(apartmentId));
			map.put("selectedBuilding", apartmentService.getApartment(apartmentId).getBuilding().getId());

		} else
			map.put("apartment", new Apartment());

		map.put("buildingList", buildingService.listBuilding());
		map.put("apartmentList", apartmentService.listApartment());

		return "apartment";
	}

	@RequestMapping(value = "admin/addApartment", method = RequestMethod.POST)
	public String addContact(@ModelAttribute("apartment") Apartment apartment, BindingResult result,
			HttpServletRequest request, Map<String, Object> map) {

		if (result.getErrorCount() == 0) {

			if (apartment.getId() == 0) {

				apartmentService.addApartment(apartment);
			} else {

				apartmentService.editApartment(apartment);
			}

			return "redirect:/admin/apartment.html";
		}

		map.put("buildingList", buildingService.listBuilding());
		map.put("apartmentList", apartmentService.listApartment());
		return "apartment";
	}

	@RequestMapping("admin/delete/apartment/{apartmentId}")
	public String deleteApartment(@PathVariable("apartmentId") Integer apartmentId) {
		apartmentService.removeApartment(apartmentId);

		return "redirect:/admin/apartment.html";
	}

}
