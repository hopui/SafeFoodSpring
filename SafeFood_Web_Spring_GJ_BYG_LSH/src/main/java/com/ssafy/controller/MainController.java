package com.ssafy.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ssafy.service.FoodService;

@Controller
public class MainController
{
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	FoodService service;
	
	@GetMapping("/main")
	public String goMain(Model model)
	{
		model.addAttribute("foods",service.selectAll());
		return "/index";
	}
	
	@GetMapping("/session/myTakenInfo")
	public String doMyTakenInfo(Model model)
	{
		return "redirect:session/MyTakenInfo";
	}
}
