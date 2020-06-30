package com.bd.franchise;

import java.util.List;
import java.util.Map;

public interface FranchiseService {
	public Franchise readBoard(int restaurantsNum);
	public List<FranchiseMenu> listMenu(int restaurantsNum);
	public List<FranchiseMenu> listCategory();
	public List<FranchiseMenu> detailList(Map<String, Object> map);
	public FranchiseMenu readMenu(int menuNum);
	
}
