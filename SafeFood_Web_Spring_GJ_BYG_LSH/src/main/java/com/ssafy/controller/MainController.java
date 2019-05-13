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
{//
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	FoodService service;
	
	@GetMapping("/main")
	public String goMain(Model model)
	{
		String apiurl = "http://apis.data.go.kr/B553748/CertImgListService/getCertImgListService?ServiceKey=";
		String key = "JHiCkjVmT8kUFVm183Ggm3ln1sDuay3V2EWzhmda%2B4773P90DoYKR7iFlXsTGiD6EJlntiX9UsmMtGpOjVTxIA%3D%3D&returnType=json";
		String page="&pageNo=";
		model.addAttribute("comp","maincomp");
		model.addAttribute("methodurl",apiurl+key+page);
		return "index";
	}
	
	@GetMapping("/table")
	public String goTableFood(Model model)
	{
		model.addAttribute("comp","tablecomp");
		model.addAttribute("search",new String[2]);
		return "index";
	}
	
	@GetMapping("/notice")
	public String goQna(Model model)
	{
		return "/notice";
	}

	@GetMapping("/session/writeNotice")
	public String goWriteQna(Model model)
	{
		return "session/writeNotice";
	}
	
	@GetMapping("/readDetail/{num}")
	public String goReadQnaDetail(Model model, @PathVariable int num)
	{
		model.addAttribute("num", num);
		return "/readNoticeDetail";
	}
	
	@GetMapping("/session/modifyNotice/{num}")
	public String goModifyQna(Model model, @PathVariable int num)
	{
		model.addAttribute("num", num);
		return "/session/modifyNotice";
	}
}
