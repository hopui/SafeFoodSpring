package com.ssafy.model.dto;

import java.util.Date;

public class TakenFood
{
	private String userEmail;
	private String etc;
	private Date takenTime;
	private int quantity;
	private String foodCode;
	private int haccp;
	private String allergy;
	
	public TakenFood(){}
	public TakenFood(String userEmail, String etc, Date takenTime, int quantity, String foodCode, int haccp)
	{
		this.userEmail = userEmail;
		this.etc = etc;
		this.takenTime = takenTime;
		this.quantity = quantity;
		this.foodCode = foodCode;
		this.haccp = haccp;
	}
	
	public String getUserEmail()
	{
		return userEmail;
	}

	public void setUserEmail(String userEmail)
	{
		this.userEmail = userEmail;
	}

	public Date getTakenTime()
	{
		return takenTime;
	}

	public void setTakenTime(Date takenTime)
	{
		this.takenTime = takenTime;
	}

	public int getQuantity()
	{
		return quantity;
	}

	public void setQuantity(int quantity)
	{
		this.quantity = quantity;
	}

	public String getFoodCode()
	{
		return foodCode;
	}

	public void setFoodCode(String foodCode)
	{
		this.foodCode = foodCode;
	}

	public int getHaccp()
	{
		return haccp;
	}

	public void setHaccp(int haccp)
	{
		this.haccp = haccp;
	}

	public String getEtc()
	{
		return etc;
	}
	
	public void setEtc(String etc)
	{
		this.etc = etc;
	}

	
	public String getAllergy() {
		return allergy;
	}
	public void setAllergy(String allergy) {
		this.allergy = allergy;
	}
	@Override
	public String toString()
	{
		return "TakenFood [userEmail=" + userEmail + ", foodName=" + etc + ", takenTime=" + takenTime
				+ ", quantity=" + quantity + ", foodCode=" + foodCode + ", haccp=" + haccp + "]";
	}
}