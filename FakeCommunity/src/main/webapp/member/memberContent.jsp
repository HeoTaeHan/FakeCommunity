<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="com.example.repository.*"%>
<%@page import="com.example.domain.*"%>
<%
	String 	id		= (String) session.getAttribute("sessionid");
	String  cusid   = request.getParameter("cusid");
	String 	keyword	= request.getParameter("keyword");
	String 	PageNum = request.getParameter("PageNum");
	String 	type    = request.getParameter("type");
	// DAO객체 준비
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	CususrDAO 	cususrDAO 	= CususrDAO.getInstance();
	CususrVO 	cususrVO 	= cususrDAO.select(cusid);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원정보 관리 상세보기</title>
	<jsp:include page="/include/headStyle.jsp" />
	<style>
		a{
			cursor: pointer;
		}
		
		a:hover{
			text-decoration: underline;
		}
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
<jsp:include page="/include/head2.jsp"/>	
	<!-- END NAVBAR -->
	<jsp:include page="/include/left.jsp"/>	
<input type="hidden" name="keyword" value="<%=keyword%>">
<input type="hidden" name="PageNum" value="<%=PageNum%>">
<input type="hidden" name="type" value="<%=type%>">	
<input type="hidden" name="id" id="id" value="<%=id%>">
<input type="hidden" name="cusid" id="cusid" value="<%=cusid%>">
	<div id="wrapper">
		<div class="vertical-align-wrap">
			<div class="vertical-align-middle">
				<div class="auth-box4">
					<div class="content">
						<div class="header">
							<div class="logo text-center"><h3>회원정보 상세보기</h3></div>
							<br/>
						</div>
						<div class="form-group" align="center">
							<table class="table table-bordered"> 
								<tr>
                   					<th style="text-align:center;width:10%;background-color:#2B333E;color:white;">유저ID</th>
                   					<td style="width:30%;"><%=cususrVO.getCusid() %></td>
                   					<th style="text-align:center;width:10%;background-color:#2B333E;color:white;">유저명</th>
                   					<td style="width:20%;"><%=cususrVO.getCname() %></td>
                   					<th style="text-align:center;width:10%;background-color:#2B333E;color:white;">비밀번호</th>
                   					<td style="width:20%;"><%=cususrVO.getPaswd() %></td>
                 				</tr>
                 				<tr>
                 					<th style="text-align:center;width:10%;background-color:#2B333E;color:white;">생년월일</th>
                   					<td style="width:30%;"><%=cususrVO.getBirth().substring(0,4) %>-<%=cususrVO.getBirth().substring(4,6) %>-<%=cususrVO.getBirth().substring(6,8) %></td>
                   					<th style="text-align:center;width:10%;background-color:#2B333E;color:white;">휴대폰</th>
                   					<td style="width:20%;"><%=cususrVO.getPhone().substring(0,3) %>-<%=cususrVO.getPhone().substring(3,7) %>-<%=cususrVO.getPhone().substring(7,11) %></td>
                   					<th style="text-align:center;width:10%;background-color:#2B333E;color:white;">이메일</th>
                   					<td style="width:20%;"><%=cususrVO.getEmail() %></td>
                 				</tr>
                 				<tr>
                 					<th style="text-align:center;width:10%;background-color:#2B333E;color:white;">주소</th>
                 					<td colspan="5">[<%=cususrVO.getZcode() %>]<%=cususrVO.getAdres() %></td>
                 				</tr>
                 				<tr>
                 					<th style="text-align:center;width:10%;background-color:#2B333E;color:white;">주소상세</th>
                 					<td colspan="5"><%=cususrVO.getAdr02() %></td>
                 				</tr>
							</table>
						</div>
						<div class="form-group" align="right">
							<%
								if(id != null){
                					if(cususrVO.getCusid().equals(cusid)){ // 로그인 아이디와 글 작성자 아이디가 같을때
							%>
	                    				<a class="btn btn-info" href="/member/memberModifyAdmin.jsp?PageNum=<%=PageNum%>&keyword=<%=keyword %>&type=<%=type %>&cusid=<%=cususrVO.getCusid()%>">
	                      					<i class="lnr lnr-checkmark-circle"></i> 회원정보 수정
	                    				</a>
	                    				<a class="btn btn-danger" onclick="remove(event)" id="btnRemove">
	                      					<i class="lnr lnr-cross"></i> 회원정보삭제
	                    				</a>
							<%
                					}
                    		%>
                  			<%
                				}
                  			%>
                  			<a class="btn btn-dark" href="/member/memberList.jsp?PageNum=<%=PageNum%>&keyword=<%=keyword %>&type=<%=type %>#board">
                    			<i class="lnr lnr-list"></i> 글목록
                  			</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/include/footer.jsp"/>							
	<jsp:include page="/include/commonJs.jsp"/>	
	<script>
		$('a#btnRemove').on('click', function(){
			var isRemove = confirm('정말 삭제하시겠습니까?');
		
			if(isRemove == true){
				location.href = '/member/memberRemoveAdminPro.jsp?PageNum=<%=PageNum%>&keyword=<%=keyword %>&type=<%=type %>&cusid=<%=cususrVO.getCusid()%>';	
			}
		});
	</script>	
</body>
</html>