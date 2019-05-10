package com.ssafy.controller;

import java.util.List;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.User;
import com.ssafy.service.FoodService;

@Controller
@CrossOrigin(origins="*")
public class FoodController {
	private static final Logger logger = LoggerFactory.getLogger(FoodController.class);

	@Autowired
	FoodService service;
	
	@GetMapping("/insert/food")
	public String insertfood(Model model, String name, String calory, String carbo, String protein, String fat, 
			String foodGroup, String code, String supportpereat, String transfat, String fattyacid, String chole, String natrium, String sugar, String maker) {
		
		double d[] = new double[10];
		
		if(calory.equals("N/A"))
			d[1] =0;
		if(carbo.equals("N/A"))
			d[2] =0;
		if(protein.equals("N/A"))
			d[3] =0;
		if(fat.equals("N/A"))
			d[4] =0;
		if(sugar.equals("N/A"))
			d[5] =0;
		if(natrium.equals("N/A"))
			d[6] =0;
		if(chole.equals("N/A"))
			d[7] =0;
		if(fattyacid.equals("N/A"))
			d[8] =0;
		if(transfat.equals("N/A"))
			d[9] =0;
		
		Food food = new Food(Integer.parseInt(code),
				name, 
				Integer.parseInt(supportpereat), Double.valueOf(d[1]), Double.valueOf(d[2]), Double.valueOf(d[3]),
				Double.valueOf(d[4]), Double.valueOf(d[5]), Double.valueOf(d[6]), Double.valueOf(d[7]),
				Double.valueOf(d[8]), Double.valueOf(d[9]), maker, foodGroup);
		service.insertfood(food);
		return "index";
	}
	

	@GetMapping("/search")
	public String allInfo(Model model) {
		model.addAttribute("foods", service.selectAll());
		model.addAttribute("foodlist", "전체");
		return "index";
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
		search_text = search_text.trim();

		if (search_text == null || search_text.equals("")) {
			model.addAttribute("foods", service.selectAll());
		} else {
			switch (sort) {
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
		model.addAttribute("foodlist", "검색");
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