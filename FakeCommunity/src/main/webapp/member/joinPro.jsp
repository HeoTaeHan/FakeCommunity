<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.example.repository.CususrDAO"%>
<%@page import="org.mindrot.jbcrypt.BCrypt"%>
<jsp:useBean id="cususr" class="com.example.domain.CususrVO"/>
<jsp:setProperty property="*" name="cususr"/>
<%
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	String phone  = phone1 + phone2 + phone3;
	String email  = email1 + "@" + email2;
	cususr.setCdate(new Timestamp(System.currentTimeMillis()));

	// 생년월일 문자열에서 하이픈(-) 기호 제거하기
	String birthday = cususr.getBirth();
	birthday = birthday.replaceAll("-", ""); // 하이픈 문자열을 빈문자열로 대체
	cususr.setBirth(birthday);
	
	cususr.setPhone(phone);
	cususr.setEmail(email);
	
	CususrDAO cusrDao = CususrDAO.getInstance();
	
	cusrDao.insert(cususr);
%>
<script>
	alert('회원가입 성공');
	location.href = '/member/login.jsp'; // 로그인 화면 요청
</script>