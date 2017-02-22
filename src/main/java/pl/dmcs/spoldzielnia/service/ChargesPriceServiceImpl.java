package pl.dmcs.spoldzielnia.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.dmcs.spoldzielnia.dao.ChargesPriceDAO;
import pl.dmcs.spoldzielnia.domain.ChargesPrice;


@Service
@Transactional
public class ChargesPriceServiceImpl implements ChargesPriceService{

	@Autowired
	ChargesPriceDAO chargesPriceDAO;
	
	@Transactional
	public void addChargesPrice(ChargesPrice chargesPrice) {
	
	
		chargesPriceDAO.addChargesPrice(chargesPrice);
	}

	@Transactional
	public List<ChargesPrice> listChargesPrice() {
		
		return chargesPriceDAO.listChargesPrice();
	}

	@Transactional
	public ChargesPrice getChargesPrice(int id) {
		return chargesPriceDAO.getChargesPrice(id);
	}
	
	@Transactional
	public void removeChargesPrice(int id) {
		chargesPriceDAO.removeChargesPrice(id);
	}
	
	@Transactional
	public void editChargesPrice(ChargesPrice chargesPrice) {

		chargesPriceDAO.editChargesPrice(chargesPrice);
	}
}
