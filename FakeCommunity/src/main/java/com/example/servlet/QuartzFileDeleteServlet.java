package com.example.servlet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;


@WebServlet(loadOnStartup = 1, urlPatterns = "")
public class QuartzFileDeleteServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		
		System.out.println("=== 배치 프로그램 시작됨 ===");

	} // end of init
} // end of QuartzFileDeleteServlet