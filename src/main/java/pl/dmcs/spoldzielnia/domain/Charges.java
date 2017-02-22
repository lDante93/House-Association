package pl.dmcs.spoldzielnia.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "charges")
public class Charges {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	int id;

	private double electricity;
	private double hotWater;
	private double coldWater;
	private double gas;
	private double garbage;
	private double heating;
	private double repairFund;
	private double sewage;
	private boolean paid;

	public boolean isPaid() {
		return paid;
	}

	public void setPaid(boolean paid) {
		this.paid = paid;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getElectricity() {
		return electricity;
	}

	public double getSewage() {
		return sewage;
	}

	public void setSewage(double sewage) {
		this.sewage = sewage;
	}

	public void setElectricity(double electricity) {
		this.electricity = electricity;
	}

	public double getHotWater() {
		return hotWater;
	}

	public void setHotWater(double hotWater) {
		this.hotWater = hotWater;
	}

	public double getColdWater() {
		return coldWater;
	}

	public void setColdWater(double coldWater) {
		this.coldWater = coldWater;
	}

	public double getGas() {
		return gas;
	}

	public void setGas(double gas) {
		this.gas = gas;
	}

	public double getGarbage() {
		return garbage;
	}

	public void setGarbage(double garbage) {
		this.garbage = garbage;
	}

	public double getHeating() {
		return heating;
	}

	public void setHeating(double heating) {
		this.heating = heating;
	}

	public double getRepairFund() {
		return repairFund;
	}

	public void setRepairFund(double repairFund) {
		this.repairFund = repairFund;
	}

	public Charges() {
	}
}
