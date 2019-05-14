package com.ssafy.model.dto;

public class LikeFood {

	private String foodCode;
	private String foodName;
	private String haccp;
	private String userEmail;
	
	public LikeFood() {
		
	}

	public LikeFood(String foodCode, String foodName, String haccp, String userEmail) {
		super();
		this.foodCode = foodCode;
		this.foodName = foodName;
		this.haccp = haccp;
		this.userEmail = userEmail;
	}

	public String getFoodCode() {
		return foodCode;
	}

	public void setFoodCode(String foodCode) {
		this.foodCode = foodCode;
	}

	public String getFoodName() {
		return foodName;
	}

	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}

	public String getHaccp() {
		return haccp;
	}

	public void setHaccp(String haccp) {
		this.haccp = haccp;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	
	
	
}
