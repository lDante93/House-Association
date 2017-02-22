package pl.dmcs.spoldzielnia.dao;

import java.util.List;
import pl.dmcs.spoldzielnia.domain.Charges;



public interface ChargesDAO {

	public void addCharges(Charges charges);
	public List<Charges> listCharges();
	public Charges getCharges(int id);
	public void removeCharges (int id);
	public void editCharges(Charges charges);

	
	
}
