package com.bd.mypage;

public class Mypage {
	private int userIdx;
	private String userId;
	private String userPwd;
	private String userName;
	
	private String birth;
	private String year;
	private String month;
	private String date;

	private String tel;
	private String email;

	private int zip;
	private String addr1;
	private String addr2;
	private String created_date;
	
	private String longitude;
	private String latitude;
	
	//userorder
	private int listNum;
	
	private String mutualName; // 가게이름
	private String menuName; // 메뉴이름
	private int qty; // 수량
	private int foodOrderTotalPrice; // 총 결제금액
	private String foodOrderDate; // 주문날짜+시간
	
	private int restaurantsNum;
	private int foodOrderNum;
	public int getUserIdx() {
		return userIdx;
	}
	public void setUserIdx(int userIdx) {
		this.userIdx = userIdx;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getZip() {
		return zip;
	}
	public void setZip(int zip) {
		this.zip = zip;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getCreated_date() {
		return created_date;
	}
	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	public String getMutualName() {
		return mutualName;
	}
	public void setMutualName(String mutualName) {
		this.mutualName = mutualName;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getFoodOrderTotalPrice() {
		return foodOrderTotalPrice;
	}
	public void setFoodOrderTotalPrice(int foodOrderTotalPrice) {
		this.foodOrderTotalPrice = foodOrderTotalPrice;
	}
	public String getFoodOrderDate() {
		return foodOrderDate;
	}
	public void setFoodOrderDate(String foodOrderDate) {
		this.foodOrderDate = foodOrderDate;
	}
	public int getRestaurantsNum() {
		return restaurantsNum;
	}
	public void setRestaurantsNum(int restaurantsNum) {
		this.restaurantsNum = restaurantsNum;
	}
	public int getFoodOrderNum() {
		return foodOrderNum;
	}
	public void setFoodOrderNum(int foodOrderNum) {
		this.foodOrderNum = foodOrderNum;
	}
}