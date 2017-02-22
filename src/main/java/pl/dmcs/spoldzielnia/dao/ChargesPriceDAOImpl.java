package pl.dmcs.spoldzielnia.dao;

import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import pl.dmcs.spoldzielnia.domain.ChargesPrice;

@Repository
public class ChargesPriceDAOImpl implements ChargesPriceDAO {

	@Autowired
	SessionFactory sessionFactory;

	public void addChargesPrice(ChargesPrice chargesPrice) {
		sessionFactory.getCurrentSession().save(chargesPrice);
	}

	public List<ChargesPrice> listChargesPrice() {

		return sessionFactory.getCurrentSession().createQuery("from ChargesPrice order by id").list();
	}

	public ChargesPrice getChargesPrice(int id) {

		return (ChargesPrice) sessionFactory.getCurrentSession().get(ChargesPrice.class, id);
	}

	public void removeChargesPrice(int id) {
		ChargesPrice chargesPrice = (ChargesPrice) sessionFactory.getCurrentSession().load(ChargesPrice.class, id);
		if (null != chargesPrice) {
			sessionFactory.getCurrentSession().delete(chargesPrice);
		}

	}

	public void editChargesPrice(ChargesPrice chargesPrice) {

		sessionFactory.getCurrentSession().update(chargesPrice);
	}
}
