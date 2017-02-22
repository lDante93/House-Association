package pl.dmcs.spoldzielnia.service;

import java.util.List;

import pl.dmcs.spoldzielnia.domain.ChargesAmount;





public interface ChargesAmountService {

	public void addChargesAmount(ChargesAmount chargesAmount);
	public ChargesAmount getChargesAmount(int id);
	public void removeChargesAmount (int id);
	public void editChargesAmount(ChargesAmount chargesAmount);
	public List<ChargesAmount> listChargesAmount();
}
