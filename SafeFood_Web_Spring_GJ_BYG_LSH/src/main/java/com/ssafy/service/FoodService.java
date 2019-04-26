package com.ssafy.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;

import com.ssafy.model.dto.Food;
import com.ssafy.repository.FoodRepo;

public class FoodService
{
	@Autowired
	FoodRepo dao;

	public FoodService(FoodRepo repo) {
		
	}
	public List<Food> selectAll() {
		return dao.selectAll();
	}

	public List<Food> selectMyfoodAll(String email) {
		return dao.selectMyfoodAll(email);
	}

	public Food selectCode(int code) {
		return dao.selectCode(code);
	}

	public List<Food> selectMaker(String maker) {
		return dao.selectMaker(maker);
	}

	public List<Food> selectName(String name) {
		return dao.selectName(name);
	}

	public List<Food> selectMaterial(String mater) {
		return dao.selectMaterial(mater);
	}

	public Food selectMyFood(String email, String code) {
		return selectMyFood(email, code);
	}

	public int insertMyfood(String email, String code, int quantity) {
		return insertMyfood(email, code, quantity);
	}

	public int updateMyfood(String email, String code, int quantity) {
		return updateMyfood(email, code, quantity);
	}
	
	public int deleteMyfood(String email, String code) {
		return deleteMyfood(email, code);
	}
}
