package com.ssafy.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

//@Controller
public class MainController
{
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@GetMapping("/main")
	public String main(Model model)
	{
		/*
		 * String tmp = request.getParameter("action");
		 * request.setAttribute("foods", service.getAll()); if (tmp != null) {
		 * request.setAttribute("foodlist", 1); } RequestDispatcher disp =
		 * request.getRequestDispatcher("index.jsp"); disp.forward(request,
		 * response);
		 */
		return null;
	}
}
