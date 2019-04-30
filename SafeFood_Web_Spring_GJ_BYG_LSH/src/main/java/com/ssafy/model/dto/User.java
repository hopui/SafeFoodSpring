package com.ssafy.model.dto;

import java.util.Arrays;

//Java Beans - Data 전달용 객체
public class User
{
	private String email;
	private String password;
	private String name;
	private String address;
	private String phone;
	private String allergy;

	public User()
	{
	}

	public User(String email, String password, String name, String address, String phone, String allergy)
	{
		this.email = email;
		this.password = password;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.allergy = allergy;
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email = email;
	}

	public String getPassword()
	{
		return password;
	}

	public void setPassword(String password)
	{
		this.password = password;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getAddress()
	{
		return address;
	}

	public void setAddress(String address)
	{
		this.address = address;
	}

	public String getPhone()
	{
		return phone;
	}

	public void setPhone(String phone)
	{
		this.phone = phone;
	}

	public void setAllergy(String[] allergy)
	{
		String temp = Arrays.toString(allergy);
		this.allergy = temp.substring(1, temp.length()-1);
	}

	public String getAllergy()
	{
		return this.allergy;
	}

	@Override
	public String toString()
	{
		return "Account [email=" + email + ", password=" + password + ", name=" + name + ", address=" + address
				+ ", phone=" + phone + ", allergy=" + allergy + "]";
	}
}
