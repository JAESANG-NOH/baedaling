package com.bd.foodorder;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bd.common.dao.CommonDAO;

@Service("foodorder.foodorderService")
public class FoodOrderServiceImpl implements FoodOrderService{
	@Autowired
	private CommonDAO dao;

	@Override
	public List<FoodOrder> readOrder(Map<String, Object> map) {
		List<FoodOrder> list = null;
		try {
			list = dao.selectList("fo.orderComplete", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//주문 상태 변경 
	@Override
	public void updateOrderState(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("fo.updateState", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
	
	@Override
	public void deleteOrder(int foodorderNum) throws Exception {
		try {
			dao.deleteData("fo.deletedetailOrder", foodorderNum);
			dao.deleteData("fo.deleteOrder", foodorderNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	

	@Override
	public int orderCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("fo.orderCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	//매출
	@Override
	public FoodOrder todaySalesRead(int restaurantsNum) {
		FoodOrder dto = null;
		try {
			dto = dao.selectOne("fo.todaySales", restaurantsNum);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	
	}

	@Override
	public FoodOrder monthlySalesRead(int restaurantsNum) {
		FoodOrder dto = null;
		try {
			dto = dao.selectOne("fo.monthlySales", restaurantsNum);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public FoodOrder annualSalesRead(int restaurantsNum) {
		FoodOrder dto = null;
		try {
			dto = dao.selectOne("fo.annualSales", restaurantsNum);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public List<FoodOrder> bestMenuChart(int restaurantsNum) {
		List<FoodOrder> list = null;
		try {
			list = dao.selectList("fo.monthlyBest", restaurantsNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Map<String,Object> montlyChart(int restaurantsNum) {
		Map<String, Object> map = null;
		try {
			map= dao.selectOne("fo.monthlySalesChart", restaurantsNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	@Override
	public List<FoodOrder> allList(Map<String, Object> map) {
		List<FoodOrder> list = null;
		try {
			list = dao.selectList("fo.allOrderList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;


	}


	

	
}
