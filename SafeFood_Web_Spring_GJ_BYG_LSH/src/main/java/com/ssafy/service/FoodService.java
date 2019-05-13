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
	public List<Food> selectAll(int page) {
		return dao.selectAll(page);
	}

	public List<Food> selectMyfoodAll(String email) {
		return dao.selectMyfoodAll(email);
	}

	public Food selectCode(int code) {
		return dao.selectCode(code);
	}
	
	public List<Food> selectSortName(String search){
		return dao.selectSortName(search);
	}

	public List<Food> selectSortMaker(String search){
		return dao.selectSortMaker(search);
	}
	public List<Food> selectSortGroup(String search){
		return dao.selectSortGroup(search);
	}
	public Food selectMyFood(String email, String code) {
		return dao.selectMyFood(email, code);
	}

	public int insertMyfood(String email, String code, int quantity) {
		return dao.insertMyfood(email, code, quantity);
	}
	
	public int insertfood( Food food) {
		return dao.insertfood(food);
	}

	public int updateMyfood(String email, String code, int quantity) {
		return dao.updateMyfood(email, code, quantity);
	}
	
	public int deleteMyfood(String email, String code) {
		return dao.deleteMyfood(email, code);
	}
	
	public int deleteMyfoodForUser(String email) {
		return dao.deleteMyfoodForUser(email);
	}
	
	public Object selectQuantity(String email, String code) {
		return dao.selectQuantity(email, code);
	}
	
}
