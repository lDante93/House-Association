package pl.dmcs.spoldzielnia.utils;

import java.util.HashSet;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.dmcs.spoldzielnia.domain.UserRole;
import pl.dmcs.spoldzielnia.service.UserService;

public class UserRoleConverter implements Converter<String, Set<UserRole>> {

	@Autowired
	UserService userService;

	@Override
	public Set<UserRole> convert(String source) {

		Set<UserRole> userRoleList = new HashSet<UserRole>(0);

		userRoleList.add(userService.getUserRole(Integer.parseInt(source)));

		return userRoleList;
	}

}
