package com.bd.franchise;

import java.util.List;
import java.util.Map;

public interface FranchiseService {
	public Franchise readBoard(int restaurantsNum);
	public List<FranchiseMenu> listMenu(int restaurantsNum);
	public List<FranchiseMenu> listCategory();
	public List<FranchiseMenu> detailList(Map<String, Object> map);
	public FranchiseMenu readMenu(int menuNum);
	
	public Franchise readMenuPrice(int restaurantmenu);
	
	public void insertOrder(Franchise dto) throws Exception;
	public void insertDetailOrder(Franchise dto) throws Exception;


	public List<FranchiseReview> listReview(Map<String, Object> map);
	public int reviewCount(int restaurantsNum);
	public double aveStarCount(int restaurantsNum);

}
