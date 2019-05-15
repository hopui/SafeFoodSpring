package com.ssafy.model.dto;

public class LikeFood {

	private String foodCode;
	private String foodName;
	private String haccp;
	private String userEmail;
	private String foodGroup;
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

	public String getFoodGroup() {
		return foodGroup;
	}

	public void setFoodGroup(String foodGroup) {
		this.foodGroup = foodGroup;
	}
	
	public String getImg(String foodGroup) {
		if(foodGroup == null) {
			return "restaurant.png";
		}
		else if(foodGroup.contains("곡류") || 
			foodGroup.contains("감자") ||
			foodGroup.contains("두류") ||
			foodGroup.contains("견과") )
			return "coffee-beans.png";
		else if(foodGroup.contains("채소") || 
				foodGroup.contains("버섯") )
			return "cabbage.png";
		else if(foodGroup.contains("과실") || 
				foodGroup.contains("과일") )
			return "apple.png";
		else if(foodGroup.contains("육류"))
			return "meat.png";
		else if(foodGroup.contains("난류"))
			return "egg.png";
		else if(foodGroup.contains("어패")||
				foodGroup.contains("해조")||
				foodGroup.contains("어육"))
			return "fish.png";
		else if(foodGroup.contains("당류"))
			return "sugar.png";
		else if(foodGroup.contains("우유")||
				foodGroup.contains("유지")||
				foodGroup.contains("아이스")||
				foodGroup.contains("유제품"))
			return "milk.png";
		else if(foodGroup.contains("음료")||
				foodGroup.contains("주류"))
			return "coffee-cup.png";
		else if(foodGroup.contains("가공")||
				foodGroup.contains("조미"))
			return "pot.png";
		else {
			return "restaurant.png";
		}
	}
	
}
