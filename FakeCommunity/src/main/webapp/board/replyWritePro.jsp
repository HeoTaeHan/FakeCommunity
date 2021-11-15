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
	int num = cusbodDAO.getNextnum("F");
	
	// input type="file" 태그들의 name속성들을 가져오기
	Enumeration<String> enu = multi.getFileNames(); // Iterator, Enumeration 반복자 객체
	
	while(enu.hasMoreElements()){
		
		String 		fname    		= enu.nextElement(); // file0 file1 file2 ...
		
		// 저장된 파일명 가져오기
		String 		fileName		= multi.getFilesystemName(fname);
		
		
		// 원본 파일명 가져오기
		String 		originalName 	= multi.getOriginalFileName(fname);
		
		
		if(fileName == null){ // 파일정보가 없으면 
			continue; // 그다음 반복으로 건너뛰기
		}
		// AttachVO 객체 준비
		AttachVO 	attachVO 		= new AttachVO();
		
		
		attachVO.setFilename(fileName);
		attachVO.setUploadpath(getFolder());
		attachVO.setBno(num); // 첨부파일이 포함될 게시글 번호 저장
		UUID uuid = UUID.randomUUID();
		attachVO.setUuid(uuid.toString()); // 기본키 uuid 저장
		attachVO.setCusid(multi.getParameter("cusid"));
		
		File file = new File(uploadPath, fileName); // 년월일 경로에 실제 파일명의 파일객체
		boolean isImage = checkImageType(file); // 이미지 파일 여부 확인
		
		attachVO.setFiletype(isImage == true ? "I": "O"); // Image 또는 Other
		
		// 이미지 파일이면 썸네일 이미지 생성하기
		if(isImage == true){ 
			File outFile = new File(uploadPath, "s_"+fileName); // 생성(출력)할 썸네일 파일정보
			Thumbnailator.createThumbnail(file, outFile, 100, 100); // 썸네일 생성하기
		}
		
		// 첨부파일 attach테이블 attachVo를 insert하기
		attachDAO.insert(attachVO);
	}
	
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
	// 답글을 작성할 대상글(*)의  re_ref  re_lev  re_seq  설정하기
	cusbodVO.setCrerf(Integer.parseInt(multi.getParameter("reRef")));
	cusbodVO.setCrelv(Integer.parseInt(multi.getParameter("reLev")));
	cusbodVO.setCresq(Integer.parseInt(multi.getParameter("reSeq")));
	
	// 답글 등록하기
	cusbodVO.setCtype("F");
	// 주글 등록하기
	cusbodDAO.updateBoardReseqAndAddReply(cusbodVO);
	
	// 요청 페이지 번호 파라미터 가져오기
	String pageNum = multi.getParameter("PageNum");
	String type    = multi.getParameter("type");
	String keyword = multi.getParameter("keyword");
	
	// 글목록 화면으로 이동
	response.sendRedirect("/board/boardContent.jsp?PageNum=" + pageNum + "&num=" + cusbodVO.getCsnum() + "&type=" + type + "&keyword=" + keyword + "&cusid=" + multi.getParameter("cusid"));
%>