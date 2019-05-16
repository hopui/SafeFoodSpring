package com.ssafy.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Base64.Decoder;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.LikeFood;
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
	public String getTest(Model model, @PathVariable int code, HttpSession session) {
		User user = (User) session.getAttribute("loginUser");
		Food food = (Food)service.selectCode(code);
		if (user != null) {
			service.insertHit(user.getEmail(), String.valueOf(code), 0, food.getName());
		}
		model.addAttribute("food", service.selectCode(code));
		return "food_detail";
	}

	// pathvarable 방식 restful ip
	@GetMapping("/detail/haccp/{code}/{name}")
	public String getDetail(Model model, @PathVariable String code,  @PathVariable String name,HttpSession session) {
		User user = (User) session.getAttribute("loginUser");
		if (user != null) {
			service.insertHit(user.getEmail(), code, 1, name);
		}
		model.addAttribute("haccp", code);
		return "food_haccp";
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

	@RequestMapping(value = "/session/likefood/haccp/{id}/{name}", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> doMyLikefood(HttpSession session, @PathVariable String id, @PathVariable String name) {
		User user = (User) session.getAttribute("loginUser");
		char c = name.charAt(name.length() - 1);
		name = name.substring(0, name.length() - 1);

		Map<String, Object> map = new HashMap<>();
		int result = -1;

		if (c == 'c') {
			result = (int) service.checkLikefood(user.getEmail(), id);
		} else
			result = service.insertLikefood(user.getEmail(), name, id, 1, null);

		map.put("result", result);
		return map;
	}

	@GetMapping(value = "/session/likefood/{id}/{name}/{group}")
	@ResponseBody
	public Map<String, Object> doMyLikeFood2(HttpSession session, @PathVariable String id, @PathVariable String name,
			@PathVariable String group) {
		User user = (User) session.getAttribute("loginUser");
		char c = name.charAt(name.length() - 1);
		name = name.substring(0, name.length() - 1);

		Map<String, Object> map = new HashMap<>();
		int result = -1;

		if (c == 'c') {
			result = (int) service.checkLikefood(user.getEmail(), id);
		} else
			result = service.insertLikefood(user.getEmail(), name, id, 0, group);

		map.put("result", result);
		return map;
	}

	@GetMapping("/session/myTakenInfo")
	public String doMyTakenInfo(Model model, HttpSession session) {
		User user = (User) session.getAttribute("loginUser");
		List<Food> flist = service.selectMyFoodToday(user.getEmail());
		long nutriToday[] = new long[9];
		for(Food f : flist) {
			Integer quan = (Integer)service.selectQuantity(user.getEmail(),String.valueOf( f.getCode()));
			f.setQuantity(quan);
			nutriToday[0]+=(f.getCalory()*quan);
			nutriToday[1]+=(f.getCarbo()*quan);
			nutriToday[2]+=(f.getProtein()*quan);
			nutriToday[3]+=(f.getFat()*quan);
			nutriToday[4]+=(f.getSugar()*quan);
			nutriToday[5]+=(f.getNatrium()*quan);
			nutriToday[6]+=(f.getChole()*quan);
			nutriToday[7]+=(f.getFattyacid()*quan);
			nutriToday[8]+=(f.getTransfat()*quan);
		}				
		session.setAttribute("nutri", nutriToday);	
		List<Food> list = service.selectMyfoodAll(user.getEmail());
		model.addAttribute("foods", list);
		return "session/MyTakenInfo";
	}

	@GetMapping("/session/likelist")
	@ResponseBody
	public Map<String, Object> doMyLike(Model model, HttpSession session) {
		Map<String, Object> map = new HashMap<>();
		User user = (User) session.getAttribute("loginUser");
		List<LikeFood> Llist = service.selectLikeAll(user.getEmail());
		List<String> img = new ArrayList<>();

		for (int i = 0; i < Llist.size(); i++) {
			LikeFood f = Llist.get(i);
			img.add(f.getImg(f.getFoodGroup()));
		}

		map.put("mylike", Llist);
		map.put("img", img);
		return map;
	}
	
	@GetMapping("/session/nextfood/{code}")
	@ResponseBody
	public Map<String, Object> likeChart(Model model, @PathVariable int code) {

		Map<String, Object> map = new HashMap<>();
		Food f = (Food) service.selectCode(code);
		map.put("kcal",f.getCalory());
		map.put("tan",f.getCarbo());
		map.put("dan",f.getProtein());
		map.put("gi",f.getFat());
		map.put("dang",f.getSugar());
		map.put("na",f.getNatrium());
		map.put("col",f.getChole());
		map.put("fat",f.getFattyacid());
		map.put("trans",f.getTransfat());
		
		return map;
	}

	@PostMapping("/session/modify")
	public String doInsert(String code, String quantity, int haccp, String name, String allergy,
			HttpSession session,RedirectAttributes redir) {
		User user = (User) session.getAttribute("loginUser");
		System.out.println(quantity);
		boolean check = true;
		if (Integer.parseInt(quantity) < 1) {
			quantity = "1";
			check = false;
		}
		
		if (quantity != null && !quantity.trim().equals("")) {
			int result = service.insertMyfood(user.getEmail(), code, Integer.parseInt(quantity), haccp, name,allergy);

			if (result > 0) {
				List<Food> flist = service.selectMyFoodToday(user.getEmail());
				long nutriToday[] = new long[9];
				for(Food f : flist) {
					Integer quan = (Integer)service.selectQuantity(user.getEmail(),String.valueOf( f.getCode()));
					f.setQuantity(quan);
					nutriToday[0]+=(f.getCalory()*quan);
					nutriToday[1]+=(f.getCarbo()*quan);
					nutriToday[2]+=(f.getProtein()*quan);
					nutriToday[3]+=(f.getFat()*quan);
					nutriToday[4]+=(f.getSugar()*quan);
					nutriToday[5]+=(f.getNatrium()*quan);
					nutriToday[6]+=(f.getChole()*quan);
					nutriToday[7]+=(f.getFattyacid()*quan);
					nutriToday[8]+=(f.getTransfat()*quan);
				}				
				session.setAttribute("nutri", nutriToday);		
				redir.addFlashAttribute("alarm", "섭취 등록 성공했습니다.");
			
			}else
				redir.addFlashAttribute("alarm", "섭취 등록 실패했습니다.");
		}

		if (check) {
			if (haccp > 0) {
				try {
					return "redirect:/detail/haccp/" + code+"/"+URLEncoder.encode(name,"utf-8");
				} catch (UnsupportedEncodingException e) {
					return "redirect:/detail/haccp/" + code+"/";
				}
			}
			else
				return "redirect:/detail/" + code;
		} else
			return "redirect:/session/myTakenInfo";

	}
}
