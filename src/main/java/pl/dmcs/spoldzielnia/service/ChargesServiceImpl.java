package pl.dmcs.spoldzielnia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pl.dmcs.spoldzielnia.dao.ChargesDAO;
import pl.dmcs.spoldzielnia.domain.Charges;



@Service
@Transactional
public class ChargesServiceImpl implements ChargesService{

	@Autowired
	ChargesDAO chargesDAO;
	
	@Transactional
	public void addCharges(Charges charges) {
	
	
		chargesDAO.addCharges(charges);
	}


	@Transactional
	public Charges getCharges(int id) {
		return chargesDAO.getCharges(id);
	}
	
	@Transactional
	public void removeCharges(int id) {
		chargesDAO.removeCharges(id);
	}
	
	@Transactional
	public void editCharges(Charges charges) {

		chargesDAO.editCharges(charges);
	}




	@Transactional
	public List<Charges> listCharges() {
		
		return chargesDAO.listCharges();
	}


	@Override
	public double makeCharge(double price, double amount) {
	
		return price*amount;
	}
}
