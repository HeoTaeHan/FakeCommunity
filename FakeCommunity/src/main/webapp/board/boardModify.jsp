<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.example.domain.*"%>
<%@page import="com.example.repository.*"%>
<%
	String  id		= (String) session.getAttribute("sessionid");
	int		num		= Integer.parseInt(request.getParameter("num"));
	String 	keyword	= request.getParameter("keyword");
	String 	PageNum = request.getParameter("PageNum");
	String 	type    = request.getParameter("type");

	// DAO 객체준비
	CusbodDAO	cusbodDAO	= CusbodDAO.getInstance();
	AttachDAO 	attachDAO 	= AttachDAO.getInstance();
	
	// 글번호에 해당하는 글내용 가져오기
	CusbodVO	cusbodVO	= cusbodDAO.select(num, "F");
	// 글번호에 해당하는 첨부파일 리스트 가져오기
	Vector<AttachVO> attachV  	= attachDAO.getAttachesByBno(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>자유 게시판 게시글 수정</title>
	<jsp:include page="/include/headStyle.jsp" />
	<style type="text/css">
		span.filename {
			display: inline-block;
			width: 277px;
			height: 40px;
		}
	</style>
</head>
<body>
	<jsp:include page="/include/head2.jsp"/>	
	<!-- END NAVBAR -->
	<jsp:include page="/include/left.jsp"/>	
<form action="/board/boardModifyPro.jsp" method="POST" enctype="multipart/form-data">
<input type="hidden" name="keyword" value="<%=keyword%>">
<input type="hidden" name="PageNum" value="<%=PageNum%>">
<input type="hidden" name="type" value="<%=type%>">	
<input type="hidden" name="id" value="<%=id%>">
<input type="hidden" name="num" value="<%=num%>">
	<div id="wrapper">
		<div class="vertical-align-wrap">
			<div class="vertical-align-middle">
				<div class="auth-box3">
					<div class="content">
						<div class="header">
							<div class="logo text-center">자유 게시판 글 수정</div>
						</div>
						<div class="form-group" align="center" style="width:460px;">
							<i class="lnr lnr-user"></i>
                			<label for="id">아이디 <%=id %></label>
						</div>
						<div class="form-group" align="center">
							<i class="lnr lnr-file-empty"></i>
							<label>제목</label>
							<input type="text" name="csbjt" value="<%=cusbodVO.getCsbjt() %>" style="width:70%;">
						</div>
						<div class="form-group" align="center">
							<i class="lnr lnr-pencil"></i>
							<label>내용</label>
							<textarea name="ccont" style="width:70%;height:70px"><%=cusbodVO.getCcont() %></textarea>
						</div>
						<div class="form-group" align="center">
							<label>파일추가</label>&nbsp;<button type="button" class="btn btn-primary" id="btnAddFile"><i class="lnr lnr-file-add"></i> 파일 추가</button>
						</div>
						<div class="form-group" align="center" id="oldFileBox">
							<%
								for(AttachVO attach : attachV){
                			%>
                					<%-- .delete-oldfile 버튼  클리시 hidden input의 name속성 값이  oldfile -> delfile 변환됨 --%>
                					<input type="hidden" name="oldfile" value="<%=attach.getUuid()%>">
                					<div class="form-group">
	                					<span class="filename"><%=attach.getFilename() %></span>
			                    		<button class="btn btn-danger delete-oldfile"><i class="lnr lnr-cross"></i></button>
		                    		</div>
                			<%
                				}
                			%>
						</div>
						<!-- 신규 첨부파일 영역 -->
						<div class="form-group" align="center" id="newFileBox">
            			</div>
						<div class="form-group" align="right">
							<button class="btn btn-primary" type="submit"><i class="lnr lnr-pencil"></i> 글수정</button>
							<button class="btn btn-success" type="reset"><i class="lnr lnr-sync"></i> 초기화</button>
							<button class="btn btn-dark" type="button" onclick="location.href = '/board/boardList.jsp'"><i class="lnr lnr-menu"></i>글목록</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>	
	<jsp:include page="/include/footer.jsp"/>							
	<jsp:include page="/include/commonJs.jsp"/>	
	<script>
  		var 	fileIndex			= 0;
  		var 	currentfileCount	= <%=attachV.size()%>; // 현재 첨두된 파일 갯수
  		const 	MAX_FILE_COUNT 		= 5; // 최대 첨부파일 갯수
  
  		// [첨부파일 추가] 버튼을 클릭하면
    	$('button#btnAddFile').on('click', function () {
    		if (currentfileCount >= MAX_FILE_COUNT) {
    			alert(`첨부파일은 최대 \${MAX_FILE_COUNT}개 까지만 첨부할 수 있습니다.`);
    			return;
    		}
    	
    		var str = `
    			<div class="form-group" align="center">
	            	<input type="file" name="file\${fileIndex}">
	            	<button class="btn btn-danger  file-delete"><i class="lnr lnr-cross"></i></button>
            	</div>
    		`;
    	
    		$('div#newFileBox').append(str);
    	
    		fileIndex++;
    		currentfileCount++;
    	});
    
    	// 동적 이벤트 연결 (이벤트 등록을 이미 존재하는 요소에게 위임하는 방식)
    	$('div#newFileBox').on('click', 'button.delete-addfile', function () {
    	
    		//$(this).closest('div').remove(); // empty()와 구분 유의!
    		$(this).parent().remove();
    		
    		currentfileCount--;
    	});
    	
    	// 기본 첨부파일에 삭제버튼 눌렀을때
    	$('button.delete-oldfile').on('click', function () {
    		$(this).parent().prev().prop('name', 'delfile'); // oldfile -> delfile(서버에서 찾을 파라미터값.)
	
    		// 현재 클릭한 요소의 직꼐부모(parent) 요소를 제거하기
    		$(this).parent().remove();
    		currentfileCount--;
    	});
	</script>
</body>
</html>