<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.example.domain.CususrVO"%>
<%@page import="com.example.repository.CususrDAO"%>
<%
	String 		cusid		= request.getParameter("cusid");
	String      reslt       = request.getParameter("reslt");
	CususrDAO 	cususrDAO 	= CususrDAO.getInstance();
	CususrVO	cususrVO    = cususrDAO.select(cusid);
	String      result      = cususrVO.getReslt();
	
	if(result.equals(reslt)){
%>
		<script>
			location.href ='/member/pwFindSuccess.jsp?cusid=<%=cusid%>';
		</script>
<%		
	} else {
%>
		<script>		
			alert("비밀번호 확인의 답변과 일치하지 않습니다.");
			history.go(-1);
		</script>
<%
	}
%>