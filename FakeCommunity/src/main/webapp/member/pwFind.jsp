<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/include/headStyle.jsp" />
	<title>아이디찾기</title>
</head>
<body>
<form name="user" action="/member/pwFind2.jsp" method="post">
<!-- WRAPPER -->
	<div id="wrapper">
		<div class="vertical-align-wrap">
			<div class="vertical-align-middle">
				<div class="auth-box lockscreen clearfix">
					<div class="content">
						<div class="header">
							<div class="logo text-center">비밀번호 찾기</div>
							<p class="lead">비밀번호 찾기</p>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" name="cusid" id="cusid" value="" placeholder="아이디"  onblur="idCheckFunction();" required="required">
							<p class="lead" id="pId"></p>
						</div>
						<div class="bottom">
							<button type="submit" class="btn btn-primary btn-lg btn-block">비밀번호 찾기</button>
							<button type="button" class="btn btn-dark btn-lg btn-block" onclick="history.go(-1)">돌아가기</button>
						</div>						
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
<script>
function idCheckFunction(){ 
	var cusid = $("#cusid").val(); 
	
	
	$.ajax({ 
		type : 'POST', 
		url : '/BoardIdCheckServlet', 
		data : {cusid : cusid}, 
		success : function(result){ 
			if(result == 1){ 
				$("#pId").css("color","red");
				$("#pId").html("아이디가 존재합니다"); 
			} else {
				if(cusid == ''){
					$("#pId").html("");
				} else {
					$("#pId").css("color","green");
					$("#pId").html("아이디가 존재하지 않습니다.");
				}
			} 
			
			
		} 
	}) 
}
</script>
</body>
</html>