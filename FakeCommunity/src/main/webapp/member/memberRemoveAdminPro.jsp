<%@page import="com.example.repository.*"%>
<%@page import="com.example.domain.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//로그아웃 처리 세션
	// session.removeAttribute("id"); // 키에 해당하는 요소 한개 삭제
	String cusid	= request.getParameter("cusid");
	String keyword	= request.getParameter("keyword");
	String PageNum 	= request.getParameter("PageNum");
	String type    	= request.getParameter("type");
	
	CususrDAO cusrDao	= CususrDAO.getInstance();
	CsreplDAO csreplDAO	= CsreplDAO.getInstance();
	CrecomDAO crecomDAO = CrecomDAO.getInstance();
	CntcomDAO cntcomDAO = CntcomDAO.getInstance();
	CusbodDAO cusbodDAO = CusbodDAO.getInstance();
	AttachDAO attachDAO = AttachDAO.getInstance();
	
	if(csreplDAO.count(cusid) != 0){
		csreplDAO.delete(cusid);
	}
	
	if(crecomDAO.count(cusid) != 0){
		crecomDAO.delete(cusid);
	}
	
	if(cntcomDAO.count(cusid) != 0){
		cntcomDAO.delete(cusid);
	}
	
	if(cusbodDAO.count(cusid) != 0){
		cusbodDAO.delete(cusid);
	}
	
	// 게시글번호에 첨부된 첨부파일 리스트 가져오기
	Vector<AttachVO> attachV = attachDAO.getAttachesByCusid(cusid);
		
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
	attachDAO.deleteAttachsByCusid(cusid);
	
	cusrDao.delete(cusid);
	
	response.sendRedirect("/member/memberList.jsp?PageNum=" + PageNum + "&keyword=" + keyword + "&type=" + type);
%>