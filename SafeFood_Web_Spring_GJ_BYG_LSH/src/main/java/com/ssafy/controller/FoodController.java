package com.ssafy.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;
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
	public Map<String, Object> foodDB(@PathVariable int page) {

		Map<String, Object> map = new HashMap<>();
		List<Food> list = service.selectAll(page);
		map.put("list", list);
		map.put("maxCount", list.size());
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
		if (kind.equals("maincomp")) {
			System.out.println(sort + ":" + search_text);
			String apiurl = "http://apis.data.go.kr/B553748/CertImgListService/getCertImgListService?ServiceKey=";
			String key = "JHiCkjVmT8kUFVm183Ggm3ln1sDuay3V2EWzhmda%2B4773P90DoYKR7iFlXsTGiD6EJlntiX9UsmMtGpOjVTxIA%3D%3D&returnType=json";
			String page = "&pageNo=";
			String option = null;
			try {
				option = "&" + sort + "=" + URLEncoder.encode(search_text, "utf-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			model.addAttribute("comp", "maincomp");
			model.addAttribute("methodurl", apiurl + key + option + page);
		} else {
			model.addAttribute("sort", sort);
			model.addAttribute("search_text", search_text);
			model.addAttribute("comp", "tablecomp");
		}

		return "index";
	}

	@GetMapping("/search/{sort}/{search_text}/{pageNo}")
	@ResponseBody
	public Map<String, Object> getSearchSort(Model model, @PathVariable String sort, @PathVariable String search_text,
			@PathVariable int pageNo) {
		Map<String, Object> map = new HashMap<>();
		List<Food> list = new ArrayList<Food>();
		try {

			if (sort.equals("name"))
				list = service.selectSortName(URLDecoder.decode(search_text, "utf-8"));
			else if (sort.equals("food_group"))
				list = service.selectSortGroup(URLDecoder.decode(search_text, "utf-8"));
			else
				list = service.selectSortMaker(URLDecoder.decode(search_text, "utf-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		map.put("list", list);
		return map;
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
	public String doInsert(String eat, String quantity, int haccp , String name,
			HttpSession session, RedirectAttributes redir) {
		User user = (User) session.getAttribute("loginUser");

		if (quantity != null && !quantity.trim().equals("")) {
			int result = service.insertMyfood(user.getEmail(), eat, Integer.parseInt(quantity),haccp,name);
			
			if (result > 0)
				redir.addFlashAttribute("alarm", "섭취 등록 성공했습니다.");
			else
				redir.addFlashAttribute("alarm", "섭취 등록 실패했습니다.");
		}
		
		if(haccp > 0)
			return "redirect:/detail/haccp/" + eat;
		else 
			return "redirect:/detail/"+eat;

	}
}
