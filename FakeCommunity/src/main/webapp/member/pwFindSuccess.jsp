<%@page import="java.util.*" %>
<%@page import="java.util.regex.*" %>
<%@page import="com.example.domain.CususrVO"%>
<%@page import="com.example.repository.CususrDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String cusid = request.getParameter("cusid");
	CususrDAO cususrDAO = CususrDAO.getInstance();
	CususrVO cususr = cususrDAO.select(cusid); 
%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/include/headStyle.jsp" />
	<title>아이디찾기</title>
</head>
<body>
<form action="/member/pwFindSuccess.jsp" method="post">
<!-- WRAPPER -->
	<div id="wrapper">
		<div class="vertical-align-wrap">
			<div class="vertical-align-middle">
				<div class="auth-box lockscreen clearfix">
					<div class="content">
						<div class="header">
							<div class="logo text-center">비밀번호 찾기</div>
							<p class="lead">비밀번호 찾기</p>
						</div>
						<div class="form-group">
							ID :&nbsp;<input type="text" name="cusid" id="cusid" value="<%=cususr.getCusid() %>" style="width:80%" readonly="readonly">
						</div>
						<div class="form-group">
							PW :&nbsp;<input type="text" name="paswd" id="paswd" value="<%=cususr.getPaswd() %>" style="width:80%" readonly="readonly">
						</div>
						<div class="bottom">
							<button type="button" class="btn btn-dark btn-lg btn-block" onclick="location.href='/member/login.jsp'">돌아가기</button>
						</div>						
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
</body>
</html>