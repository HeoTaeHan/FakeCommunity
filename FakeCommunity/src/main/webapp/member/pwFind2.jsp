<%@page import="com.example.domain.CususrVO"%>
<%@page import="com.example.repository.CususrDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String 		cusid		= request.getParameter("cusid");
	CususrDAO 	cususrDAO 	= CususrDAO.getInstance();
	CususrVO	cususrVO    = cususrDAO.select(cusid);
%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/include/headStyle.jsp" />
	<title>아이디찾기</title>
</head>
<body>
<form name="user" action="/member/pwFindPro.jsp" method="post">
<input type="hidden" name="cusid" value="<%=cusid%>">
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
							비밀번호 확인 질문
							<select name="chint">
								<option value="1" <%=cususrVO.getChint().equals("1")?"selected":"" %>>기억에 남는 추억의 장소는?</option>
								<option value="2" <%=cususrVO.getChint().equals("2")?"selected":"" %>>자신의 인생의 좌우명은?</option>
								<option value="3" <%=cususrVO.getChint().equals("3")?"selected":"" %>>자신의 보물 제1호는?</option>
								<option value="4" <%=cususrVO.getChint().equals("4")?"selected":"" %>>가장 기억에 남는 선생님 성함은?</option>
								<option value="5" <%=cususrVO.getChint().equals("5")?"selected":"" %>>타인이 모르는 자신만의 신체비밀이 있다면?</option>
								<option value="6" <%=cususrVO.getChint().equals("6")?"selected":"" %>>추억하고 싶은 날짜가 있다면?</option>
								<option value="7" <%=cususrVO.getChint().equals("7")?"selected":"" %>>받았던 선물 중 기억에 남는 독특한 선물은?</option>
								<option value="8" <%=cususrVO.getChint().equals("8")?"selected":"" %>>유년시절 가장 생각나는 친구 이름은?</option>
								<option value="9" <%=cususrVO.getChint().equals("9")?"selected":"" %>>인상깊게 읽은 책 이름은?</option>
								<option value="10" <%=cususrVO.getChint().equals("10")?"selected":"" %>>읽은 책 중에서 좋아하는 구절이 있다면?</option>
								<option value="11" <%=cususrVO.getChint().equals("11")?"selected":"" %>>자신이 두번째로 존경하는 인물은?</option>
								<option value="12" <%=cususrVO.getChint().equals("12")?"selected":"" %>>친구들에게 공개하지 않은 어릴 적 별명이 있다면?</option>
								<option value="13" <%=cususrVO.getChint().equals("13")?"selected":"" %>>초등학교 때 기억에 남는 짝꿍 이름은?</option>
								<option value="14" <%=cususrVO.getChint().equals("14")?"selected":"" %>>다시 태어나면 되고 싶은 것은?</option>
								<option value="15" <%=cususrVO.getChint().equals("15")?"selected":"" %>>내가 좋아하는 캐릭터는?</option>
							</select>
						</div>
						<div class="form-group">
							비밀번호 확인 답변
							<input type="text" name="reslt" required="required" style="align:center;width:74.5%">
						</div>
						<div class="bottom">
							<button type="submit" class="btn btn-primary btn-lg btn-block">비밀번호 찾기</button>
							<button type="button" class="btn btn-dark btn-lg btn-block" onclick="history.go(-1)">돌아가기</button>
						</div>						
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
</body>
</html>