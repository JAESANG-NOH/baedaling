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

}
