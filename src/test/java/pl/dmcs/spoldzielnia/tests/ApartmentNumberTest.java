package pl.dmcs.spoldzielnia.tests;

import java.util.ArrayList;
import java.util.List;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import pl.dmcs.spoldzielnia.domain.Apartment;
import pl.dmcs.spoldzielnia.domain.Building;


public class ApartmentNumberTest {


	
	

	private Apartment apartment;
	private Building building;
	private Apartment apartment2;
	private List<Apartment> apartmentList;
	
	
	@Before
	public void setup() {
		apartment = new Apartment();
		apartment2 = new Apartment();
		building = new Building();
		apartmentList = new ArrayList<Apartment>();
	}

	@Test
	public void apartmentNumbersShouldBeTheSame() {

		
	apartment.setNumber("12");
	apartment.setId(1);
	apartmentList.add(apartment);
	building.setApartmentList(apartmentList);
	
	apartment2.setNumber("12");
	apartment2.setId(2);

	
	
	Assert.assertEquals(apartment.getNumber(), building.getApartmentList().get(0).getNumber());		

	}
}