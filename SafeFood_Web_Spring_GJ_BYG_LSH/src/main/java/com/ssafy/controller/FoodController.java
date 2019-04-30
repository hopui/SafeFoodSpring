package com.ssafy.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.ssafy.service.FoodService;

@Controller
public class FoodController
{
	private static final Logger logger = LoggerFactory.getLogger(FoodController.class);
	
	@Autowired
	FoodService service;
	
	
	@GetMapping("/search")
	public String allInfo(Model model) {
		model.addAttribute("foods", service.selectAll());
		model.addAttribute("foodlist","전체");
		return "index";
	}
	
	//pathvarable 방식 restful ip
	@GetMapping("/detail/{code}")
	public String getTest(Model model, @PathVariable int code) {
		model.addAttribute("food",service.selectCode(code));
		return "food_detail";
	}
	
	@PostMapping("/search")
	public String getSearch(Model model, String sort, String search_text) {
		search_text = search_text.trim();
		
		if(search_text == null || search_text.equals(""))
		{	
			model.addAttribute("foods", service.selectAll());
		}else {
			switch(sort) {
			case "productname":
				model.addAttribute("foods", service.selectName(search_text));
				break;
			case "maker":
				model.addAttribute("foods", service.selectMaker(search_text));
				break;
			case "material":
				model.addAttribute("foods", service.selectMaterial(search_text));
				break;
			}
		}
		model.addAttribute("foodlist","검색");
		return "index";
	}
}
