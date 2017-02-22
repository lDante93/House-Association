package pl.dmcs.spoldzielnia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pl.dmcs.spoldzielnia.dao.ChargesAmountDAO;
import pl.dmcs.spoldzielnia.domain.ChargesAmount;



@Service
@Transactional
public class ChargesAmountServiceImpl implements ChargesAmountService{

	@Autowired
	ChargesAmountDAO chargesAmountDAO;
	
	@Transactional
	public void addChargesAmount(ChargesAmount chargesAmount) {
	
	
		chargesAmountDAO.addChargesAmount(chargesAmount);
	}


	@Transactional
	public ChargesAmount getChargesAmount(int id) {
		return chargesAmountDAO.getChargesAmount(id);
	}
	
	@Transactional
	public void removeChargesAmount(int id) {
		chargesAmountDAO.removeChargesAmount(id);
	}
	
	@Transactional
	public void editChargesAmount(ChargesAmount chargesAmount) {

		chargesAmountDAO.editChargesAmount(chargesAmount);
	}




	@Transactional
	public List<ChargesAmount> listChargesAmount() {
		
		return chargesAmountDAO.listChargesAmount();
	}
}
