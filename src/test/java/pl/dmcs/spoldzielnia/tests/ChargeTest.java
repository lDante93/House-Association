package pl.dmcs.spoldzielnia.tests;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import pl.dmcs.spoldzielnia.domain.Charges;
import pl.dmcs.spoldzielnia.domain.ChargesAmount;
import pl.dmcs.spoldzielnia.domain.ChargesPrice;
import pl.dmcs.spoldzielnia.service.ChargesService;
import pl.dmcs.spoldzielnia.service.ChargesServiceImpl;

public class ChargeTest {

	private Charges charge;
	private Charges chargeService;
	private ChargesService chargesService;

	@Before
	public void setup() {
		charge = new Charges();
		chargeService = new Charges();
		chargesService = new ChargesServiceImpl();
	}

	@Test
	public void chargesShouldBeTheSame() {

		// Ustaw.

		int numberofTenants = 2;

		ChargesAmount chargesAmount = new ChargesAmount();

		chargesAmount.setColdWaterAmount(5);
		chargesAmount.setElectricityAmount(5);
		chargesAmount.setGasAmount(5);
		chargesAmount.setHotWaterAmount(5);

		double electricityAmount = chargesAmount.getElectricityAmount();
		double hotWaterAmount = chargesAmount.getHotWaterAmount();
		double coldWaterAmount = chargesAmount.getColdWaterAmount();
		double gasAmount = chargesAmount.getGasAmount();

		ChargesPrice chargesPrice = new ChargesPrice();

		chargesPrice.setColdWaterPrice(10);
		chargesPrice.setElectricityPrice(10);
		chargesPrice.setGasPrice(10);
		chargesPrice.setHotWaterPrice(10);
		chargesPrice.setGarbagePrice(10);
		chargesPrice.setHeatingPrice(10);
		chargesPrice.setRepairFundPrice(10);
		chargesPrice.setSewagePrice(10);

		double electricityPrice = chargesPrice.getElectricityPrice();
		double hotWaterPrice = chargesPrice.getHotWaterPrice();
		double coldWaterPrice = chargesPrice.getColdWaterPrice();
		double gasPrice = chargesPrice.getGasPrice();
		double heatingPrice = chargesPrice.getHeatingPrice();
		double garbagePrice = chargesPrice.getGarbagePrice();
		double sewagePrice = chargesPrice.getSewagePrice();
		double repairFundPrice = chargesPrice.getRepairFundPrice();

		// Wykonaj.

		double chargeElectricity = electricityPrice * electricityAmount;
		double chargeHotWater = hotWaterPrice * hotWaterAmount;
		double chargeColdWater = coldWaterPrice * coldWaterAmount;
		double chargeGas = gasPrice * gasAmount;
		double chargeHeating = heatingPrice * numberofTenants;
		double chargeGarbage = garbagePrice * numberofTenants;
		double chargeSewage = sewagePrice * numberofTenants;
		double chargeRepairFund = repairFundPrice * numberofTenants;

		charge.setElectricity(chargeElectricity);
		charge.setHotWater(chargeHotWater);
		charge.setColdWater(chargeColdWater);
		charge.setGas(chargeGas);
		charge.setHeating(chargeHeating);
		charge.setGarbage(chargeGarbage);
		charge.setSewage(chargeSewage);
		charge.setRepairFund(chargeRepairFund);

		// Porównaj.
		Assert.assertEquals((int) charge.getElectricity(),
				(int) chargesService.makeCharge(electricityPrice, electricityAmount));
		Assert.assertEquals((int) charge.getHotWater(), (int) chargesService.makeCharge(hotWaterPrice, hotWaterAmount));
		Assert.assertEquals((int) charge.getColdWater(), (int) chargesService.makeCharge(coldWaterPrice, gasAmount));
		Assert.assertEquals((int) charge.getGas(), (int) chargesService.makeCharge(gasPrice, electricityAmount));
		Assert.assertEquals((int) charge.getHeating(), (int) chargesService.makeCharge(heatingPrice, numberofTenants));
		Assert.assertEquals((int) charge.getGarbage(), (int) chargesService.makeCharge(garbagePrice, numberofTenants));
		Assert.assertEquals((int) charge.getSewage(), (int) chargesService.makeCharge(sewagePrice, numberofTenants));
		Assert.assertEquals((int) charge.getRepairFund(),
				(int) chargesService.makeCharge(repairFundPrice, numberofTenants));

		Assert.assertEquals((int) charge.getElectricity(), 50);
		Assert.assertEquals((int) charge.getHotWater(), 50);
		Assert.assertEquals((int) charge.getColdWater(), 50);
		Assert.assertEquals((int) charge.getGas(), 50);
		Assert.assertEquals((int) charge.getHeating(), 20);
		Assert.assertEquals((int) charge.getGarbage(), 20);
		Assert.assertEquals((int) charge.getSewage(), 20);
		Assert.assertEquals((int) charge.getRepairFund(), 20);
	}
}