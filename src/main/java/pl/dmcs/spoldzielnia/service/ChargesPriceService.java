package pl.dmcs.spoldzielnia.service;

import java.util.List;
import pl.dmcs.spoldzielnia.domain.ChargesPrice;



public interface ChargesPriceService {

	public void addChargesPrice(ChargesPrice chargesPrice);
	public List<ChargesPrice> listChargesPrice();
	public ChargesPrice getChargesPrice(int id);
	public void removeChargesPrice (int id);
	public void editChargesPrice(ChargesPrice chargesPrice);
}
