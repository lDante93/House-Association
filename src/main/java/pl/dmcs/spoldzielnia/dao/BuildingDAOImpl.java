package pl.dmcs.spoldzielnia.dao;

import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import pl.dmcs.spoldzielnia.domain.Building;

@Repository
public class BuildingDAOImpl implements BuildingDAO {

	@Autowired
	SessionFactory sessionFactory;

	public void addBuilding(Building building) {
		sessionFactory.getCurrentSession().save(building);
	}

	public List<Building> listBuilding() {

		return sessionFactory.getCurrentSession().createQuery("from Building order by id").list();
	}

	public Building getBuilding(int id) {

		return (Building) sessionFactory.getCurrentSession().get(Building.class, id);
	}

	public void removeBuilding(int id) {
		Building building = (Building) sessionFactory.getCurrentSession().load(Building.class, id);
		if (null != building) {
			sessionFactory.getCurrentSession().delete(building);
		}

	}

	public void editBuilding(Building building) {

		sessionFactory.getCurrentSession().update(building);
	}
}
