<%@page import="java.util.*" %>
<%@page import="java.util.regex.*" %>
<%@page import="com.example.domain.CususrVO"%>
<%@page import="com.example.repository.CususrDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	String maskingName(String name){
    String maskedName = "";    
    String firstName = "";    
    String lastName = "";    
    int lastNameStartPoint;    
 
    if(!name.equals("") || name != null){
    	if(name.length() == 3){
    		firstName = name.substring(0, 1);
    		lastNameStartPoint = name.indexOf(firstName);
            lastName = name.substring(lastNameStartPoint + 1, name.length());
 
            String makers = "";
 
            for(int i = 0; i < lastName.length(); i++){
                makers += "*";
            }
 
            lastName = lastName.replace(lastName, makers);
            maskedName = firstName + lastName;
    	} else if(name.length() > 1){
            firstName = name.substring(0, 3);
            lastNameStartPoint = name.indexOf(firstName);
            lastName = name.substring(lastNameStartPoint + 3, name.length());
 
            String makers = "";
 
            for(int i = 0; i < lastName.length(); i++){
                makers += "*";
            }
 
            lastName = lastName.replace(lastName, makers);
            maskedName = firstName + lastName;
        }else{
            maskedName = "*";
        }
    }
    return maskedName;
}
%>
<%
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	String email  = email1 + "@" + email2;
	CususrDAO cususrDAO = CususrDAO.getInstance();
	CususrVO  cususr    = new CususrVO();
	int count = cususrDAO.countByEmail(email);
	String cusid = "";
	
	if(count == 0){
		cusid = "해당하는 메일에 아이디가 존재하지않습니다.";
	} else {
		 cususr = cususrDAO.selectEmail(email);
		 cusid = cususr.getCusid();
	}
%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/include/headStyle.jsp" />
	<title>아이디찾기</title>
</head>
<body>
<form action="/member/idFindSuccess.jsp" method="post">
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
							ID :<input type="text" name="cusid" id="cusid" value="<%=maskingName(cusid) %>" style="width:80%" readonly="readonly">
						</div>
						<div class="bottom">
							<button type="button" class="btn btn-dark btn-lg btn-block" onclick="location.href='/member/login.jsp'">돌아가기</button>
						</div>						
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
</body>
</html>