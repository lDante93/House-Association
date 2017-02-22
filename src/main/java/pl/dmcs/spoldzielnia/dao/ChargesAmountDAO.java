package pl.dmcs.spoldzielnia.dao;

import java.util.List;
import pl.dmcs.spoldzielnia.domain.ChargesAmount;




public interface ChargesAmountDAO {

	public void addChargesAmount(ChargesAmount chargesAmount);
	public ChargesAmount getChargesAmount(int id);
	public void removeChargesAmount (int id);
	public void editChargesAmount(ChargesAmount chargesAmount);
	public List<ChargesAmount> listChargesAmount();
	
	
}
