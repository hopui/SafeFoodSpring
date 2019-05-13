package com.ssafy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.model.dto.TakenFood;
import com.ssafy.service.TakenFoodService;

@Controller
@CrossOrigin(origins = "*")
public class TakenFoodController
{
	private static final Logger logger = LoggerFactory.getLogger(TakenFoodController.class);
	
	@Autowired
	TakenFoodService service;
	
	@GetMapping("/takenfoods/{userEmail}")
	@ResponseBody
	public Map<String, List<TakenFood> > getTakenFoods(Model model, @PathVariable String userEmail)
	{
		logger.trace("takenfoods: {}", userEmail);
		Map<String, List<TakenFood> > map = new HashMap<>();
		map.put("takenFoodList", service.selectTakenFoods(userEmail));
		
		return map;
	}
}
