package com.ssafy.service;

import java.util.List;

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
}