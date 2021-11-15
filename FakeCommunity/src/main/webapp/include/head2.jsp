<%@page import="com.example.domain.CususrVO"%>
<%@page import="com.example.repository.CususrDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 세션정보 로그인 아이디 가져오기
	String id = (String) session.getAttribute("sessionid");
	if(id == null){
		id = "";
	}
%>
<meta charset="UTF-8">
<title>Rp Community</title>
<!-- WRAPPER -->
<div id="wrapper">
	<!-- NAVBAR -->
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="brand">
			<a href="../index.jsp"><img src="../image/commu.jpg" alt="Rpcommu" style="width:200px;height:25px;"></a>
		</div>
		<div class="container-fluid">
			<div class="navbar-btn">
				<button type="button" class="btn-toggle-fullwidth"><i class="lnr lnr-arrow-left-circle"></i></button>
			</div>
			<form class="navbar-form navbar-left">
				<div class="input-group">
				</div>
			</form>
			<div id="navbar-menu">
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<%	
							if(id.equals("")){
						%>
								<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span>회원정보</span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
								<ul class="dropdown-menu">
									<li><a href="../member/join.jsp"><i class="lnr lnr-user"></i> 회원가입</a></li>
									<li><a href="../member/login.jsp"><i class="lnr lnr-exit"></i> 로그인</a></li>
								</ul>
						<%
							} else {
								CususrDAO cususrDAO = CususrDAO.getInstance();
								CususrVO  cususr    = cususrDAO.select(id);
						%>
								<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span><%=cususr.getCname() %>(<%=cususr.getCusid() %>)님의 정보</span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
								<ul class="dropdown-menu">
									<%
										if(cususr.getCusid().equals("admin")){
									%>
											<li><a href="../member/memberList.jsp"><i class="lnr lnr-user"></i> <span>회원정보 관리</span></a></li>
									<%
										} else {
									%>
											<li><a href="../member/memberInfo.jsp"><i class="lnr lnr-user"></i> <span>회원정보 수정</span></a></li>
									<%
										}
									%>
									<li><a href="../member/logout.jsp"><i class="lnr lnr-exit"></i> <span>로그아웃</span></a></li>
								</ul>
						<%
							}
						%>
					</li>
				</ul>
			</div>
		</div>
	</nav>