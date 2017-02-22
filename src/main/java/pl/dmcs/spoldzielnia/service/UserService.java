package pl.dmcs.spoldzielnia.service;

import java.util.List;

import pl.dmcs.spoldzielnia.domain.ChargesAmount;
import pl.dmcs.spoldzielnia.domain.User;
import pl.dmcs.spoldzielnia.domain.UserRole;

public interface UserService {

	public void addUser(User user);

	public void editUser(User user);

	public List<User> listUser();

	public void removeUser(int id);

	public User getUser(int id);

	public String hashPassword(String password);

	public void addUserRole(UserRole userRole);

	public List<UserRole> listUserRole();
	public void editWithoutHashUser(User user);


	public void removeUserRole(int id);

	public UserRole getUserRole(int id);
	
	public ChargesAmount getChargesAmount(int id);
	
	public User findIdByLogin(String name);
	

}
