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
import pl.dmcs.spoldzielnia.domain.Building;
import pl.dmcs.spoldzielnia.service.BuildingService;

@Controller
@SessionAttributes
public class BuildingController {

	@Autowired
	BuildingService buildingService;

	@RequestMapping("admin/building")
	public String listBudynki(Map<String, Object> map, HttpServletRequest request) {

		int buildingId = ServletRequestUtils.getIntParameter(request, "buildingId", -1);
		int building = ServletRequestUtils.getIntParameter(request, "building", -1);

		if (buildingId > 0)
			map.put("building", buildingService.getBuilding(buildingId));
		else
			map.put("building", new Building());

		map.put("buildingList", buildingService.listBuilding());

		return "building";
	}

	@RequestMapping(value = "admin/addBuilding", method = RequestMethod.POST)
	public String addContact(@ModelAttribute("building") Building building, BindingResult result,
			HttpServletRequest request, Map<String, Object> map) {

		if (result.getErrorCount() == 0) {
			if (building.getId() == 0)
				buildingService.addBuilding(building);
			else
				buildingService.editBuilding(building);

			return "redirect:/admin/building.html";
		}

		map.put("buildingList", buildingService.listBuilding());

		return "apartment";
	}

	@RequestMapping("admin/delete/building/{buildingId}")
	public String deleteBuilding(@PathVariable("buildingId") Integer buildingId) {
		buildingService.removeBuilding(buildingId);

		return "redirect:/admin/building.html";
	}

}
