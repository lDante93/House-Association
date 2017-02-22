package pl.dmcs.spoldzielnia.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.dmcs.spoldzielnia.domain.Apartment;
import pl.dmcs.spoldzielnia.service.ApartmentService;

public class ApartmentConverter implements Converter<String, Apartment> {

	@Autowired
	ApartmentService apartmentService;

	@Override
	public Apartment convert(String source) {
		return apartmentService.getApartment(Integer.parseInt(source));
	}
}
