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
	<title>공지사항 글 쓰기</title>
</head>
<body>
	<jsp:include page="/include/head2.jsp"/>	
	<!-- END NAVBAR -->
	<jsp:include page="/include/left.jsp"/>
<form action="/notice/noticeWritePro.jsp" method="POST" enctype="multipart/form-data">	
<input type="hidden" name="keyword" value="<%=keyword%>">
<input type="hidden" name="PageNum" value="<%=PageNum%>">
<input type="hidden" name="type" value="<%=type%>">	
	<div id="wrapper">
		<div class="vertical-align-wrap">
			<div class="vertical-align-middle">
				<div class="auth-box3">
					<div class="content">
						<div class="header">
							<div class="logo text-center">공지사항 글 쓰기</div>
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
						<div class="form-group" align="right">
							<button class="btn btn-primary" type="submit"><i class="lnr lnr-pencil"></i> 공지 등록</button>
							<button class="btn btn-success" type="reset"><i class="lnr lnr-sync"></i> 초기화</button>
							<button class="btn btn-dark" type="button" onclick="location.href = '/notice/noticeList.jsp'"><i class="lnr lnr-menu"></i>글목록</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
	<jsp:include page="/include/footer.jsp"/>							
	<jsp:include page="/include/commonJs.jsp"/>		
</body>
</html>