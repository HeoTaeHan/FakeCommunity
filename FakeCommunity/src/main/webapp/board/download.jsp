<%@page import="org.apache.commons.io.IOUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.nio.file.*" %>
<%@ page import="java.util.*" %>
<%
	//파일경로가 포함된 파읾영을 파라미터로 가져오기
	String fileName = request.getParameter("fileName"); // 2021/08/03
	
	// 
	File file = new File("D:/upload", fileName);// D:/upload/2021/08/03
	
	if(file.exists() == false){ // 파일이 없으면 종료
		return;
	}
	
	String contentType = Files.probeContentType(file.toPath());
	if(contentType == null){ // 컨텐트타입(Mime타입) 정보가 없으면 application/octet-stream로 설정하기
		contentType = "application/octet-stream";
	}
	
	// 응답객체에 컨테트타입 설정
	response.setContentType(contentType);
	
	int beginIndex = fileName.lastIndexOf("/") + 1;
	String fname   = fileName.substring(beginIndex); // 경로를 제외한 파일명 구하기
	
	// 다운로드 파일명의 문자셋을 "utf-8"에서 "iso-8859-1"로 변환하기
	fname = new String(fname.getBytes("utf-8"), "iso-8859-1");
	// 다운로드로 사용할 파일명을 응답헤더에 설정
	response.setHeader("Content-Disposition", "attachment; filename=" + fname);
	

	// 읽어들일(다운로드할) 파일으로 파일입력스트림 객체로 준비
	BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
	
	// 요청 클라이언트 쪽으롤 보낼 출력(응답) 스트림
	ServletOutputStream slos = response.getOutputStream();
	
	// 사용자 출력스트림으로 내보내기
	// 사용자 출력스트림으로 파일 내보내기.
	int data;
	while ((data = bis.read()) != -1) {
		slos.write(data);
	}
	
	// 입출력 스트림 담기
	slos.close();
	bis.close();
%>