<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="com.example.repository.*"%>
<%@page import="com.example.domain.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String 	id		= (String) session.getAttribute("sessionid");
	String  cusid   = request.getParameter("cusid");
	String 	keyword	= request.getParameter("keyword");
	String 	PageNum = request.getParameter("PageNum");
	String 	type    = request.getParameter("type");
	int 	num		= Integer.parseInt(request.getParameter("num"));
	// DAO객체 준비
	CusbodDAO 	cusbodDAO	= CusbodDAO.getInstance();
	CususrDAO   cususrDAO   = CususrDAO.getInstance();
	CsreplDAO   csreplDAO   = CsreplDAO.getInstance();
	
	// 조회수 1 증가시키기
	cusbodDAO.updateBoardCount(num, "A");
	
	// 상세보기할 글 한개 가져오기
	CusbodVO cusbodVO = cusbodDAO.select(num, "A");
	CususrVO cususrVO = cususrDAO.select(cusbodVO.getCusid());
	
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>공지사항 게시글 상세보기</title>
	<jsp:include page="/include/headStyle.jsp" />
	<style>
		a{
			cursor: pointer;
		}
		
		a:hover{
			text-decoration: underline;
		}
	</style>
</head>
<body>
<input type="hidden" name="keyword" value="<%=keyword%>">
<input type="hidden" name="PageNum" value="<%=PageNum%>">
<input type="hidden" name="type" value="<%=type%>">	
<input type="hidden" name="id" id="id" value="<%=id%>">
<input type="hidden" name="cusid" id="cusid" value="<%=cusid%>">
<input type="hidden" name="num" id="num" value="<%=num%>">
	<jsp:include page="/include/head2.jsp"/>	
	<!-- END NAVBAR -->
	<jsp:include page="/include/left.jsp"/>	
	<div id="wrapper">
		<div class="vertical-align-wrap">
			<div class="vertical-align-middle">
				<div class="auth-box4">
					<div class="content">
						<div class="header">
							<div class="logo text-center"><h3>게시글 상세보기</h3></div>
							<br/>
						</div>
						<div class="form-group" align="center">
							<table class="table table-bordered">
								<tr>
                   					<th style="text-align:center;width:10%;background-color:#2B333E;color:white;">제목</th>
                   					<td style="width:30%;"><%=cusbodVO.getCsbjt() %></td>
                   					<th style="text-align:center;width:10%;background-color:#2B333E;color:white;">작성자</th>
                   					<td style="width:20%;"><%=cususrVO.getCname() %>(<%=cusbodVO.getCusid() %>)</td>
                 				</tr>
                 				<tr>
                   					<th style="text-align:center;width:10%;background-color:#2B333E;color:white;">작성일</th>
                   					<td style="width:20%;"><%=sdf.format(cusbodVO.getCdate()) %></td>
                   					<th style="text-align:center;background-color:#2B333E;color:white;">조회수</th>
                   					<td><%=cusbodVO.getCrdcn() %></td>
                 				</tr>
                 				<tr>
                 					<th style="text-align:center;background-color:#2B333E;color:white;">내용</th>
                   					<td colspan="3">
                   						<pre style="background-color:white;border:0"><%=cusbodVO.getCcont() %></pre>
                   					</td>
                  				</tr>
							</table>
						</div>
						<div class="form-group" align="right">
							<%
								if(id != null){
                					if(cusbodVO.getCusid().equals(cusid) && cusbodVO.getCusid().equals("admin")){ // 로그인 아이디와 글 작성자 아이디가 같을때
							%>
	                    				<a class="btn btn-info" href="/notice/noticeModify.jsp?PageNum=<%=PageNum%>&keyword=<%=keyword %>&type=<%=type %>&num=<%=cusbodVO.getCsnum()%>">
	                      					<i class="lnr lnr-checkmark-circle"></i> 글수정
	                    				</a>
	                    				<a class="btn btn-danger" onclick="remove(event)">
	                      					<i class="lnr lnr-cross"></i> 글삭제
	                    				</a>
							<%
                					}
                    		%>
                  			<%
                				}
                  			%>
                  			<a class="btn btn-dark" href="/notice/noticeList.jsp?PageNum=<%=PageNum%>&keyword=<%=keyword %>&type=<%=type %>#board">
                    			<i class="lnr lnr-list"></i> 글목록
                  			</a>
                  		</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/include/footer.jsp"/>							
	<jsp:include page="/include/commonJs.jsp"/>	
	<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
	<script>
		// 글삭제 버튼을 클릭하면 호출되는 함수
		function remove(event){
			event.preventDefault(); // a태그 기본동작 막기
			
			var isRemove = confirm("이 글을 정말 삭제하시겠습니까?");
			
			
			if(isRemove){
				location.href = '/notice/noticeRemove.jsp?PageNum=<%=PageNum%>&keyword=<%=keyword%>&type=<%=type%>&num=<%=num%>';	
			}
		}
		
	</script>	
</body>
</html>