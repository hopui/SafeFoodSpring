package com.ssafy.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.ssafy.service.FoodService;

@Controller
@CrossOrigin(origins="*")
public class MainController
{
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	FoodService service;
	
	@GetMapping("/main")
	public String goMain(Model model)
	{
		model.addAttribute("foods",service.selectAll());
		return "index";
	}
	
	@GetMapping("/qna")
	public String goQna(Model model)
	{
		return "/qna";
	}
	
	@GetMapping("/form")
	public String goForm(Model model)
	{
		return "form";
	}

	@GetMapping("/session/writeQna")
	public String goWriteQna(Model model)
	{
		return "session/writeQna";
	}
	
	@GetMapping("/readDetail/{num}")
	public String goReadQnaDetail(Model model, @PathVariable int num)
	{
		model.addAttribute("num", num);
		return "/readQnaDetail";
	}
	
	@GetMapping("/session/modifyQna/{num}")
	public String goModifyQna(Model model, @PathVariable int num)
	{
		model.addAttribute("num", num);
		return "/session/modifyQna";
	}
}
