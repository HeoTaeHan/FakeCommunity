<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/include/headStyle.jsp" />
	<title>아이디찾기</title>
</head>
<body>
<form name="user" action="/member/idFindSuccess.jsp" method="post">
<!-- WRAPPER -->
	<div id="wrapper">
		<div class="vertical-align-wrap">
			<div class="vertical-align-middle">
				<div class="auth-box lockscreen clearfix">
					<div class="content">
						<div class="header">
							<div class="logo text-center">계정 찾기</div>
							<p class="lead">계정 찾기</p>
						</div>
						<div class="form-group">
							이메일 
							<input type="text" name="email1" id="email1">&nbsp;@&nbsp;
							<input type="text" name="email2" id="email2">
							<select name="email3" onchange="mailchanges()">
								<option value="">직접입력</option>
								<option value="naver.com">naver.com</option>
								<option value="hanmail.com">hanmail.com</option>
								<option value="daum.net">daum.net</option>
								<option value="nate.com">nate.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="hotmail.com">hotmail.com</option>
							</select>
						</div>
						<div class="bottom">
							<button type="submit" class="btn btn-primary btn-lg btn-block">계정찾기</button>
							<button type="button" class="btn btn-dark btn-lg btn-block" onclick="history.go(-1)">돌아가기</button>
						</div>						
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
<script>
	function mailchanges(){
		if(document.user.email3.value != ""){
			document.user.email2.value = document.user.email3.value; 
		} else {
			document.user.email2.value = "";
		}
	}
</script>
</body>
</html>