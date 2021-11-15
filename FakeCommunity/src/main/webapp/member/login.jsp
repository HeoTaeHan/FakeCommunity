<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/include/headStyle.jsp" />
	<title>로그인</title>
</head>
<body>
<form class="form-auth-small" action="/member/loginPro.jsp" method="post">
<!-- WRAPPER -->
	<div id="wrapper">
		<div class="vertical-align-wrap">
			<div class="vertical-align-middle">
				<div class="auth-box ">
					<div class="left">
						<div class="content">
							<div class="header">
								<div class="logo text-center">로그인</div>
								<p class="lead">계정 로그인</p>
							</div>
							
								<div class="form-group">
									<label for="signin-id" class="control-label sr-only">id</label>
									<input type="text" class="form-control" id="signin-id" name="id" value="" placeholder="아이디">
								</div>
								<div class="form-group">
									<label for="signin-password" class="control-label sr-only">Password</label>
									<input type="password" class="form-control" id="signin-password" name="password" placeholder="비밀번호">
								</div>
								<div class="form-group clearfix">
									<label class="fancy-checkbox element-left">
										<input type="checkbox" name="rememberMe">
										<span>로그인 유지</span>
									</label>
								</div>
								<button type="submit" class="btn btn-primary btn-lg btn-block">로그인</button>
								<button type="button" class="btn btn-dark btn-lg btn-block" onclick="location.href='/index.jsp'">돌아가기</button>
								<div class="bottom">
									<span class="helper-text"><i class="fa fa-lock"></i> <a href="/member/idFind.jsp">아이디</a> 및 <a href="/member/pwFind.jsp">비밀번호</a>찾기</span>
								</div>
							
						</div>
					</div>
					<div class="right">
						<div class="overlay"></div>
						<div class="content text">
							<h1 class="heading">환영합니다!</h1>
							<p>Rp Community</p>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- END WRAPPER -->	
	<jsp:include page="/include/footer.jsp"/>
</form>	
</body>
</html>