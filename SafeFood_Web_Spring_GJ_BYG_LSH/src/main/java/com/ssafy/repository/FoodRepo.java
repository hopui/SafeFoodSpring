package com.ssafy.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.model.dto.Food;

@Transactional
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
	
	public Food selectCode(int code) {
		String stmt = ns+"selectCode";
		return tmp.selectOne(stmt, code);
	}
	
	public List<Food> selectMaker(String maker) {
		String stmt = ns+"selectMaker";
		return tmp.selectList(stmt, maker);
	}
	
	public List<Food> selectName(String name) {
		String stmt = ns+"selectName";
		return tmp.selectList(stmt, name);
	}
	
	public List<Food> selectMaterial(String mater) {
		String stmt = ns+"selectMaterial";
		return tmp.selectList(stmt, mater);
	}
	 
}
