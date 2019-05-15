package com.ssafy.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.namespace.QName;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.LikeFood;

@Transactional
@Repository
public class FoodRepo {
	public static final String ns = "com.ssafy.model.mapper.Food.";

	@Autowired
	SqlSessionTemplate tmp;

	public List<Food> selectAll(int page) {
		String stmt = ns + "selectAll";
		return tmp.selectList(stmt,page*20);
	}
	
	public List<Food> selectSortName( String search){
		String stmt = ns + "selectSortName";
		return tmp.selectList(stmt,search);
	}

	public List<Food> selectSortMaker( String search){
		String stmt = ns + "selectSortMaker";
		return tmp.selectList(stmt,search);
	}
	public List<Food> selectSortGroup( String search){
		String stmt = ns + "selectSortGroup";
		
		return tmp.selectList(stmt,search);
	}
	public List<Food> selectMyfoodAll(String email) {
		String stmt = ns + "selectMyFoodAll";
		return tmp.selectList(stmt, email);
	}
	
	public List<LikeFood> selectLikeAll(String email) {
		String stmt = ns + "selectLikeAll";
		return tmp.selectList(stmt, email);
	}

	public Food selectCode(int code) {
		String stmt = ns + "selectCode";
		return tmp.selectOne(stmt, code);
	}

	public Food selectMyFood(String email, String code) {
		String stmt = ns + "selectMyFood";
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("code", code);
		return tmp.selectOne(stmt, map);
	}

	public int insertMyfood(String email, String code, int quantity, int haccap, String name) {
		Integer food = (Integer)selectQuantity(email, code);
		if (food<1) {
			String stmt = ns + "insertMyFood";
			Map<String, String> map = new HashMap<String, String>();
			map.put("email", email);
			map.put("code", code);
			map.put("quantity", String.valueOf(quantity));
			map.put("haccp", String.valueOf(haccap));
			map.put("etc", String.valueOf(name));
			return tmp.insert(stmt, map);
		}else {
			return updateMyfood(email, code, food+quantity);
		}
	}
	
	public int insertLikefood(String email, String name, String code, int haccp, String group) {
		Integer food = (Integer)checkLikefood(email, code);
		if (food<1) {
			String stmt = ns + "insertLikeFood";
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("email", email);
			map.put("code", code);
			map.put("name", name);
			map.put("haccp", haccp);
			map.put("group", group);
			return tmp.insert(stmt, map);
		}else {
			return -deleteLikefood(email, code);
		}
	}
	
	public int deleteLikefood(String email, String code) {
		String stmt = ns + "deletelikeFood";
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("code", code);
		return tmp.delete(stmt, map);
	}
	
	public Object checkLikefood(String email, String code) {
		String stmt = ns + "checkLikefood";
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("code", code);
		Object quan= tmp.selectOne(stmt, map);
		if (quan== null)
			return 0;
		else 
			return quan;
	}
	
	public int updateMyfood(String email, String code, int quantity) {
			String stmt = ns + "updateMyFood";
			Map<String, String> map = new HashMap<String, String>();
			map.put("email", email);
			map.put("code", code);
			map.put("quantity", String.valueOf(quantity));
			return tmp.update(stmt,map);
	}
	
	
	public Object selectQuantity(String email, String code) {
		String stmt = ns + "selectQuantity";
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("code", code);
		Object quan= tmp.selectOne(stmt, map);
		if (quan== null)
			return 0;
		else 
			return quan;
	}

	
	public int deleteMyfood(String email, String code) {
		String stmt = ns + "deleteMyFood";
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("code", code);
		return tmp.delete(stmt, map);
	}
	
	public int deleteMyfoodForUser(String email)
	{
		String stmt = ns + "deleteMyfoods2";
		return tmp.delete(stmt, email);
	}
}
