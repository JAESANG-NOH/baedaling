package com.bd.franchise;

import java.util.List;

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

}
