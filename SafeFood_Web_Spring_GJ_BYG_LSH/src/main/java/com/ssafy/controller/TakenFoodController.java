package com.ssafy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
	
	@GetMapping("/session/takenfoods")
	@ResponseBody
	public Map<String, Object> getSearchSort(Model model, HttpServletRequest req) 
	{
		// 이메일의 경우 .com 과 같이 닷 뒤의 문자열들이 확장자로 인식이 되어버리기 때문에... 따로 분리시켜서 받아와야함
		String email = req.getParameter("email");
		String dot = req.getParameter("dot");
		email += "."+dot;

		String year = req.getParameter("year");
		String month = req.getParameter("month");
		
		Map<String, Object> map = new HashMap<>();
		List<TakenFood> list = service.selectTakenFoods(email, year, month);
		map.put("list", list);
		return map;
	}
}
