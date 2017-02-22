package pl.dmcs.spoldzielnia.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "chargesPrice")
public class ChargesPrice {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	int id;
	
	private double electricityPrice;
	private double hotWaterPrice;
	private double coldWaterPrice;
	private double gasPrice;	
	private double garbagePrice;
	private double heatingPrice;
	private double repairFundPrice;
	private double sewagePrice;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public double getElectricityPrice() {
		return electricityPrice;
	}

	public double getSewagePrice() {
		return sewagePrice;
	}
	public void setSewagePrice(double sewagePrice) {
		this.sewagePrice = sewagePrice;
	}
	public void setElectricityPrice(double electricityPrice) {
		this.electricityPrice = electricityPrice;
	}
	public double getHotWaterPrice() {
		return hotWaterPrice;
	}
	public void setHotWaterPrice(double hotWaterPrice) {
		this.hotWaterPrice = hotWaterPrice;
	}
	public double getColdWaterPrice() {
		return coldWaterPrice;
	}
	public void setColdWaterPrice(double coldWaterPrice) {
		this.coldWaterPrice = coldWaterPrice;
	}
	public double getGasPrice() {
		return gasPrice;
	}
	public void setGasPrice(double gasPrice) {
		this.gasPrice = gasPrice;
	}
	public double getGarbagePrice() {
		return garbagePrice;
	}
	public void setGarbagePrice(double garbagePrice) {
		this.garbagePrice = garbagePrice;
	}
	public double getHeatingPrice() {
		return heatingPrice;
	}
	public void setHeatingPrice(double heatingPrice) {
		this.heatingPrice = heatingPrice;
	}
	public double getRepairFundPrice() {
		return repairFundPrice;
	}
	public void setRepairFundPrice(double repairFundPrice) {
		this.repairFundPrice = repairFundPrice;
	}
	

}
