package pl.dmcs.spoldzielnia.utils;

import java.util.HashSet;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.dmcs.spoldzielnia.domain.ChargesAmount;
import pl.dmcs.spoldzielnia.service.UserService;

public class ChargesAmountListConverter implements Converter<String[], Set<ChargesAmount>> {

	@Autowired
	UserService userService;

	@Override
	public Set<ChargesAmount> convert(String[] source) {

		Set<ChargesAmount> chargesAmountList = new HashSet<ChargesAmount>(0);

		for (int i = 0; i < source.length; i++) {
			// System.out.println("role id: " + source[i]);
			chargesAmountList.add(userService.getChargesAmount(Integer.parseInt(source[i])));
		}

		return chargesAmountList;
	}

}
