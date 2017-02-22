package pl.dmcs.spoldzielnia.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "chargesAmount")
public class ChargesAmount {
	@SequenceGenerator(name="sequence_chargesAmount", sequenceName="serialChargesAmountSequence",allocationSize=1)
	@Id
	@GeneratedValue(generator="sequence_chargesAmount")
	int id;
	
	private double electricityAmount;
	private double hotWaterAmount;
	private double coldWaterAmount;
	private double gasAmount;	

	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public double getElectricityAmount() {
		return electricityAmount;
	}


	public void setElectricityAmount(double electricityAmount) {
		this.electricityAmount = electricityAmount;
	}
	public double getHotWaterAmount() {
		return hotWaterAmount;
	}
	public void setHotWaterAmount(double hotWaterAmount) {
		this.hotWaterAmount = hotWaterAmount;
	}
	public double getColdWaterAmount() {
		return coldWaterAmount;
	}
	public void setColdWaterAmount(double coldWaterAmount) {
		this.coldWaterAmount = coldWaterAmount;
	}
	public double getGasAmount() {
		return gasAmount;
	}
	public void setGasAmount(double gasAmount) {
		this.gasAmount = gasAmount;
	}



}
