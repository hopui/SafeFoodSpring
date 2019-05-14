package com.ssafy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.model.dto.TakenFood;
import com.ssafy.model.dto.User;
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
	public Map<String, Object> getSearchSort(Model model, HttpServletRequest req, HttpSession session) 
	{
		String email = ((User)session.getAttribute("loginUser")).getEmail();
		String year = req.getParameter("year");
		String month = req.getParameter("month");
		
		Map<String, Object> map = new HashMap<>();
		List<TakenFood> list = service.selectTakenFoods(email, year, month);
		map.put("list", list);
		return map;
	}
	
	@DeleteMapping("/session/takenfoods/delete/{foodCode}")
	public ResponseEntity<Integer> empDelete(@PathVariable String foodCode, HttpSession session)
	{
		String email = ((User)session.getAttribute("loginUser")).getEmail();
		Integer result = service.deleteTakenFood(email, foodCode);
		
		ResponseEntity<Integer> ent;
		if( result>-1) {
			ent=new ResponseEntity<>(result, HttpStatus.OK);	//200
		}else {
			ent=new ResponseEntity<>(result, HttpStatus.NO_CONTENT); //204
		}
		return ent;
	}
}