package com.ssafy.controller;

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

@Controller
@CrossOrigin(origins = "*")
public class FoodController {
	private static final Logger logger = LoggerFactory.getLogger(FoodController.class);

	@Autowired
	FoodService service;

	@GetMapping("/search")
	public String allInfo(Model model) {
		
		return "index";
	}
	
	@ResponseBody
	@GetMapping("/food/{page}")
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
	public String getDetail(Model model, @PathVariable int code) {
		model.addAttribute("haccp", service.selectCode(code));
		return "food_detail";
	}

	@GetMapping("/detail/{code}/modi")
	public String getDetailMy(Model model, @PathVariable int code) {
		model.addAttribute("action", "modi");
		model.addAttribute("food", service.selectCode(code));
		return "food_detail";
	}

	@PostMapping("/search")
	public String getSearch(Model model, String sort, String search_text) {
		
		return "index";
	}

	@GetMapping("/session/myTakenInfo")
	public String doMyTakenInfo(Model model, HttpSession session) {
		User user = (User) session.getAttribute("loginUser");
		List<Food> list = service.selectMyfoodAll(user.getEmail());
		long sum[] = new long[9];

		for (Food f : list) {
			Integer quantity = (Integer) service.selectQuantity(user.getEmail(), String.valueOf(f.getCode()));
			f.setQuantity(quantity);
			sum[0] += f.getCalory() * quantity;
			sum[1] += f.getCarbo() * quantity;
			sum[2] += f.getProtein() * quantity;
			sum[3] += f.getFat() * quantity;
			sum[4] += f.getSugar() * quantity;
			sum[5] += f.getNatrium() * quantity;
			sum[6] += f.getChole() * quantity;
			sum[7] += f.getFattyacid() * quantity;
			sum[8] += f.getTransfat() * quantity;
		}
		model.addAttribute("foods", list);
		model.addAttribute("nutriSum", sum);
		return "session/MyTakenInfo";
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