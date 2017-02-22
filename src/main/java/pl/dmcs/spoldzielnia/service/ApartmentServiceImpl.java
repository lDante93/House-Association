package pl.dmcs.spoldzielnia.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.dmcs.spoldzielnia.dao.ApartmentDAO;
import pl.dmcs.spoldzielnia.domain.Apartment;


@Service
@Transactional
public class ApartmentServiceImpl implements ApartmentService{

	@Autowired
	ApartmentDAO apartmentDAO;
	
	@Transactional
	public void addApartment(Apartment apartment) {
	
	
		apartmentDAO.addApartment(apartment);
	}

	@Transactional
	public List<Apartment> listApartment() {
		
		return apartmentDAO.listApartment();
	}

	@Transactional
	public Apartment getApartment(int id) {
		return apartmentDAO.getApartment(id);
	}
	
	@Transactional
	public void removeApartment(int id) {
		apartmentDAO.removeApartment(id);
	}
	
	@Transactional
	public void editApartment(Apartment apartment) {

		apartmentDAO.editApartment(apartment);
	}
}
