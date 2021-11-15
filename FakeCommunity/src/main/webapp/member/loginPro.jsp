<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.example.domain.CususrVO"%>
<%@page import="com.example.repository.CususrDAO"%>
<%
	String 		id 			= request.getParameter("id");
	String 		pw			= request.getParameter("password");
	String 		rememberMe 	= request.getParameter("rememberMe");
	CususrDAO	cususrDAO	= CususrDAO.getInstance();
	CususrVO  	cususrVO  	= cususrDAO.select(id);
	
	if(cususrVO != null){ // 일치
		// 로그인처리
		// 사용자 당 유지되는 세션객체에 기억할 데이터를 저장
		session.setAttribute("sessionid", id);
	
		// 사용자가 로그인 상태유지를 체크했으면
		if(rememberMe != null){
			// 쿠키 생성
			Cookie cookie = new Cookie("loginId", id);
			// 쿠키 요효시간(유통기간) 설정
			//cookie.setMaxAge(600); // 초단위로 설정. 10분 60초 * 10
			cookie.setMaxAge(60 * 60 * 24 * 7); // 일주일 설정
			// 쿠키 경로설정
			cookie.setPath("/"); // 프로젝트 모든 경로에서 쿠키 받도록 설정
			
			// 클라이언트로 보낼 쿠기를 response 웅답객체에 추가하기. -> 응답시 쿠키도 함께 보냄.
			response.addCookie(cookie);
		}
	
		// index.jsp 페이지로 이동하기
		// 리다이렉트 : 서버가 시킨대로 재요청하는 주소
		response.sendRedirect("/index.jsp");
	} else {
%>
		<script>
			alert('아이디 없음');
			history.back(); // 뒤로가기
		</script>
<%		
	}
%>