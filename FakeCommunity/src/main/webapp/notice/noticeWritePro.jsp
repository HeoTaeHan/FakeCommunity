<%@page import="com.example.domain.CusbodVO"%>
<%@page import="com.example.repository.CusbodDAO"%>
<%@page import="com.example.repository.CususrDAO"%>
<%@page import="com.example.domain.AttachVO"%>
<%@page import="com.example.repository.AttachDAO"%>
<%@page import="net.coobird.thumbnailator.Thumbnailator"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*"%>
<%@ page import="java.nio.file.*"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.*"%>

<%!// 선언부
	// 년/월/일 생성하는 메서드 
	String getFolder(){
		SimpleDateFormat 	sdf		= new SimpleDateFormat("yyyy/MM/dd");
		Date				date 	= new Date();
		String 				str		= sdf.format(date);
		return str;
	} // end of getFolder

	// 이미지 파일인지 여부 리턴하는 메서드
	boolean checkImageType(File file){
		boolean isImage = false;
		try{
			String contentType = Files.probeContentType(file.toPath());
			isImage = contentType.startsWith("image");
		} catch(Exception e){
			e.printStackTrace();
		}
		return isImage;
	} // end of checkImageType
%>
<%
	String	uploadFolder = "D:/upload";
	File	uploadPath   = new File(uploadFolder, getFolder());
	if(!uploadPath.exists()){
		uploadPath.mkdirs();
	}
	/*	인자값
		1. request
		2. 업로드할 물리적 경로 "D:/upload"
		3. 업로드 최대크기 바이트 단위로 제한 1024Byte * 10245Byte
		4. request의 텍스트 데이ㅓ, 파일명 인코딩 "utf-8" 
		5. 파일명 변경 정책. 파일명 중복시 이름변경규칙 가진 객체를 전달
	*/
	// 파일 업로드하기
	MultipartRequest multi = new MultipartRequest(request, uploadPath.getPath(), 1024 * 1024 * 50, "UTF-8", new DefaultFileRenamePolicy());
	// 파일 업로드 완료됨
	
	/* 	enctype="multipart/form-data" 로 전송받으면
		개본내장객체인 request로부터 파라미터값을 바로 가져올 수 없음! null이 리턴됨.
		MultipartRequest객체로부터 파라미터값을 가져와야 함. 사용방법은 request와 동일함. 
	*/
	// AttchDAO 객체 준비
	AttachDAO attachDAO = AttachDAO.getInstance();
	
	// Cus 객체 준비
	CusbodDAO cusbodDAO = CusbodDAO.getInstance();
	
	
	
	// insert 할 새 게시글 번호 가져오기 게시글 번호
	int num = cusbodDAO.getNextnum("A");
	
	
	// BoardVO 객체 준비
	CusbodVO cusbodVO = new CusbodVO();
	// 파라미터값 가져와서 VO에 저장. MultipartRequest로부터 가져옴.
	// 글번호 설정
	cusbodVO.setCsnum(num);
	cusbodVO.setCusid(multi.getParameter("cusid"));
	cusbodVO.setCsbjt(multi.getParameter("csbjt"));
	cusbodVO.setCcont(multi.getParameter("ccont"));
	// ipaddr regDate readcount
	cusbodVO.setCtmid(request.getRemoteAddr());
	cusbodVO.setCdate(new Timestamp(System.currentTimeMillis()));
	cusbodVO.setCrdcn(0);
	// 주글에서 re_ref re_lev re_seq 설정하기
	cusbodVO.setCrerf(num); // 주글일때 글번호와 글그룹번호는 동일함
	cusbodVO.setCrelv(0); // 주글일때 들여쓰기 레벨 0 (들여쓰기 없음)
	cusbodVO.setCresq(0);  // 주글일떄 글그룹안에서 순번이 0(오름차순 정렬시 첫번째)
	cusbodVO.setCtype("A");
	// 주글 등록하기
	cusbodDAO.insert(cusbodVO);
	
	// 요청 페이지 번호 파라미터 가져오기
	String pageNum = multi.getParameter("PageNum");
	String keyword = multi.getParameter("keyword");
	String type    = multi.getParameter("type");
	
	// 글목록 화면으로 이동
	response.sendRedirect("/notice/noticeContent.jsp?PageNum=" + pageNum + "&num=" + cusbodVO.getCsnum() + "&type=" + type + "&keyword=" + keyword + "&cusid=" + multi.getParameter("cusid"));
%>