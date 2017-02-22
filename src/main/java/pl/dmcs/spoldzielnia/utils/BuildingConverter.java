package pl.dmcs.spoldzielnia.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.dmcs.spoldzielnia.domain.Building;
import pl.dmcs.spoldzielnia.service.BuildingService;

public class BuildingConverter implements Converter<String, Building> {

	@Autowired
	BuildingService buildingService;

	@Override
	public Building convert(String source) {
		return buildingService.getBuilding(Integer.parseInt(source));
	}
}
