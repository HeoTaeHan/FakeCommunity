<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.nio.file.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*"%>
<%@ page import="com.example.domain.*"%>
<%@ page import="com.example.repository.*"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="net.coobird.thumbnailator.Thumbnailator"%>
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
	
	// 수정할 게시글 번호 파라미터 가져오기			
	int num = Integer.parseInt(request.getParameter("num"));

	//BoardDAO 객체 준비
	CusbodDAO cusbodDAO = CusbodDAO.getInstance();
				
	// ============================== 게시글 수정하기 ==============================
	// 수정에 사용할 게시글 VO객체 준비
	CusbodVO cusbodVO = new CusbodVO();
	// 파라미터값 가져와서 VO에 저장
	cusbodVO.setCsnum(num);
	cusbodVO.setCusid(request.getParameter("id"));
	cusbodVO.setCsbjt(request.getParameter("csbjt"));
	cusbodVO.setCcont(request.getParameter("ccont"));
	cusbodVO.setCtmid(request.getRemoteAddr());
	cusbodVO.setCtype("A");
	cusbodDAO.update2(cusbodVO);
	// ============================== 게시글 수정하기 완료 ==============================
	
	// 요청 페이지 번호 파라미터 가져오기
	String pageNum = request.getParameter("PageNum");
	String keyword = request.getParameter("keyword");
	String type    = request.getParameter("type");
%>
<script>
	alert('글 수정 성공');
	location.href = '/notice/noticeContent.jsp?PageNum=<%=pageNum%>&num=<%=num%>&type=<%=type%>&keyword=<%=keyword%>&cusid=<%=request.getParameter("id")%>';
</script>