package com.bd.foodorder;

public class FoodOrder {
	private int foodorderNum;
	private int foodOrderTotalPrice;
	private int foodOrderPay;
	private String foodOrderState;
	private String foodOrderAddr;
	private String foodOrderDeliveryMethod;
	private String foodOrderHowPay;
	private String foodOrderDate; //주문시간
	private String foodOrderCompletionDate; //주문 완료시간
	private String foodOrderPayCompletionDate; //결제 완료시간 
	private String memo;
	private int idx;
	
	//orderdetail
	private int menuNum;
	private int orderOnePrice;
	private int qty;
	private String menuName;
	
	
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public int getFoodorderNum() {
		return foodorderNum;
	}
	public void setFoodorderNum(int foodorderNum) {
		this.foodorderNum = foodorderNum;
	}
	public int getFoodOrderTotalPrice() {
		return foodOrderTotalPrice;
	}
	public void setFoodOrderTotalPrice(int foodOrderTotalPrice) {
		this.foodOrderTotalPrice = foodOrderTotalPrice;
	}
	public int getFoodOrderPay() {
		return foodOrderPay;
	}
	public void setFoodOrderPay(int foodOrderPay) {
		this.foodOrderPay = foodOrderPay;
	}
	public String getFoodOrderState() {
		return foodOrderState;
	}
	public void setFoodOrderState(String foodOrderState) {
		this.foodOrderState = foodOrderState;
	}
	public String getFoodOrderAddr() {
		return foodOrderAddr;
	}
	public void setFoodOrderAddr(String foodOrderAddr) {
		this.foodOrderAddr = foodOrderAddr;
	}
	public String getFoodOrderDeliveryMethod() {
		return foodOrderDeliveryMethod;
	}
	public void setFoodOrderDeliveryMethod(String foodOrderDeliveryMethod) {
		this.foodOrderDeliveryMethod = foodOrderDeliveryMethod;
	}
	public String getFoodOrderHowPay() {
		return foodOrderHowPay;
	}
	public void setFoodOrderHowPay(String foodOrderHowPay) {
		this.foodOrderHowPay = foodOrderHowPay;
	}
	public String getFoodOrderDate() {
		return foodOrderDate;
	}
	public void setFoodOrderDate(String foodOrderDate) {
		this.foodOrderDate = foodOrderDate;
	}
	public String getFoodOrderCompletionDate() {
		return foodOrderCompletionDate;
	}
	public void setFoodOrderCompletionDate(String foodOrderCompletionDate) {
		this.foodOrderCompletionDate = foodOrderCompletionDate;
	}
	public String getFoodOrderPayCompletionDate() {
		return foodOrderPayCompletionDate;
	}
	public void setFoodOrderPayCompletionDate(String foodOrderPayCompletionDate) {
		this.foodOrderPayCompletionDate = foodOrderPayCompletionDate;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getMenuNum() {
		return menuNum;
	}
	public void setMenuNum(int menuNum) {
		this.menuNum = menuNum;
	}
	public int getOrderOnePrice() {
		return orderOnePrice;
	}
	public void setOrderOnePrice(int orderOnePrice) {
		this.orderOnePrice = orderOnePrice;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	
	
	
}
