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
	CusbodVO	cusbodVO	= cusbodDAO.select(num, "A");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>공지사항 게시글 수정</title>
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
<form action="/notice/noticeModifyPro.jsp" method="POST">
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
							<div class="logo text-center">공지사항 글 수정</div>
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
						<div class="form-group" align="right">
							<button class="btn btn-primary" type="submit"><i class="lnr lnr-pencil"></i> 글수정</button>
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