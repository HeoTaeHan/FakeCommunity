<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="com.example.domain.*"%>
<%@page import="com.example.repository.*"%>
<%
	// 세션정보 로그인 아이디 가져오기
	String id = (String) session.getAttribute("sessionid");

	//DAO 객체 준비
	CusbodDAO cusbodDAO = CusbodDAO.getInstance();

	Vector<CusbodVO> boardList	= cusbodDAO.selectPageOption("F");
	Vector<CusbodVO> noticeList = cusbodDAO.selectPageOption("A");
	
	int totalCount  = boardList.size();
	int totalCount2 = noticeList.size();
%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/include/headStyle.jsp" />
	<style type="text/css">
		ul.pagination{
			display: flex;
  			justify-content: center;
		}
		
		.datatr:nth-child(odd){
			background-color: #99ffff;
			cursor: pointer;
		}
		
		.datatr:nth-child(even){
			background-color: #00ffff;
			cursor: pointer;
		}
		
		span.reply-level{
    		display: inline-block;
    	}
	</style>
</head>
<body>
	<jsp:include page="/include/head.jsp"/>	
	<!-- END NAVBAR -->
	<jsp:include page="/include/left.jsp"/>	
	<div class="main">
		<!-- MAIN CONTENT -->
		<div class="main-content">
			<div class="container-fluid">
				<h3 class="page-title">게시판</h3>
				<div class="row">
					<div class="col-md-6">
						<!-- BASIC TABLE -->
						<div class="panel">
							<div class="panel-heading">
								<h3 class="panel-title">공지사항</h3>
							</div>
							<div class="panel-body">
								<table class="table table-bordered">
									<thead>
										<tr>
	                    					<th style="text-align:center">번호</th>
	                    					<th style="text-align:center">제목</th>
	                    					<th style="text-align:center">작성자</th>
	                    					<th style="text-align:center">작성일</th>
	                    					<th style="text-align:center">조회수</th>
	                  					</tr>
									</thead>
									<tbody>
									<%
	                					if(totalCount2 == 0){
	                				%>
	                						<tr>
	                							<td style="text-align:center" colspan="5">게시판 글이 없습니다.</td>
	                						</tr>
	                				<%
	                					} else {
	                						SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
	                						for(CusbodVO board: noticeList){
	                				%>
	                  						<tr class="datatr" onclick="location.href='/notice/noticeContent.jsp?num=<%=board.getCsnum()%>&cusid=<%=board.getCusid() %>&PageNum=1&type=&keyword='">
	                  							<td width="10%" align="center"><%=board.getCsnum() %></td>
	                  							<td width="40%">
		                  							<%
		                  								if(board.getCrelv() > 0){ // 답글이면	
		                  							%>
	                  										<span class="reply-level" style="width: <%=board.getCrelv()*15%>px"></span>
	                  										<i class="lnr lnr-chevron-right"></i>
	                  								<%
		                  								}
	                  								%>
	                  								<%=board.getCsbjt() %>
	                  							</td>
	                  							<td width="10%" align="center"><%=board.getCname() %>(<%=board.getCusid() %>)</td>

	                  							<td width="10%" align="center"><%=sdf.format(board.getCdate()) %></td>
	                  							<td width="10%" align="center"><%=board.getCrdcn() %></td>
	                  						</tr>
	                  				<%
	                						}
	                					}
	                  				%>
									</tbody>
								</table>
							</div>
						</div>
					</div>
										<div class="col-md-6">
						<!-- BASIC TABLE -->
						<div class="panel">
							<div class="panel-heading">
								<h3 class="panel-title">자유 게시판</h3>
							</div>
							<div class="panel-body">
								<table class="table table-bordered">
									<thead>
										<tr>
	                    					<th style="text-align:center">번호</th>
	                    					<th style="text-align:center">제목</th>
	                    					<th style="text-align:center">작성자</th>
	                    					<th style="text-align:center">작성일</th>
	                    					<th style="text-align:center">조회수</th>
	                    					<th style="text-align:center">추천</th>
	                  					</tr>
									</thead>
									<tbody>
									<%
	                					if(totalCount == 0){
	                				%>
	                						<tr>
	                							<td style="text-align:center" colspan="6">게시판 글이 없습니다.</td>
	                						</tr>
	                				<%
	                					} else {
	                						SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
	                						for(CusbodVO board: boardList){
	                				%>
	                  						<tr class="datatr" onclick="location.href='/board/boardContent.jsp?num=<%=board.getCsnum()%>&cusid=<%=board.getCusid() %>&PageNum=1&type=&keyword='">
	                  							<td width="10%" align="center"><%=board.getCsnum() %></td>
	                  							<td width="40%">
		                  							<%
		                  								if(board.getCrelv() > 0){ // 답글이면	
		                  							%>
	                  										<span class="reply-level" style="width: <%=board.getCrelv()*15%>px"></span>
	                  										<i class="lnr lnr-chevron-right"></i>
	                  								<%
		                  								}
	                  								%>
	                  								<%=board.getCsbjt() %>
	                  							</td>
	                  							<td width="10%" align="center"><%=board.getCname() %>(<%=board.getCusid() %>)</td>
	                  							<td width="10%" align="center"><%=sdf.format(board.getCdate()) %></td>
	                  							<td width="10%" align="center"><%=board.getCrdcn() %></td>
	                  							<td width="10%" align="center"><%=board.getRecom() %></td>
	                  						</tr>
	                  				<%
	                						}
	                					}
	                  				%>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>	
	<jsp:include page="/include/footer.jsp"/>
	<!-- END WRAPPER -->
	<jsp:include page="/include/commonJs.jsp"/>
</body>
</html>