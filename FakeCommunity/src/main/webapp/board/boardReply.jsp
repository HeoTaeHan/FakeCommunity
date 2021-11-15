<%@page import="java.sql.Timestamp"%>
<%@page import="com.example.domain.CsreplVO"%>
<%@page import="com.example.repository.CsreplDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String 	id		= (String) session.getAttribute("sessionid");
	String 	keyword	= request.getParameter("keyword");
	String 	PageNum = request.getParameter("PageNum");
	String 	type    = request.getParameter("type");
	String  cusid   = request.getParameter("cusid");
	int 	num		= Integer.parseInt(request.getParameter("num"));
	
	// DAO객체 준비
	CsreplDAO 	csreplDAO 	= CsreplDAO.getInstance();
	CsreplVO	csreplVO	= new CsreplVO();
	
	int conum = csreplDAO.getMaxConum(num);
	
	csreplVO.setCsnum(num);
	csreplVO.setCtype("I");
	csreplVO.setConum(conum);
	csreplVO.setCusid(id);
	csreplVO.setCrerf(conum);
	csreplVO.setCrelv(0);
	csreplVO.setCresq(0);
	csreplVO.setCnten(request.getParameter("cnten"));
	csreplVO.setCdate(new Timestamp(System.currentTimeMillis()));
	csreplVO.setTrmid(request.getRemoteAddr());
	
	csreplDAO.insert(csreplVO);
	
	response.sendRedirect("/board/boardContent.jsp?PageNum=" + PageNum + "&num=" + num + "&type=" + type + "&keyword=" + keyword + "&cusid=" + cusid);
%>