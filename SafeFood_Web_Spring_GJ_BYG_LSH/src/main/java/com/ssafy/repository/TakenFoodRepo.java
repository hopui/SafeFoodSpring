package com.ssafy.repository;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.model.dto.TakenFood;

@Repository
public class TakenFoodRepo
{
	public static final String ns = "com.ssafy.model.mapper.TakenFood.";

	@Autowired
	SqlSessionTemplate tmp;
	
	public List<TakenFood> selectTakenFoods(String userEmail, String year, String month) {
		String stmt = ns + "selectTakenFoods";
		Map<String, String> map = new HashMap<String, String>();
		map.put("userEmail", userEmail);
		map.put("yyyy", year);
		map.put("m", month);
		return tmp.selectList(stmt, map);
	}
	
	public int insertTakenFood(String userEmail) {
		String stmt = ns + "insertTakenFood";
		return tmp.insert(stmt, userEmail);
	}
	
	public int deleteTakenFood(String userEmail, String foodCode) {
		String stmt = ns + "deleteTakenFood";
		Map<String, String> map = new HashMap<String, String>();
		map.put("userEmail", userEmail);
		map.put("foodCode", foodCode);
		return tmp.delete(stmt, map);
	}

	public int updateTakenFood(String userEmail, String quantity, String foodCode, Date takenTime) {
		String stmt = ns + "updateTakenFood";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userEmail", userEmail);
		map.put("quantity", quantity);
		map.put("foodCode", foodCode);
		map.put("takenTime", takenTime);
		return tmp.update(stmt, map);
	}
	
	public List<Map<String, Object> > selectTop3Foods(String userEmail) {
		String stmt = ns + "selectTop3Foods";
		return tmp.selectList(stmt, userEmail);
	}
}
