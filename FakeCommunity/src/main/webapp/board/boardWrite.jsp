<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 세션정보 로그인 아이디 가져오기
	String id		= (String) session.getAttribute("sessionid");
	String keyword 	= request.getParameter("keyword");
	String PageNum  = request.getParameter("PageNum");
	String type     = request.getParameter("type");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<jsp:include page="/include/headStyle.jsp" />
	<title>일반게시판 글 쓰기</title>
</head>
<body>
	<jsp:include page="/include/head2.jsp"/>	
	<!-- END NAVBAR -->
	<jsp:include page="/include/left.jsp"/>
<form action="/board/boardWritePro.jsp" method="POST" enctype="multipart/form-data">	
<input type="hidden" name="keyword" value="<%=keyword%>">
<input type="hidden" name="PageNum" value="<%=PageNum%>">
<input type="hidden" name="type" value="<%=type%>">	
	<div id="wrapper">
		<div class="vertical-align-wrap">
			<div class="vertical-align-middle">
				<div class="auth-box3">
					<div class="content">
						<div class="header">
							<div class="logo text-center">자유 게시판 글 쓰기</div>
						</div>
						<div class="form-group" align="center" style="width:460px;">
							<i class="lnr lnr-user"></i>
                			<label for="id">아이디 <%=id %></label>
                			<input type="hidden" name="cusid" value="<%=id%>">
						</div>
						<div class="form-group" align="center">
							<i class="lnr lnr-file-empty"></i>
							<label>제목</label>
							<input type="text" name="csbjt" style="width:70%;">
						</div>
						<div class="form-group" align="center">
							<i class="lnr lnr-pencil"></i>
							<label>내용</label>
							<textarea name="ccont" style="width:70%;height:70px"></textarea>
						</div>
						<div class="form-group" align="center" id="fileBox">
							<i class="lnr lnr-file-add"></i>
							<label>파일추가</label>&nbsp;<button type="button" class="btn btn-primary" id="btnAddFile"><i class="lnr lnr-file-add"></i> 파일 추가</button>
							<input type="file" name="file0"><button class="btn btn-danger  file-delete"><i class="lnr lnr-cross"></i></button>
						</div>
						<div class="form-group" align="right">
							<button class="btn btn-primary" type="submit"><i class="lnr lnr-pencil"></i> 새글 등록</button>
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
  		var fileIndex = 1;
  		var fileCount = 1;
  
    	$('button#btnAddFile').on('click', function () {
    		if (fileCount >= 3) {
    			alert('첨부파일은 최대 3개 까지만 첨부할 수 있습니다.');
    			return;
    		}
    	
    		var str = `
    			<div class="form-group" align="center">
	            	<input type="file" name="file\${fileIndex}">
	            	<button class="btn btn-danger  file-delete"><i class="lnr lnr-cross"></i></button>
            	</div>
    		`;
    	
    		$('div#fileBox').append(str);
    	
    		fileIndex++;
    		fileCount++;
    	});
    
    	// 동적 이벤트 연결 (이벤트 등록을 이미있는 요소에게 위임하는 방식)
    	$('div#fileBox').on('click', 'button.file-delete', function () {
    	
    		//$(this).closest('div').remove(); // empty()와 구분 유의!
    		$(this).parent().remove();
    		
    		fileCount--;
    	});
	</script>
</body>
</html>