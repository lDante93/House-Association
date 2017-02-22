package pl.dmcs.spoldzielnia.dao;

import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import pl.dmcs.spoldzielnia.domain.ChargesAmount;


@Repository
public class ChargesAmountDAOImpl implements ChargesAmountDAO {

	@Autowired
	SessionFactory sessionFactory;

	public void addChargesAmount(ChargesAmount chargesAmount) {
		sessionFactory.getCurrentSession().save(chargesAmount);
	}



	public ChargesAmount getChargesAmount(int id) {

		return (ChargesAmount) sessionFactory.getCurrentSession().get(ChargesAmount.class, id);
	}

	public void removeChargesAmount(int id) {
		ChargesAmount chargesAmount = (ChargesAmount) sessionFactory.getCurrentSession().load(ChargesAmount.class, id);
		if (null != chargesAmount) {
			sessionFactory.getCurrentSession().delete(chargesAmount);
		}

	}

	public void editChargesAmount(ChargesAmount chargesAmount) {

		sessionFactory.getCurrentSession().update(chargesAmount);
	}
	
	public List<ChargesAmount> listChargesAmount() {

		return sessionFactory.getCurrentSession().createQuery("from ChargesAmount order by id").list();
	}
}
