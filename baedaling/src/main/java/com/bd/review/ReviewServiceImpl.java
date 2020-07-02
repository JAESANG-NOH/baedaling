package com.bd.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bd.common.dao.CommonDAO;

@Service("review.reviewService")
public class ReviewServiceImpl implements ReviewService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertReview(Review dto) throws Exception {
		try {
			int seq = dao.selectOne("rv.seq");
			dto.setReviewNum(seq);
			dao.insertData("rv.insertReview", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}


}
