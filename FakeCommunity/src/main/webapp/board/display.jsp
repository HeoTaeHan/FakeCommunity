<%@page import="org.apache.commons.io.IOUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.nio.file.*" %>
<%@ page import="java.util.*" %>
<%
	// 파일경로가 포함된 파읾영을 파라미터로 가져오기
	String fileName = request.getParameter("fileName"); // 2021/08/03
	
	// 
	File file = new File("D:/upload", fileName);// D:/upload/2021/08/03
	
	if(file.exists() == false){ // 파일이 없으면 종료
		return;
	}
	
	String contentType = Files.probeContentType(file.toPath());
	
	// 응답객체에 컨테트타입 설정
	response.setContentType(contentType);
	
	// 읽어들일 이미지 파일으로 파일입력스트림 객체로 준비
	FileInputStream fis = new FileInputStream(file);
	
	// 파일입력스트림을 바이트 배열로 변환
	byte[] image = IOUtils.toByteArray(fis);
	
	// 요청 클라이언트 쪽으롤 보낼 출력(응답) 스트림
	ServletOutputStream slos = response.getOutputStream();
	slos.write(image);
	
	slos.close();
	fis.close();
%>