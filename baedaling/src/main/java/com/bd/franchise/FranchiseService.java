package com.bd.franchise;

import java.util.List;

public interface FranchiseService {
	public Franchise readBoard(int restaurantsNum);
	public List<FranchiseMenu> listMenu(int restaurantsNum);
	public List<FranchiseMenu> listCategory();
}
