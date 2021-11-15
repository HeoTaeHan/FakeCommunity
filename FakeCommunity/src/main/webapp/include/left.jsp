<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//세션정보 로그인 아이디 가져오기
	String id = (String) session.getAttribute("sessionid");
	String activeStr = "";
	if(!request.getRequestURL().equals("index.jsp") && !String.valueOf(request.getRequestURL()).replace("/","").equals("http:localhost:8090")){
		activeStr = String.valueOf(request.getRequestURL()).substring(22,24);
	}
%>
<!-- LEFT SIDEBAR -->
<div id="sidebar-nav" class="sidebar">
	<div class="sidebar-scroll">
		<nav>
			<ul class="nav">
				<li><a href="/notice/noticeList.jsp" <%=activeStr.equals("no")?"class='active'":""%>><i class="lnr lnr-file-empty"></i> <span>공지사항</span></a></li>
				<li><a href="/board/boardList.jsp" <%=activeStr.equals("bo")?"class='active'":""%>><i class="lnr lnr-home"></i> <span>자유게시판</span></a></li>
				<%
					if(id != null){
						if(id.equals("admin")){
				%>
							<li><a href="/chart/pieChart.jsp" <%=activeStr.equals("ch")?"class='active'":""%>><i class="lnr lnr-pie-chart"></i> <span>차트</span></a></li>
							<li><a href="/email/multiPartEmail.jsp" <%=activeStr.equals("em")?"class='active'":""%>><i class="lnr lnr-inbox"></i> <span>메일전송</span></a></li>
				<%
						}
				%>
						<li><a href="/websocket/simpleChat.jsp" <%=activeStr.equals("we")?"class='active'":""%>><i class="lnr lnr-bubble"></i> <span>채팅</span></a></li>	
				<%
					}
				%>
			</ul>
		</nav>
	</div>
</div>
<!-- END LEFT SIDEBAR -->