<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/include/headStyle.jsp" />
	<meta charset="UTF-8">
	<title>관리자 화면 - MultiPartEmail 전송하기</title>
</head>
<body>
<jsp:include page="/include/head2.jsp"/>	
	<!-- END NAVBAR -->
	<jsp:include page="/include/left.jsp"/>
		<!-- MAIN -->
	<div class="main">
		<!-- MAIN CONTENT -->
		<div class="main-content">
			<div class="container-fluid">
				<div class="panel">
					<div class="panel-heading">	
						<h3 class="panel-title">관리자 화면 - MultiPartEmail 전송하기</h3>
					</div>
					<div class="panel-body">
						<form action="/email/multipart-mail" method="post" enctype="multipart/form-data">
							받는 사람 : <input type="text" name="receiver" placeholder="여러명 입력시 aa@a.com, bb@b.com, ..."><br>
							메일 제목 : <input type="text" name="subject"><br>
							메일 내용 : <textarea rows="5" cols="40" name="msg"></textarea><br>
							첨부 파일 : <input type="file" name="file"><br>
							<button class="btn btn-success" type="submit"><i class="lnr lnr-envelope"></i> 메일 전송</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/include/commonJs.jsp"/>
</body>
</html>