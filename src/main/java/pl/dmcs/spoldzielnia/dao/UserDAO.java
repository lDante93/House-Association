package pl.dmcs.spoldzielnia.dao;

import java.util.List;

import pl.dmcs.spoldzielnia.domain.ChargesAmount;
import pl.dmcs.spoldzielnia.domain.User;
import pl.dmcs.spoldzielnia.domain.UserRole;

public interface UserDAO {

	public void addUser(User user);
	public List<User> listUser();
	public void removeUser (int id);
	public User getUser(int id);

	public void editUser(User user);
	public User findByLogin(String login);
	
	public void addRole(UserRole userRole);
	public List<UserRole> listUserRole();

	public void removeUserRole (int id);
	public UserRole getUserRole(int id);
	public ChargesAmount getChargesAmount(int id);
	public UserRole findRoleByName(String role);
	public User findIdByLogin(String name);

	
}
