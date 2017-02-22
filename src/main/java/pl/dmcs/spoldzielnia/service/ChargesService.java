package pl.dmcs.spoldzielnia.service;

import java.util.List;

import pl.dmcs.spoldzielnia.domain.Charges;





public interface ChargesService {

	public void addCharges(Charges charges);
	public Charges getCharges(int id);
	public void removeCharges (int id);
	public void editCharges(Charges charges);
	public List<Charges> listCharges();
	public double makeCharge(double price, double amount);
}
