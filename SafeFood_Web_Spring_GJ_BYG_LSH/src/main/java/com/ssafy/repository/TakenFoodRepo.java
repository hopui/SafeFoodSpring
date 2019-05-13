package com.ssafy.repository;

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
}
