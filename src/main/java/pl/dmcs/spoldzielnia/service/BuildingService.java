package pl.dmcs.spoldzielnia.service;

import java.util.List;
import pl.dmcs.spoldzielnia.domain.Building;



public interface BuildingService {

	public void addBuilding(Building building);
	public List<Building> listBuilding();
	public Building getBuilding(int id);
	public void removeBuilding (int id);
	public void editBuilding(Building building);
	
	
}
