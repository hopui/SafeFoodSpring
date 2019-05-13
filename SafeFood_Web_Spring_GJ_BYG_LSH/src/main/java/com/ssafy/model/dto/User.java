package com.ssafy.model.dto;

import java.util.StringTokenizer;

//Java Beans - Data 전달용 객체
public class User
{
	private String email;
	private String password;
	private String name;
	private String address;
	private String phone;
	private String allergy;
	private String authority;
	public User()
	{
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

	public void setAllergy(String allergy)
	{
		StringBuilder sb = new StringBuilder();
		StringTokenizer st = new StringTokenizer(allergy, ",");
		while(st.hasMoreTokens())
			sb.append(st.nextToken()).append(",");
		
		if(sb.length() > 0)
			this.allergy = sb.toString().substring(0, sb.length()-1);	
		else this.allergy = "";
	}

	public String getAllergy()
	{
		return this.allergy;
	}
	
	public String getAuthority()
	{
		return authority;
	}

	public void setAuthority(String authority)
	{
		this.authority = authority;
	}

	@Override
	public String toString()
	{
		return "Account [email=" + email + ", password=" + password + ", name=" + name + ", address=" + address
				+ ", phone=" + phone + ", allergy=" + allergy + ", authority=" + authority + "]";
	}
}