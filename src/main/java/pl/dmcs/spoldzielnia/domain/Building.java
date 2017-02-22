package pl.dmcs.spoldzielnia.domain;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;

import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "building")
public class Building {

	@SequenceGenerator(name = "sequence_building", sequenceName = "serialBuildingSequence", allocationSize = 1)
	@Id
	@GeneratedValue(generator = "sequence_building")
	int id;

	private String number;
	private String street;

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "building")
	private List<User> userList;

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "building", fetch = FetchType.EAGER)
	private List<Apartment> apartmentList;

	public List<Apartment> getApartmentList() {
		return apartmentList;
	}

	public void setApartmentList(List<Apartment> apartmentList) {
		this.apartmentList = apartmentList;
	}

	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}



}
