<%@page import="com.example.domain.CususrVO"%>
<%@page import="com.example.repository.CususrDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String 		id			= (String) session.getAttribute("sessionid");
	CususrDAO	cususrDAO 	= CususrDAO.getInstance();
	CususrVO	cususr		= cususrDAO.select(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Imagetoolbar" content="no" />
<jsp:include page="/include/headStyle.jsp" />
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
</head>
<body>
<form name="user" action="/member/memberModify.jsp" method="post">
<input type="hidden" name="cusid" value="<%=cususr.getCusid()%>">
	<div id="wrapper">
		<div class="vertical-align-wrap">
			<div class="vertical-align-middle">
				<div class="auth-box2">
						<div class="content">
							<div class="header">
								<div class="logo text-center">회원정보</div>
								<p class="lead" style="text-align: center;"><%=cususr.getCname() %>(<%=cususr.getCusid() %>)님의 회원정보입니다.</p>
							</div>
							<div class="form-group">
								<table align="center">
									<tr>
										<td>ID : <%=cususr.getCusid() %></td>
									</tr>
									<tr>
										
										<td><br/>이름 : <%=cususr.getCname() %></td>
									</tr>
									<tr>
										<td>
											<br/>
											비밀번호 확인 질문 : 
											<%
												if(cususr.getChint().equals("1")){
											%>
													기억에 남는 추억의 장소는?
											<%
												} else if(cususr.getChint().equals("2")){											
											%>
													자신의 인생의 좌우명은?
											<%
												} else if(cususr.getChint().equals("3")){
											%>
													자신의 보물 제1호는?
											<%
												} else if(cususr.getChint().equals("4")){
											%>
													가장 기억에 남는 선생님 성함은?
											<%
												} else if(cususr.getChint().equals("5")){
											%>
													타인이 모르는 자신만의 신체비밀이 있다면?
											<%
												} else if(cususr.getChint().equals("6")){
											%>
													추억하고 싶은 날짜가 있다면?
											<%
												} else if(cususr.getChint().equals("7")){
											%>
													
													받았던 선물 중 기억에 남는 독특한 선물은?
											<%
												} else if(cususr.getChint().equals("8")){
											%>
													유년시절 가장 생각나는 친구 이름은?
											<%
												} else if(cususr.getChint().equals("9")){
											%>
													인상깊게 읽은 책 이름은?
											<%
												} else if(cususr.getChint().equals("10")){
											%>
													읽은 책 중에서 좋아하는 구절이 있다면?
											<%
												} else if(cususr.getChint().equals("11")){
											%>
													자신이 두번째로 존경하는 인물은?
											<%
												} else if(cususr.getChint().equals("12")){
											%>
													친구들에게 공개하지 않은 어릴 적 별명이 있다면?
											<%
												} else if(cususr.getChint().equals("13")){
											%>
													초등학교 때 기억에 남는 짝꿍 이름은?
											<%
												} else if(cususr.getChint().equals("14")){
											%>
													다시 태어나면 되고 싶은 것은?
											<%
												} else if(cususr.getChint().equals("15")){
											%>
													내가 좋아하는 캐릭터는?
											<%		
												}
											%>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
											비밀번호 확인 답변 : <%=cususr.getReslt() %>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
											휴대번호 : <%=cususr.getPhone().substring(0,3) %>-<%=cususr.getPhone().substring(3,7) %>-<%=cususr.getPhone().substring(7,11) %>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
											생년월일 : <%=cususr.getBirth().substring(0,4) %>-<%=cususr.getBirth().substring(4,6) %>-<%=cususr.getBirth().substring(6,8) %>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
											이메일 : <%=cususr.getEmail() %></td>
									</tr>
									<tr>
										<td>
											<br/>
											우편번호 : <%=cususr.getZcode() %> 
										</td>
									</tr>
									<tr>
										<td>
											<br/>
											주소 : <%=cususr.getAdres() %>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
											주소상세 : <%=cususr.getAdr02() %>
										</td>
									</tr>
								</table>
							</div>
							<button type="button" class="btn btn-blue btn-lg btn-block" onclick="location.href='/member/memberModify.jsp'">회원정보 수정</button>
							<button type="button" class="btn btn-danger btn-lg btn-block" id="btnRemove">회원정보 삭제</button>
							<button type="button" class="btn btn-dark btn-lg btn-block" onclick="location.href='/index.jsp'">돌아가기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
<script>
	$('button#btnRemove').on('click', function(){
		var isRemove = confirm('정말 삭제하시겠습니까?');
		
		if(isRemove == true){
			location.href = '/member/memberRemovePro.jsp?cusid=<%=cususr.getCusid()%>';	
		}
	});
</script>	
</body>
</html>