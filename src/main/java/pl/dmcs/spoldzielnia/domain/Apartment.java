package pl.dmcs.spoldzielnia.domain;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "apartment")
public class Apartment {
	@ManyToOne(cascade = CascadeType.ALL)
	private Building building;
	@SequenceGenerator(name="sequence_apartment", sequenceName="serialApartmentSequence",allocationSize=1)
	@Id
	@GeneratedValue(generator="sequence_apartment")
	int id;
	@Column(name = "apartmentNumber", nullable = false)
	private String number;

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Building getBuilding() {
		return building;
	}

	public void setBuilding(Building building) {
		this.building = building;
	}
}
