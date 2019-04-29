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
	private String[] allergy;

	public User()
	{
	}

	public User(String email, String password, String name, String address, String phone, String[] allergy)
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
		this.allergy = allergy;
	}

	public String getAllergy()
	{
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < allergy.length; i++)
		{
			sb.append(allergy[i]).append(",");
		}
		return sb.toString().substring(0, sb.length() - 1);
	}

	@Override
	public String toString()
	{
		return "Account [email=" + email + ", password=" + password + ", name=" + name + ", address=" + address
				+ ", phone=" + phone + ", allergy=" + Arrays.toString(allergy) + "]";
	}
}
