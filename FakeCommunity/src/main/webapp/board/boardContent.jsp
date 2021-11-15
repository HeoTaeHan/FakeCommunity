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
	AttachDAO 	attachDAO 	= AttachDAO.getInstance();
	CususrDAO   cususrDAO   = CususrDAO.getInstance();
	CrecomDAO   crecomDAO   = CrecomDAO.getInstance();
	CntcomDAO   cntcomDAO   = CntcomDAO.getInstance();
	CsreplDAO   csreplDAO   = CsreplDAO.getInstance();
	
	// 조회수 1 증가시키기
	cusbodDAO.updateBoardCount(num, "F");
	
	// 상세보기할 글 한개 가져오기
	CusbodVO cusbodVO = cusbodDAO.select(num, "F");
	CususrVO cususrVO = cususrDAO.select(id);
	CrecomVO crecomVO = new CrecomVO();
	CntcomVO cntcomVO = new CntcomVO();
	CsreplVO csreplVO = new CsreplVO();
	
	Vector<AttachVO> attachV = attachDAO.getAttachesByBno(num);
	Vector<CsreplVO> csreplV = csreplDAO.selectAll(num);	
	
	if(crecomDAO.count(num) == 0){
		crecomVO.setRecom(0);
	} else {
		crecomVO = crecomDAO.select(num);
	}
	
	if(cntcomDAO.count(num) == 0){
		cntcomVO.setCntcm(0);
	} else {
		cntcomVO = cntcomDAO.select(num);
	}
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>자유 게시판 게시글 상세보기</title>
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
                   					<th style="text-align:center;width:10%;background-color:#2B333E;color:white;">작성일</th>
                   					<td style="width:20%;"><%=sdf.format(cusbodVO.getCdate()) %></td>
                 				</tr>
                 				<tr>
                   					<th style="text-align:center;background-color:#2B333E;color:white;">조회수</th>
                   					<td><%=cusbodVO.getCrdcn() %></td>
                   					<th style="text-align:center;background-color:#2B333E;color:white;">추천</th>
                   					<td style="color:blue"><input type="text" id="recom" value="<%=crecomVO.getRecom() %>" style="border:0" readonly="readonly"></td>
                   					<th style="text-align:center;background-color:#2B333E;color:white;">비추천</th>
                   					<td style="color:red"><input type="text" id="notrecom" value="<%=cntcomVO.getCntcm() %>" style="border:0" readonly="readonly"></td>
                 				</tr>
                 				<tr>
                 					<th style="text-align:center;background-color:#2B333E;color:white;">내용</th>
                   					<td colspan="5">
                   						<pre style="background-color:white;border:0"><%=cusbodVO.getCcont() %></pre>
                   					</td>
                  				</tr>
                  				<tr>
                    					<th style="text-align:center;background-color:#2B333E;color:white;">첨부파일</th>
                    					<td colspan="5">
                    						<%
                    							if(attachV.size() == 0){ // 첨부파일 없으면
                    						%>
                    								첨부파일이 없음.
                    						<%
                    							} else { // 첨부파일 있으면
                    						%>
													<ul>
                    						<%		
                    									for(AttachVO attachVO : attachV) {
                    										if(attachVO.getFiletype().equals("O")){ // 일반파일
                    						%>
                    											
                    											<li>
                    												<%--다운로드할 일반파일 경로 --%>
                    												<a href="/board/download.jsp?fileName=<%=attachVO.getUploadpath() + "/" +  attachVO.getFilename()%>">
	                    												<i class="lnr lnr-link"></i>
	                    												<%=attachVO.getFilename() %>
                    												</a>
                    											</li>
                    						<%					
                    										} else {
                    						%>
                    											<li>
                    												<a href="/board/download.jsp?fileName=<%=attachVO.getUploadpath() + "/" +  attachVO.getFilename()%>">
                    													<%--썸네일 이미지 경로 --%>
                    													<img src="/board/display.jsp?fileName=<%=attachVO.getUploadpath() + "/s_" +  attachVO.getFilename()%>">
                    												</a>
                    											</li>
                    						<%					
                    										}
                    									}
                    						%>
                    								</ul>
                    						<%
                    							}
                    						%>
                    					</td>
                  					</tr>
							</table>
						</div>
						<div class="form-group" align="center">
							<%
								if(id != null){
							%>
									<a class="btn btn-primary" onclick="recomCheckFunction()">
										<i class="lnr lnr-thumbs-up"></i> 추천
									</a>
									<a class="btn btn-danger" onclick="notrecomCheckFunction()">
										<i class="lnr lnr-thumbs-down"></i> 비추천
									</a>
							<%
								}
							%>
						</div>
						<div class="form-group" align="right">
							<%
								if(id != null){
                					if(cusbodVO.getCusid().equals(id)){ // 로그인 아이디와 글 작성자 아이디가 같을때
							%>
	                    				<a class="btn btn-info" href="/board/boardModify.jsp?PageNum=<%=PageNum%>&keyword=<%=keyword %>&type=<%=type %>&num=<%=cusbodVO.getCsnum()%>">
	                      					<i class="lnr lnr-checkmark-circle"></i> 글수정
	                    				</a>
	                    				<a class="btn btn-danger" onclick="remove(event)">
	                      					<i class="lnr lnr-cross"></i> 글삭제
	                    				</a>
							<%
                					}
                    		%>
                    				<a class="btn btn-pink" href="/board/replyWrite.jsp?PageNum=<%=PageNum%>&keyword=<%=keyword %>&type=<%=type %>&reRef=<%=cusbodVO.getCrerf()%>&reLev=<%=cusbodVO.getCrelv()%>&reSeq=<%=cusbodVO.getCresq()%>">
                      					<i class="lnr lnr-chevron-right-circle"></i> 답글
                    				</a>
                  			<%
                				}
                  			%>
                  			<a class="btn btn-dark" href="/board/boardList.jsp?PageNum=<%=PageNum%>&keyword=<%=keyword %>&type=<%=type %>#board">
                    			<i class="lnr lnr-list"></i> 글목록
                  			</a>
                  		</div>
                  		<div class="form-group" align="left">
                  			<i class="lnr lnr-layers"></i> 댓글(<%=csreplV.size()%>)
                  		</div>
                  		<div class="form-group" align="center">
                  			<table class="table table-bordered" style="border-spacing : 0;">
                  				<%
                  					int count = 0;
                  					if(csreplV.size() != 0){
                  						for(CsreplVO csrepl: csreplV){
                  							count++;
                  				%>
                  						<input type="hidden" name="conum" value="<%=csrepl.getConum()%>">
                  						<tr style="border:0;" class="test<%=count%>">
                  							<td style="width:80%">
												<%
		                  							if(csrepl.getCrelv() > 0){ // 답글이면	
	                  							%>
	                  									<span class="reply-level" style="width: <%=csrepl.getCrelv()*15%>px"></span>
	                 									<i class="lnr lnr-chevron-right"></i>
	                  							<%
		                  							}
	                  							%>
                  								<i class="lnr lnr-user"></i> <%=cususrVO.getCname() %>(<%=csrepl.getCusid() %>)
                  							</td>
                  							<td>
                  								<%=sdf.format(csrepl.getCdate()) %>&nbsp;
                  								<%
                  									if(cusbodVO.getCusid().equals(cusid)){ // 로그인 아이디와 글 작성자 아이디가 같을때 
                  								%>
		                  								<span style="border-right:1px solid;"></span>
		                  								&nbsp;<a onclick="remove2(event, '<%=csrepl.getConum()%>')" id="replyRemove">삭제</a>&nbsp;
		                  								<span style="border-right:1px solid;"></span>
		                  								&nbsp;<a onclick="modify(event, '<%=csrepl.getConum()%>', 
		                  								'<%=csrepl.getCnten()%>','<%=sdf.format(csrepl.getCdate()) %>',
		                  								'<%=csrepl.getConum()%>','<%=cususrVO.getCname() %>',
		                  								'<%=csrepl.getCusid() %>','test<%=count %>','tests<%=count %>')" id="replyModify">수정</a>&nbsp;
                  										<span style="border-right:1px solid;"></span>
		                  						<%
                  									}
		                  						%>
                  								&nbsp;<a onclick="replyre(event,'tests<%=count%>','<%=csrepl.getCrerf()%>','<%=csrepl.getCrelv()%>'
                  								,'<%=csrepl.getCresq()%>')">답글</a>
                  							</td>
                  						</tr>
                  						<tr class="tests<%=count%>">
                  							<td colspan="2">
                  								<pre style="border:0;background-color:white"><%=csrepl.getCnten() %></pre>
                  							</td>
                  						</tr>
                  				<%
                  						}
                  					}
                  				%>
                  			</table>
                  		</div>
                  		<%
                  			if(id != null){
                  		%>
		                  		<div class="form-group" align="center">
		                  			댓글작성
		                  			<textarea cols="180px" name="cnten" id="ta"></textarea>
		                  			<a class="btn btn-success" onclick="reply(event)">댓글작성</a>
		                  		</div>
                  		<%
                  			}
                  		%>
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
				location.href = '/board/boardRemove.jsp?PageNum=<%=PageNum%>&keyword=<%=keyword%>&type=<%=type%>&num=<%=num%>';	
			}
		}
		
		function modify(event, data, cnten, date, conum, cname, cusid, count, count2){
			var cnten = cnten.replaceAll('<br>','\n');
			var htmls = `
				<tr style="border:0;">
					<td style="width:80%"><i class="lnr lnr-user"></i>\${cname}(\${cusid})</td>
					<td colspan="2">
						\${date}&nbsp;
						<span style="border-right:1px solid;"></span>
						&nbsp;<a id="replyModify2" onclick="reply2(event,'\${conum}')">수정</a>&nbsp;
						<span style="border-right:1px solid;"></span>
						&nbsp;<a onclick="location.reload();" id="replyModify2">취소</a>&nbsp;
					</td>
				</tr>
				<tr>
					<td>
						<textarea cols="110px" name="cnten2" id="ta2">\${cnten}</textarea>
					</td>
				</tr>
				<input type="hidden" name="conum" value="\${conum}">
			`;
			$('.'+count).empty();
			$('.'+count2).empty();
			$('.'+count).replaceWith(htmls);
			var addrow = $('.addrow');
			if(addrow != null){
				$('.addrow').empty();	
			}
		}
		
		function replyre(event, data, crerf, crelv, cresq){
			event.preventDefault(); // a태그 기본동작 막기
			var htmls = `
				<tr class="addrow">
					<td colspan="2">
						답글작성
          				<textarea cols="120px" name="cnten3" id="ta3"></textarea><a class="btn btn-success" onclick="reply3(event,'\${crerf}','\${crelv}','\${cresq}')">답글작성</a>
					</td>
				</tr>
				<input type="hidden" name="crerf" value="\${crerf}">
				<input type="hidden" name="crelv" value="\${crelv}">
				<input type="hidden" name="cresq" value="\${cresq}">
			`;
			$('.'+data).after(htmls);
		}
		
		function remove2(event, data){
			event.preventDefault(); // a태그 기본동작 막기
			
			var isRemove = confirm("이 댓글을 정말 삭제하시겠습니까?");
			
			
			if(isRemove){
				location.href = '/board/boardReplyRemove.jsp?PageNum=<%=PageNum%>&keyword=<%=keyword%>&type=<%=type%>&cusid=<%=cusid%>&num=<%=num%>&conum='+data;	
			}
		}
		
		function reply2(event, conum){
			event.preventDefault();
			
			var cnten = $('textarea#ta2').val().replace(/(\n|\r\n)/g, '<br>');
			
			location.href = '/board/boardReplyModify.jsp?PageNum=<%=PageNum%>&keyword=<%=keyword%>&type=<%=type%>&num=<%=num%>&cusid=<%=cusid%>&cnten='+cnten + '&conum='+conum;
		}
		
		function reply3(event, crerf, crelv, cresq){
			event.preventDefault();
			
			var cnten = $('textarea#ta3').val().replace(/(\n|\r\n)/g, '<br>');
			
			location.href = '/board/boardReplyRePro.jsp?PageNum=<%=PageNum%>&keyword=<%=keyword%>&type=<%=type%>&num=<%=num%>&cusid=<%=cusid%>&cnten='+cnten + '&crerf=' + crerf + '&crelv=' + crelv + '&cresq=' + cresq;
		}
		
		function reply(event){
			event.preventDefault();
			
			var cnten = $('textarea#ta').val().replace(/(\n|\r\n)/g, '<br>');
			
			location.href = '/board/boardReply.jsp?PageNum=<%=PageNum%>&keyword=<%=keyword%>&type=<%=type%>&num=<%=num%>&cusid=<%=cusid%>&cnten='+cnten;
		}
		
		
		function recomCheckFunction(){
			var id    = $("#cusid").val();
			var num   = $("#num").val();
			var cusid = id + "*" + num;
			
			$.ajax({ 
				type : 'POST', 
				url : '/BoardRecomCheckServlet', 
				data : {cusid : cusid}, 
				success : function(result){ 
					$("#recom").val(result);					
				} 
			}) 
		}
		
		function notrecomCheckFunction(){
			var id    = $("#cusid").val();
			var num   = $("#num").val();
			var cusid = id + "*" + num;
			
			$.ajax({ 
				type : 'POST', 
				url : '/BoardNotRecomCheckServlet', 
				data : {cusid : cusid}, 
				success : function(result){ 
					$("#notrecom").val(result);					
				} 
			}) 
		}
	</script>	
</body>
</html>