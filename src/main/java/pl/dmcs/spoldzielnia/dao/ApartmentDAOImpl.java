package pl.dmcs.spoldzielnia.dao;

import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import pl.dmcs.spoldzielnia.domain.Apartment;

@Repository
public class ApartmentDAOImpl implements ApartmentDAO {

	@Autowired
	SessionFactory sessionFactory;

	public void addApartment(Apartment apartment) {
		sessionFactory.getCurrentSession().save(apartment);
	}

	public List<Apartment> listApartment() {

		return sessionFactory.getCurrentSession().createQuery("from Apartment order by id").list();
	}

	public Apartment getApartment(int id) {

		return (Apartment) sessionFactory.getCurrentSession().get(Apartment.class, id);
	}

	public void removeApartment(int id) {
		Apartment apartment = (Apartment) sessionFactory.getCurrentSession().load(Apartment.class, id);
		if (null != apartment) {
			sessionFactory.getCurrentSession().delete(apartment);
		}

	}

	public void editApartment(Apartment apartment) {

		sessionFactory.getCurrentSession().update(apartment);
	}

}
