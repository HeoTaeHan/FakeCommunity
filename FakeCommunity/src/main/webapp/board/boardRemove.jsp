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
	AttachDAO 	attachDAO 	 = AttachDAO.getInstance();
	CrecomDAO   crecomDAO    = CrecomDAO.getInstance();
	CntcomDAO   cntcomDAO    = CntcomDAO.getInstance();
	CsreplDAO	csreplDAO    = CsreplDAO.getInstance();
	
	// 게시글번호에 첨부된 첨부파일 리스트 가져오기
	Vector<AttachVO> attachV = attachDAO.getAttachesByBno(num);
	
	// 업로드 기준경로
	String	uploadFolder = "D:/upload";
	
	for(AttachVO attach: attachV){
		String path  = uploadFolder + "/" + attach.getUploadpath() + "/" + attach.getFilename();
		String path2 = uploadFolder + "/" + attach.getUploadpath() + "/s_" + attach.getFilename();
		File deleteFile  = new File(path);
		//File deleteFile2 = new File(path2);
		
		if(deleteFile.exists()){ // 삭제할 파일이 해당경로에 존재하면
			deleteFile.delete(); // 파일 삭제하기
			
			if(attach.getFiletype().equals("I")){ // 이미지 파일이면
				File tumbnailFile = new File(path2);
				if(tumbnailFile.exists()){ // 썸네일 이미지파일 존재하면
					tumbnailFile.delete(); // 썸네일 이미지파일 삭제하기
				}
			}
		}
		
		//if(deleteFile2.exists()){ // 삭제할 파일이 해당경로에 존재하면
			//deleteFile2.delete(); // 파일 삭제하기
		//}
	}
	
	// DB첨부파일 정보 삭제하기
	attachDAO.deleteAttachsByBno(num);
	// DB 게시글 추천 정보 삭제하기
	if(crecomDAO.countAll(num) != 0){
		crecomDAO.delete(num);
	}
	// DB 게시글 비추천 정보 삭제하기
	if(cntcomDAO.countAll(num) != 0){
		cntcomDAO.delete(num);
	}
	
	// DB 게시글 댓글 정보 삭제하기
	if(csreplDAO.count(num) != 0){
		csreplDAO.delete(num);
	}
	// DB 게시글 정보 삭제하기
	cusbodDAO.delete(num, "F");
	
	
	
	// 글목록 boardList.jsp로 이동
	response.sendRedirect("/board/boardList.jsp?PageNum=" + pageNum + "&type=" + type + "&keyword=" + keyword);
	// 첨부파일 삭제하기
	File file = new File(uploadFolder);// D:/upload/2021/08/03	
%>