package com.ssafy.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.model.dto.TakenFood;

@Repository
public class TakenFoodRepo
{
	public static final String ns = "com.ssafy.model.mapper.TakenFood.";

	@Autowired
	SqlSessionTemplate tmp;
	
	public List<TakenFood> selectTakenFoods(String userEmail) {
		String stmt = ns + "selectTakenFoods";
		return tmp.selectList(stmt, userEmail);
	}
}
