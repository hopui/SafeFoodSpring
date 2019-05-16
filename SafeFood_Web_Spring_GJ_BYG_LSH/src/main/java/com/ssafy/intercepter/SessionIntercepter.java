package com.ssafy.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ssafy.model.dto.User;

@Component
public class SessionIntercepter extends HandlerInterceptorAdapter 
{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception
	{
		HttpSession session = request.getSession();
		User loginUser = (User)session.getAttribute("loginUser");
		if(loginUser != null)
		{
			return true;
		}
		else
		{
			response.sendRedirect(request.getContextPath());
			return false;
		}
	}
}