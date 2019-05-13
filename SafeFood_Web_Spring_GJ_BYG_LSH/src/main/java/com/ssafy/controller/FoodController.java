package com.ssafy.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.User;
import com.ssafy.service.FoodService;
//
@Controller
@CrossOrigin(origins = "*")
public class FoodController {
	private static final Logger logger = LoggerFactory.getLogger(FoodController.class);

	@Autowired
	FoodService service;
	
	@GetMapping("/food/{page}")
	@ResponseBody
	public Map<String, List<Food>> foodDB(@PathVariable int page) {
		
		Map<String, List<Food>> map = new HashMap<>();
		map.put("list", service.selectAll(page));
		return map;
	}

	// pathvarable 방식 restful ip
	@GetMapping("/detail/{code}")
	public String getTest(Model model, @PathVariable int code) {
		model.addAttribute("food", service.selectCode(code));
		return "food_detail";
	}

	// pathvarable 방식 restful ip
	@GetMapping("/detail/haccp/{code}")
	public String getDetail(Model model, @PathVariable String code) {
		model.addAttribute("haccp", code);
		return "food_haccp";
	}

	@GetMapping("/detail/{code}/modi")
	public String getDetailMy(Model model, @PathVariable int code) {
		model.addAttribute("action", "modi");
		model.addAttribute("food", service.selectCode(code));
		return "food_detail";
	}

	@GetMapping("/search")
	public String getSearch(Model model, String sort, String search_text, String kind) {
		if(kind.equals("maincomp")) {
			System.out.println(sort+":"+search_text);
			String apiurl = "http://apis.data.go.kr/B553748/CertImgListService/getCertImgListService?ServiceKey=";
			String key = "JHiCkjVmT8kUFVm183Ggm3ln1sDuay3V2EWzhmda%2B4773P90DoYKR7iFlXsTGiD6EJlntiX9UsmMtGpOjVTxIA%3D%3D&returnType=json";
			String page="&pageNo=";
			String option=null;
			try {
				option = "&"+sort+"="+URLEncoder.encode(search_text,"utf-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			model.addAttribute("comp","maincomp");
			model.addAttribute("methodurl",apiurl+key+option+page);
		}
		
		return "index";
	}

	@PostMapping("/session/modify")
	public String doInsert(String eat, String quantity, String delete, HttpSession session, RedirectAttributes redir) {
		User user = (User) session.getAttribute("loginUser");

		if (eat != null) {
			if (quantity != null && !quantity.trim().equals("")) {
				if (service.insertMyfood(user.getEmail(), eat, Integer.parseInt(quantity)) > 0)
					redir.addFlashAttribute("alarm", "섭취 등록 성공했습니다.");
				else
					redir.addFlashAttribute("alarm", "섭취 등록 실패했습니다.");
				return "redirect:/detail/" + eat;
			}
		}

		if (service.deleteMyfood(user.getEmail(), delete) > 0)
			redir.addFlashAttribute("alarm", "식품 삭제 성공했습니다.");
		else
			redir.addFlashAttribute("alarm", "식품 삭제 실패했습니다.");
		return "redirect:/session/myTakenInfo";
	}
}