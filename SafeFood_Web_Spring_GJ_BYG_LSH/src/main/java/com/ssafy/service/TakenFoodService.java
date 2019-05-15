package com.ssafy.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.model.dto.TakenFood;
import com.ssafy.repository.TakenFoodRepo;

@Transactional
@Service
public class TakenFoodService
{
	@Autowired
	TakenFoodRepo dao;
	
	public TakenFoodService(){}
	public TakenFoodService(TakenFoodRepo dao)
	{
		this.dao = dao;
	}
	
	public List<TakenFood> selectTakenFoods(String userEmail, String year, String month) {
		return dao.selectTakenFoods(userEmail, year, month);
	}
	
	public int insertTakenFood(String userEmail) {
		return dao.insertTakenFood(userEmail);
	}
	
	public int deleteTakenFood(String userEmail, String foodCode) {
		return dao.deleteTakenFood(userEmail, foodCode);
	}
	
	public int updateTakenFood(String userEmail, String quantity, String foodCode, Date takenTime) {
		return dao.updateTakenFood(userEmail, quantity, foodCode, takenTime);
	}
	
	public List<Map<String, Object> > selectTop3Foods(String userEmail) {
		return dao.selectTop3Foods(userEmail);
	}
}