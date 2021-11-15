<%@page import="com.example.domain.Criteria"%>
<%@page import="com.example.domain.AttachVO"%>
<%@page import="com.example.repository.AttachDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="com.example.domain.*"%>
<%@page import="com.example.repository.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");
	// 상세보기 글번호 파라미터값 가져오기
	int num			= Integer.parseInt(request.getParameter("num"));
	int pageNum		= Integer.parseInt(request.getParameter("PageNum"));
	String keyword 	= request.getParameter("keyword");
	String type    	= request.getParameter("type");
	if(type == null){
		type = "";
	}
	
	if(keyword == null){
		keyword = "";
	}
	// DAO객체 준비
	CusbodDAO 	cusbodDAO	 = CusbodDAO.getInstance();
	
	// DB 게시글 정보 삭제하기
	cusbodDAO.delete(num, "A");
	
	
	
	// 글목록 boardList.jsp로 이동
	response.sendRedirect("/notice/noticeList.jsp?PageNum=" + pageNum + "&type=" + type + "&keyword=" + keyword);
%>