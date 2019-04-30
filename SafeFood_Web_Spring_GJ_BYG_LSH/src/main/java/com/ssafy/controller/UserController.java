package com.ssafy.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ssafy.model.dto.User;
import com.ssafy.service.UserService;

@Controller
public class UserController
{
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	@Autowired
	UserService service;

	// 1. 회원가입
	@GetMapping("/register")
	public String goRegisterForm(Model model)
	{
		return "Register";
	}
	@PostMapping("/register")
	public String doRegister(Model model, User user, RedirectAttributes redir, HttpServletRequest req, HttpServletResponse res)
	{
		try
		{
			// 1. 가입
			int result = service.register(user);
			// 2. 세션 등록
			HttpSession session = req.getSession();
			session.setAttribute("loginUser", user);
			// 3. 환영메시지 생성 
			redir.addFlashAttribute("alarm", "가입성공! 환영합니다."+user.getName()+"님");
		} catch(Exception e)
		{
			// 4. 에러처리
			logger.error("register error: {}",e);
			redir.addFlashAttribute("alarm", "가입 실패! 이미 존재하는 아이디입니다.");
		}
		// 5. 메인페이지로 보내기
		return "redirect:/main";
	}

	// 2. 로그인
	@PostMapping("/login")
	public String login(Model model, User account, HttpServletRequest req, RedirectAttributes redir)
	{
		logger.trace("Account: {}", account);
		User result = service.login(account.getEmail(), account.getPassword());
		if (result != null)
		{
			HttpSession session = req.getSession();
			session.setAttribute("loginUser", result);
			redir.addFlashAttribute("alarm", "로그인 성공! 어세오세요~ "+result.getName()+"님");
		} 
		else redir.addFlashAttribute("alarm", "로그인 실패! 이메일과 비밀번호를 확인해주세요!");
		
		return "redirect:/main";
	}

	// 3. 로그아웃
	@GetMapping("/session/logout")
	public String doLogout(HttpSession session, RedirectAttributes redir)
	{
		logger.trace("logout");
		session.invalidate();
		redir.addFlashAttribute("alarm", "성공적으로 로그아웃 되었습니다!");
		return "redirect:/main";
	}

	// 4. 비밀번호 찾기
	@GetMapping("/findPassword")
	public String goFindPassword(Model model)
	{
		return "findPassword";
	}
	@PostMapping("/findPassword")
	public String doFindPassword(Model model, String email, RedirectAttributes redir)
	{
		User user = service.select(email);
		logger.trace("findPassword: {}", email);
		if(user != null)
		{
			redir.addFlashAttribute("findedPassword", user.getPassword());
			redir.addFlashAttribute("alarm", "검은상자에 마우스를 올려보세요~");
		} 
		else redir.addFlashAttribute("alarm", "존재하지 않는 아이디입니다!");
		
		return "redirect:findPassword";
	}
	
	// 5. 회원정보 상세보기
	@GetMapping("/session/userInfo")
	public String goUserInfo(Model model)
	{
		return "session/UserInfo";
	}
	
	// 6. 회원정보 수정
	@GetMapping("/session/modifyUserInfo")
	public String goModifyForm(Model model)
	{
		return "session/ModifyUserInfo";
	}
	@PostMapping("/session/modifyUserInfo")
	public String doModify(Model model, User user, RedirectAttributes redir, HttpSession session)
	{
		try
		{
			logger.trace("modfiy: {}", user);
			int result = service.update(user);
			session.setAttribute("loginUser", user); // 변경된 정보로 세션 갱신
			redir.addFlashAttribute("alarm", "수정성공!");
		} catch(Exception e)
		{
			logger.error("modify error: {}", e);
			redir.addFlashAttribute("alarm", "수정실패!");
		}
		
		return "redirect:/main";
	}
	
	// 7. 회원탈퇴
	@GetMapping("/session/dropUserInfo")
	public String dropUser(Model model, String email, RedirectAttributes redir, HttpSession session)
	{
		try
		{
			logger.trace("dropUserInfo: {}", email);
			int result = service.delete(email);
			session.invalidate();
			redir.addFlashAttribute("alarm", "성공적으로 탈퇴되었습니다.");
		} catch(Exception e) 
		{
			logger.error("dropUserInfo Error: {}", e);
			redir.addFlashAttribute("alarm", "오류로 인해 삭제에 실패했습니다.");
		}
		return "redirect:/main";
	}
}
