package com.ssafy.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ssafy.model.dto.Account;
import com.ssafy.service.AccountService;

@Controller
public class UserController
{
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	// TODO 10: 모델과 연결을 위한 서비스 주입
	@Autowired
	AccountService service;

	// TODO 11: /join --> /WEB-INF/ user/joinform .jsp
	@GetMapping("/join")
	public String joinForm(Model model)
	{
		return "user/joinform";
	}
	// TODO 13: 회원 가입 처리
	@PostMapping("/join")
	public String join(Model model, RedirectAttributes redir, Account account)
	{
		int result = service.join(account);
		logger.trace("join: {}", result);
		redir.addFlashAttribute("alarm", "가입 성공, 로그인 후 사용");
		return "redirect:login";
	}

	// TODO 14: 로그인 폼 제공
	@GetMapping("/login")
	public String loginForm(Model model, @CookieValue(required = false) String loginUser, HttpSession session)
	{
		logger.trace("login cookie: {}", loginUser);
		// 쿠키가 있다? --> 로그인 경험 있다. --> 세션 등록 후 main으로
		if (loginUser != null)
		{
			Account account = service.select(loginUser);
			session.setAttribute("loginUser", account);
			return "session/main";
		} else
		{
			// 쿠키가 없다? --> 로그인 필요. --> 폼 제공 --> TODO 15
			return "user/loginform";
		}
	}

	// TODO 16 	
	@PostMapping("/login")
	public String login(Model model, Account account, HttpServletResponse res, HttpSession session) {
		logger.trace("Account: {}", account);
		Account result = service.login(account.getEmail(), account.getPassword());
		if (result != null) {
			Cookie cookie = new Cookie("loginUser", result.getEmail());
			cookie.setPath("/");	// 다양한 경로에서 접근할 것에 대비 path 설정
			cookie.setMaxAge(60 * 2);
			res.addCookie(cookie);
			session.setAttribute("loginUser", result);
			return "redirect:/session/main";// --> TODO 17
		} else {
			return "redirect:login";
		}
	}
	// TODO: 17
	@GetMapping("/session/main")
	public String main(Model model)
	{
		return "session/main";
	}
	// TODO: 18 회원 수정 폼 제공
	@GetMapping("/session/modify")
	public String modifyForm(Model model)
	{
		return "session/modifyform";
	}
	// TODO: 20 회원 정보 수정 처리
	@PostMapping("/session/modify")
	public String modify(Model model, RedirectAttributes redir, Account account, HttpSession session)
	{
		service.update(account);
		session.setAttribute("loginUser", account);
		redir.addFlashAttribute("alarm", "수정성공");
		return "redirect:/session/main";
	}

	// TODO: 21 회원 탈퇴처리
	@GetMapping("/session/logout")
	public String logout(HttpServletResponse res, HttpSession session)
	{
		Cookie cookie = new Cookie("loginUser", "some");
		cookie.setMaxAge(0);
		cookie.setPath("/");
		res.addCookie(cookie);
		session.invalidate();
		logger.trace("logout: {}", cookie);
		return "redirect:/login";
	}
}
