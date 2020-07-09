package com.bd.franchise;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bd.common.dao.CommonDAO;

@Service("franchise.franchiseService")
public class FranchiseServiceImpl implements FranchiseService {
	@Autowired
	private CommonDAO dao;

	@Override
	public Franchise readBoard(int restaurantsNum) {
		Franchise dto = null;
		try {
			dto = dao.selectOne("fc.readBoard", restaurantsNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public List<FranchiseMenu> listMenu(int restaurantsNum) {
		List<FranchiseMenu> list = null;
		try {
			list = dao.selectList("fc.listMenu",restaurantsNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<FranchiseMenu> listCategory() {
		List<FranchiseMenu> list = null;
		try {
			list = dao.selectList("fc.listCategory");
		} catch (Exception e) {
			
		}
		return list;
	}

	

	@Override
	public List<FranchiseMenu> detailList(Map<String, Object> map) {
		List<FranchiseMenu> list = null;
		try {
			list = dao.selectList("fc.detailMenu",map);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	@Override
	public FranchiseMenu readMenu(int menuNum) {
		FranchiseMenu dto = null;
		try {
			dto = dao.selectOne("fc.readMenu",menuNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void insertOrder(Franchise dto) throws Exception {
		try {
			
		} catch (Exception e) {
		
		}
		
	}

	@Override
	public void insertDetailOrder(Franchise dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Franchise readMenuPrice(int restaurantmenu) {
		Franchise dto = null;
		try {
			dto = dao.selectOne("fc.readmenuprice", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public List<FranchiseReview> listReview(Map<String, Object> map) {
		List<FranchiseReview> list = null;
		try {
			list = dao.selectList("fc.reviewList",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int reviewCount(int restaurantsNum) {
		int result = 0;
		try {
			result = dao.selectOne("fc.reviewCount", restaurantsNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public double aveStarCount(int restaurantsNum) {
		double result = 0.0;
		try {
			result = dao.selectOne("fc.aveStarCount", restaurantsNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	

}
