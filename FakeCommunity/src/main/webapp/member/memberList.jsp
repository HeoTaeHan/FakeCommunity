<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="com.example.domain.*"%>
<%@page import="com.example.repository.*"%>
<%
	//세션정보 로그인 아이디 가져오기
	String id = (String) session.getAttribute("sessionid");
	//글목록 가져오기 조건객체 준비
	Criteria cri = new Criteria(); // 기본값 1페이지 10개
	//요청 페이지번호 가져오기
	String strPageNum = request.getParameter("PageNum");
	if (strPageNum != null) { // 요청 페이지번호 있으면
		cri.setPageNum(Integer.parseInt(strPageNum)); // cri에 값 설정
	}
	//요청 글개수 가져오기
	String strAmount = request.getParameter("amount");
	if (strAmount != null) {
		cri.setAmount(Integer.parseInt(strAmount));
	}
	
	// 요청된 검색유형 파라미터값 가져오기
	String type = request.getParameter("type");
	if(type == null){
		type = "";
	}
	
	if(type != null){
		cri.setType(type);
	}
	// 요청된 검색어 파라미터값 가져오기
	String keyword = request.getParameter("keyword");
	
	if(keyword == null){
		keyword = "";
	}
	
	if(keyword != null){
		cri.setKeyword(keyword);
	}
	
	//DAO 객체 준비
	CususrDAO cususrDAO = CususrDAO.getInstance();
	if(cususrDAO.countAdmin(cri) == (cri.getPageNum()-1) * cri.getAmount() && cususrDAO.countAdmin(cri) != 0){
		cri.setPageNum((cri.getPageNum()-1));
	}
	
	//board 테이블에서 전체글 리스트로 가져오기
	Vector<CususrVO> cususrList = cususrDAO.selectPageOptionAdmin(cri);
	
	int totalCount = cususrList.size();
	
	//페이지블록 정보 객체준비. 필요한 정보를 생성자로 전달.
	PageDTO pageDTO = new PageDTO(cri, totalCount);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 정보 관리</title>
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
	</style>
</head>
<body>
	<jsp:include page="/include/head2.jsp"/>	
	<!-- END NAVBAR -->
	<jsp:include page="/include/left.jsp"/>
<form id="frm">
<!-- MAIN -->
	<div class="main">
		<!-- MAIN CONTENT -->
		<div class="main-content">
			<div class="container-fluid">
				<div class="panel">
					<div class="panel-heading">
						<h3 class="panel-title">회원정보 관리</h3>
					</div>
					<div class="panel-body">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th style="text-align:center">번호</th>
									<th style="text-align:center">유저ID</th>
									<th style="text-align:center">유저명</th>
									<th style="text-align:center">이메일</th>
									<th style="text-align:center">주소</th>
									<th style="text-align:center">가입일자</th>
								</tr>
							</thead>
							<tbody>
							<%
								if(totalCount == 0){
							%>
                					<tr>
                						<td style="text-align:center" colspan="7">등록된 회원이 없습니다.</td>
                					</tr>
                			<%
								} else {
									int count = 0;
									SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
            						for(CususrVO cususr: cususrList){
            							count++;
                			%>
                						<tr class="datatr" onclick="location.href='/member/memberContent.jsp?cusid=<%=cususr.getCusid()%>&PageNum=<%=pageDTO.getCri().getPageNum()%>&type=<%=pageDTO.getCri().getType() %>&keyword=<%=pageDTO.getCri().getKeyword() %>'">
                							<td width="10%" align="center"><%=count %></td>
                							<td width="10%" align="center"><%=cususr.getCusid() %></td>
                							<td width="10%" align="center"><%=cususr.getCname() %></td>
                							<td width="10%" align="center"><%=cususr.getEmail() %></td>
                							<td width="50%"><%=cususr.getAdres() %>&nbsp;<%=cususr.getAdr02() %></td>
                							<td width="10%" align="center"><%=sdf.format(cususr.getCdate()) %></td>
                						</tr>
                			<%
            						}
								}
                			%>
							</tbody>
						</table>
						<ul class="pagination">
							<%
              					// 이전
              					if(pageDTO.isPrev()){
              				%>
                					<li>
										<a href="/member/memberList.jsp?PageNum=<%=pageDTO.getStartPage() - 1 %>&type=<%=pageDTO.getCri().getType() %>&keyword=<%=pageDTO.getCri().getKeyword() %>#board"><i class="material-icons">chevron_left</i></a>
                					</li>
                			<%
              					} else {
                			%>
                					<li class="disabled">
										<a href="#board">
                							<i class="fas fa-angle-left"></i>
                						</a>
                					</li>
                			<%
              					}
                			%>
                			<%
                				// 페이지블록 내 최대 5개 페이지씩 출력
                				for(int i = pageDTO.getStartPage(); i <= pageDTO.getEndPage(); i ++){
                			%>
		                			<li class="<%=(pageDTO.getCri().getPageNum() == i) ? "active":""%>"><a href="/member/memberList.jsp?PageNum=<%=i %>&type=<%=pageDTO.getCri().getType() %>&keyword=<%=pageDTO.getCri().getKeyword() %>#board"><%=i %></a></li>
                			<%
                				}
                			%>
                			<%
              					// 이전
              					if(pageDTO.isNext()){
              				%>
		                			<li><a href="/member/memberList.jsp?PageNum=<%=pageDTO.getEndPage() + 1 %>&type=<%=pageDTO.getCri().getType() %>&keyword=<%=pageDTO.getCri().getKeyword() %>#board"><i class="material-icons">chevron_right</i></a></li>
		                	<%
              					} else {
                			%>
                					<li class="disabled">
										<a href="#board">
                							<i class="fas fa-angle-right"></i>
                						</a>
                					</li>
                			<%
              					}
                			%>
						</ul>
						<div align="center">
							<i class="lnr lnr-select"></i>
                    		<label>검색 조건</label>
							<select name="type">
                      			<option value="" disabled selected>--</option>
                      			<option value="cusid" <%=pageDTO.getCri().getType().equals("cusid")?"selected":"" %>>유저ID</option>
                      			<option value="cname" <%=pageDTO.getCri().getType().equals("cname")?"selected":"" %>>유저명</option>
                      			<option value="email" <%=pageDTO.getCri().getType().equals("email")?"selected":"" %>>이메일</option>
                    		</select>
							<i class="lnr lnr-magnifier"></i>
              				<label for="autocomplete-input">검색어</label>
              				<input type="text" id="autocomplete-input" class="autocomplete" name="keyword" value="<%=pageDTO.getCri().getKeyword()%>">
              				<button type="button" class="btn btn-info" id="btnSearch"><i class="lnr lnr-magnifier"></i>검색</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
	<jsp:include page="/include/footer.jsp"/>							
	<jsp:include page="/include/commonJs.jsp"/>	
	<script>
		$('button#btnSearch').on('click', function (){
			var query = $('#frm').serialize();
			
			
  			var url = '/member/memberList.jsp';
  			location.href = url + '?' + query + '#board';
  		});
  	</script>
</body>
</html>