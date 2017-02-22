package pl.dmcs.spoldzielnia.dao;

import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import pl.dmcs.spoldzielnia.domain.Charges;

@Repository
public class ChargesDAOImpl implements ChargesDAO {

	@Autowired
	SessionFactory sessionFactory;

	public void addCharges(Charges charges) {
		sessionFactory.getCurrentSession().save(charges);
	}

	public List<Charges> listCharges() {

		return sessionFactory.getCurrentSession().createQuery("from Charges order by id").list();
	}

	public Charges getCharges(int id) {

		return (Charges) sessionFactory.getCurrentSession().get(Charges.class, id);
	}

	public void removeCharges(int id) {
		Charges charges = (Charges) sessionFactory.getCurrentSession().load(Charges.class, id);
		if (null != charges) {
			sessionFactory.getCurrentSession().delete(charges);
		}

	}

	public void editCharges(Charges charges) {

		sessionFactory.getCurrentSession().update(charges);
	}
}
