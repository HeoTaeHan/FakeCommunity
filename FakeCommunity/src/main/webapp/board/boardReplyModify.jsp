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
	int 	conum	= Integer.parseInt(request.getParameter("conum"));
	int 	num		= Integer.parseInt(request.getParameter("num"));
	
	// DAO객체 준비
	CsreplDAO 	csreplDAO 	= CsreplDAO.getInstance();
	CsreplVO	csreplVO	= new CsreplVO();
	
	if(csreplDAO.count(num, conum) != 0){
		csreplVO = csreplDAO.select(num, conum);
		csreplVO.setCdate(new Timestamp(System.currentTimeMillis()));
		csreplVO.setTrmid(request.getRemoteAddr());
		csreplVO.setCnten(request.getParameter("cnten"));
		csreplDAO.update(csreplVO);
	}
	
	
	response.sendRedirect("/board/boardContent.jsp?PageNum=" + PageNum + "&num=" + num + "&type=" + type + "&keyword=" + keyword + "&cusid=" + cusid);
%>