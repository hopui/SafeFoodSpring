package com.ssafy.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.LikeFood;
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
	
	public List<Food> selectMyFoodToday(String email) {
		return dao.selectMyfoodAll(email);
	}
	public List<LikeFood> selectLikeAll(String email) {
		return dao.selectLikeAll(email);
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

	public Object checkLikefood(String email, String code) {
		return dao.checkLikefood(email, code);
	}
	public int insertMyfood(String email, String code, int quantity, int haccp, String name) {
		return dao.insertMyfood(email, code, quantity,haccp, name);
	}
	
	public int insertLikefood(String email, String name, String code, int haccp, String group) {
		return dao.insertLikefood(email, name, code, haccp,group);
	}
	public int updateMyfood(String email, String code, int quantity) {
		return dao.updateMyfood(email, code, quantity);
	}
	
	public int deleteLikefood(String email, String code) {
		return dao.deleteLikefood(email, code);
	}
	
	public int deleteMyfoodForUser(String email) {
		return dao.deleteMyfoodForUser(email);
	}
	
	public Object selectQuantity(String email, String code) {
		return dao.selectQuantity(email, code);
	}
	
	public List<LikeFood> selectHitAll(String email) {
		return dao.selectHitAll(email);
	}
	
	public Object selectHit(String email, String code) {
		return dao.selectHit(email, code);
	}
	
	public int insertHit(String email, String code, int haccp, String name) {
		return dao.insertHit(email, code,haccp,name);
	}
	
	public int updateHit(String email, String code, int hit) {
		return dao.updateHit(email, code,hit);
}
	
}
