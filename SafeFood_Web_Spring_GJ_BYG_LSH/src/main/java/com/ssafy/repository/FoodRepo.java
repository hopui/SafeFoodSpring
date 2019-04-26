package com.ssafy.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.model.dto.Food;

@Repository
public class FoodRepo
{
	public static final String ns = "com.ssafy.model.mapper.Food.";
	
	@Autowired
	SqlSessionTemplate tmp;
	
	public List<Food> selectAll() {
		String stmt = ns+"selectAll";
		return tmp.selectList(stmt);
	}
	
	public List<Food> selectMyfoodAll(String email) {
		String stmt = ns+"selectMyFoodAll";
		return tmp.selectList(stmt, email);
	}
	 
}
