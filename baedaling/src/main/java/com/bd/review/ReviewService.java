package com.bd.review;

public interface ReviewService {
	public void insertReview(Review dto) throws Exception;
	public double starpoint(int num);
}
