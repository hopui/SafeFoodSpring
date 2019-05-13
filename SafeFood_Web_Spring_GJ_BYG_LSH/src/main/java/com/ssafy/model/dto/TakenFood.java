package com.ssafy.model.dto;

import java.util.Date;

public class TakenFood
{
	private String userEmail;
	private Date takenTime;
	private Integer quantity;
	private String foodCode;
	private Integer haccp;
	
	public TakenFood(){}

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

	public Integer getQuantity()
	{
		return quantity;
	}

	public void setQuantity(Integer quantity)
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

	public Integer getHaccp()
	{
		return haccp;
	}

	public void setHaccp(Integer haccp)
	{
		this.haccp = haccp;
	}
}