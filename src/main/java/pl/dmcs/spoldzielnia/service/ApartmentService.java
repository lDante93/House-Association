package pl.dmcs.spoldzielnia.service;

import java.util.List;
import pl.dmcs.spoldzielnia.domain.Apartment;



public interface ApartmentService {

	public void addApartment(Apartment apartment);
	public List<Apartment> listApartment();
	public Apartment getApartment(int id);
	public void removeApartment (int id);
	public void editApartment(Apartment apartment);
}
