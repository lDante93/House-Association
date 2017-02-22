package pl.dmcs.spoldzielnia.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pl.dmcs.spoldzielnia.domain.ChargesAmount;
import pl.dmcs.spoldzielnia.domain.User;
import pl.dmcs.spoldzielnia.domain.UserRole;

@Repository
public class UserDAOImpl implements UserDAO{

	@Autowired
    SessionFactory sessionFactory;
	
//	@Autowired
//    Session session;
	
    public void addUser(User user) {
        sessionFactory.getCurrentSession().save(user);
    }
 
    public List<User> listUser() {
 
        return sessionFactory.getCurrentSession().createQuery("from User order by id").list();
    }

 
    public void removeUser(int id) {
        User user = (User) sessionFactory.getCurrentSession().load(
                User.class, id);
        if (null != user) {
            sessionFactory.getCurrentSession().delete(user);
        }
 
    }
    public User getUser(int id) {
    	
    	return (User)sessionFactory.getCurrentSession().get(User.class, id);
    }
    
  public void editUser(User user) {
    	
//	 this.getUserRole(user.getId());
//	 System.out.println("asdasdasdasdasdlol12"+ this.getUserRole(user.getId()));
//	 user.setUserRole((this.getUserRole(user.getId());
//	 user.getUserRole();
	 
	 
	// this.listUserRole().add(this.getUserRole(user.getId()));
    	sessionFactory.getCurrentSession().update(user);
    }
	
  
  @SuppressWarnings("unchecked")
  public User findByLogin(String login)
  {
	  List<User> users = new ArrayList<User>();
	  
		users = sessionFactory.getCurrentSession()
			.createQuery("from User where login=?")
			.setParameter(0, login)
			.list();

		if (users.size() > 0) {
			return users.get(0);
		} else {
			return null;
		}
  }
  
    public void addRole(UserRole userRole)
    {
    	sessionFactory.getCurrentSession().save(userRole);
    }
    
	public List<UserRole> listUserRole() {
		 return sessionFactory.getCurrentSession().createQuery("from UserRole order by id").list();
	}
	

	
	public void removeUserRole (int id) {
		UserRole userRole = (UserRole) sessionFactory.getCurrentSession().load(
                UserRole.class, id);
        if (null != userRole) {
            sessionFactory.getCurrentSession().delete(userRole);
        }
	}
	
	public UserRole getUserRole(int id) {
		return (UserRole)sessionFactory.getCurrentSession().get(UserRole.class, id);
	}
    
	public ChargesAmount getChargesAmount(int id) {
		return (ChargesAmount)sessionFactory.getCurrentSession().get(ChargesAmount.class, id);
	}
	
    @SuppressWarnings("unchecked")
    public UserRole findRoleByName(String role)
    {

  	  List<UserRole> userRole = new ArrayList<UserRole>();
  	  
  	userRole = sessionFactory.getCurrentSession()
  			.createQuery("from UserRole where role=?")
  			.setParameter(0, role)
  			.list();

  		if (userRole.size() > 0) {
  			return userRole.get(0);
  		} else {
  			return null;
  		}
    }
    @SuppressWarnings("unchecked")
    
    public User findIdByLogin(String name)
    {

  	  List<User> user = new ArrayList<User>();
  	  
  	user = sessionFactory.getCurrentSession()
  			.createQuery("from User where login=?")
  			.setParameter(0, name)
  			.list();

  	
  			return user.get(0);
  		}




}
