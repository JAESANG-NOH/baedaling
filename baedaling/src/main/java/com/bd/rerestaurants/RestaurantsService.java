package com.bd.rerestaurants;

import java.util.List;
import java.util.Map;

public interface RestaurantsService {
	public List<Restaurants> listRestaurants(Map<String, Object> map) throws Exception;
	public int dataCount(Map<String, Object> map) throws Exception;
}
