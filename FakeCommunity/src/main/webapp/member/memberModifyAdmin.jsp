<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.example.domain.CususrVO"%>
<%@page import="com.example.repository.CususrDAO"%>
<%
  	String ctx = request.getContextPath(); //콘텍스트명 얻어오기.
  	response.setHeader("Pragma-directive", "no-cache");
  	response.setHeader("Cache-directive", "no-cache");
  	response.setHeader("Pragma", "no-cache");
  	response.setHeader("Cache-Control", "no-cache");
  	response.setDateHeader("Expires",0);
  	String		id			= (String) session.getAttribute("sessionid");
  	String		cusid		= request.getParameter("cusid");
  	String 		keyword		= request.getParameter("keyword");
	String 		PageNum 	= request.getParameter("PageNum");
	String 		type    	= request.getParameter("type");
  	CususrDAO	cususrDAO 	= CususrDAO.getInstance();
	CususrVO	cususr		= cususrDAO.select(cusid);
	String		birth		= cususr.getBirth().substring(0,4) + "-" + cususr.getBirth().substring(4,6) + "-" + cususr.getBirth().substring(6,8);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Imagetoolbar" content="no" />
<jsp:include page="/include/headStyle.jsp" />
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<script>
	$(function(){
	$("#zipcode").click(function(){
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
            $("input[name=zcode]").val(data.zonecode);
            if(data.userLanguageType == 'K' && data.userSelectedType == 'R'){
	            if(data.buildingName != ''){
					$("input[name=adres]").val(data.address);
					$("input[name=adr02]").val("("+data.buildingName+")");
	            } else {
	            	$("input[name=adres]").val(data.address);
	            }
            } else if(data.userLanguageType == 'E' && data.userSelectedType == 'R') {
            	$("input[name=adres]").val(data.roadAddressEnglish);
            } else if(data.userLanguageType == 'K' && data.userSelectedType == 'J') {
            	$("input[name=adres]").val(data.jibunAddress);
            } else if(data.userLanguageType == 'E' && data.userSelectedType == 'J') {
            	$("input[name=adres]").val(data.jibunAddressEnglish);
            }
        }
    }).open()
    });
    });
	var rand;
	
	 
	
	//캡차 오디오 요청
	
	function audioCaptcha(type) {
	
	       var kor = (type > 0) ? "lan=kor&":"";
	
	       $.ajax({
	
	             url: '/captcha/CaptChaAudio.jsp',
	
	             type: 'POST',
	
	             dataType: 'text',
	
	             data: 'rand=' + rand + '&ans=y',
	
	             async: false,      
	
	             success: function(resp) {
	
	                    var uAgent = navigator.userAgent;
	
	                    var soundUrl = '/captcha/CaptChaAudio.jsp?' + kor + 'rand=' + rand + '&ans=' + resp;
	                    
						console.log(soundUrl);
	
	                    if (uAgent.indexOf('Trident') > -1 || uAgent.indexOf('MSIE') > -1) {
	
	                           winPlayer(soundUrl+'&agent=msie');
	
	                    } else if (!!document.createElement('audio').canPlayType) {
	
	                           try { new Audio(soundUrl).play(); } catch(e) { winPlayer(soundUrl); }
	
	                    } else window.open(soundUrl, '', 'width=1,height=1');
	
	             }
	
	       });
	
	}
	
	function winPlayer(objUrl) {
	
	       $('#audiocatpch').html(' <bgsound src="' + objUrl + '">');
	
	}
	
	 
	
	//캡차 이미지 요청 (캐쉬문제로 인해 이미지가 변경되지 않을수있으므로 요청시마다 랜덤숫자를 생성하여 요청)
	
	function changeCaptcha() {
	
	       rand = Math.random();
	
	       $('#catpcha').html('<img src="<%=ctx%>/captcha/CaptChaImg.jsp?rand=' + rand + '"/>');
	
	}
	
	 
	
	$(document).ready(function() {
	
	      
	
	       changeCaptcha(); //캡차 이미지 요청
	
	      
	
	       $('#reLoad').click(function(){ changeCaptcha(); }); //새로고침버튼에 클릭이벤트 등록
			
	       $('#soundOn').click(function(){ audioCaptcha(0); }); //음성듣기버튼에 클릭이벤트 등록
	       $('#soundOnKor').click(function(){ audioCaptcha(1); }); //음성듣기버튼에 클릭이벤트 등록
	
	       //확인 버튼 클릭시
	
	       $('#frmSubmit').click(function(){
	
	             if ( !$('#answer').val() ) {
	
	                    alert('이미지에 보이는 숫자 또는 스피커를 통해 들리는 숫자를 입력해 주세요.');
	
	             } else {
	
	                    $.ajax({
	
	                           url: '/captcha/CaptchaSubmit.jsp',
	
	                           type: 'POST',
	
	                           dataType: 'text',
	
	                           data: 'answer=' + $('#answer').val(),
	
	                           async: false,      
	
	                           success: function(resp) {
									
                                	if(resp.trim() == '입력값이 일치합니다.'){
										document.user.submit();                              		
                                	} else {
                                		alert(resp.trim());
	                                 	$('#reLoad').click();
	
	                                 	$('#answer').val('');
                                	}
	                           }
	
	                    });
	
	             }
	
	       });
	
	});
</script>
</head>
<body>
<form name="user" action="/member/memberModifyAdminPro.jsp" method="post">
<input type="hidden" name="keyword" value="<%=keyword%>">
<input type="hidden" name="PageNum" value="<%=PageNum%>">
<input type="hidden" name="type" value="<%=type%>">	
<input type="hidden" name="id" id="id" value="<%=id%>">
	<div id="wrapper">
		<div class="vertical-align-wrap">
			<div class="vertical-align-middle">
				<div class="auth-box2">
						<div class="content">
							<div class="header">
								<div class="logo text-center">회원정보 수정</div>
								<p class="lead" style="text-align: center;">회원정보를 수정합니다.</p>
							</div>
							<div class="form-group">
								<table align="center">
									<tr>
										<td>
											<input type="text" class="form-control" name="cusid" id="cusid" value="<%=cususr.getCusid() %>" readonly="readonly">
										</td>
									</tr>
									<tr>
										<td>
											<br/>
											<input type="password" class="form-control" id="signin-password" value="<%=cususr.getPaswd() %>" name="paswd" placeholder="비밀번호" required="required">
											<p class="lead" id="pPw"></p>
										</td>
									</tr>
									<tr>
										<td>
											<input type="password" class="form-control" id="signin-password"  value="<%=cususr.getPaswd() %>" name="Repaswd" onblur="passwordcheck()" placeholder="비밀번호확인" required="required">
											<p class="lead" id="pRePw"></p>
										</td>
									</tr>
									<tr>
										<td>
											<input type="text" class="form-control" name="cname" placeholder="이름" value="<%=cususr.getCname() %>" required="required">
										</td>
									</tr>
									<tr>
										<td>
											<br/>
											비밀번호 확인 질문
											<select name="chint">
												<option value="1" <%=cususr.getChint().equals("1")?"selected":"" %>>기억에 남는 추억의 장소는?</option>
												<option value="2" <%=cususr.getChint().equals("2")?"selected":"" %>>자신의 인생의 좌우명은?</option>
												<option value="3" <%=cususr.getChint().equals("3")?"selected":"" %>>자신의 보물 제1호는?</option>
												<option value="4" <%=cususr.getChint().equals("4")?"selected":"" %>>가장 기억에 남는 선생님 성함은?</option>
												<option value="5" <%=cususr.getChint().equals("5")?"selected":"" %>>타인이 모르는 자신만의 신체비밀이 있다면?</option>
												<option value="6" <%=cususr.getChint().equals("6")?"selected":"" %>>추억하고 싶은 날짜가 있다면?</option>
												<option value="7" <%=cususr.getChint().equals("7")?"selected":"" %>>받았던 선물 중 기억에 남는 독특한 선물은?</option>
												<option value="8" <%=cususr.getChint().equals("8")?"selected":"" %>>유년시절 가장 생각나는 친구 이름은?</option>
												<option value="9" <%=cususr.getChint().equals("9")?"selected":"" %>>인상깊게 읽은 책 이름은?</option>
												<option value="10" <%=cususr.getChint().equals("10")?"selected":"" %>>읽은 책 중에서 좋아하는 구절이 있다면?</option>
												<option value="11" <%=cususr.getChint().equals("11")?"selected":"" %>>자신이 두번째로 존경하는 인물은?</option>
												<option value="12" <%=cususr.getChint().equals("12")?"selected":"" %>>친구들에게 공개하지 않은 어릴 적 별명이 있다면?</option>
												<option value="13" <%=cususr.getChint().equals("13")?"selected":"" %>>초등학교 때 기억에 남는 짝꿍 이름은?</option>
												<option value="14" <%=cususr.getChint().equals("14")?"selected":"" %>>다시 태어나면 되고 싶은 것은?</option>
												<option value="15" <%=cususr.getChint().equals("15")?"selected":"" %>>내가 좋아하는 캐릭터는?</option>
											</select>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
											비밀번호 확인 답변
											<input type="text" name="reslt" value="<%=cususr.getReslt() %>" required="required" style="align:center;width:74.5%">
										</td>
									</tr>
									<tr>
										<td>
											<br/>
											휴대번호 
											<select name="phone1">
												<option value="010" <%=cususr.getPhone().substring(0,3).equals("010")?"selected":"" %>>010</option>
												<option value="011" <%=cususr.getPhone().substring(0,3).equals("011")?"selected":"" %>>011</option>
												<option value="016" <%=cususr.getPhone().substring(0,3).equals("016")?"selected":"" %>>016</option>
												<option value="017" <%=cususr.getPhone().substring(0,3).equals("017")?"selected":"" %>>017</option>
												<option value="018" <%=cususr.getPhone().substring(0,3).equals("018")?"selected":"" %>>018</option>
												<option value="019" <%=cususr.getPhone().substring(0,3).equals("019")?"selected":"" %>>019</option>
											</select>
											&nbsp;-&nbsp;
											<input type="text" name="phone2" value="<%=cususr.getPhone().substring(3,7) %>" onkeydown="return isNumberKey2(event);" maxlength="4">
											&nbsp;-&nbsp;
											<input type="text" name="phone3" value="<%=cususr.getPhone().substring(7,11) %>" onkeydown="return isNumberKey2(event);" maxlength="4">
										</td>
									</tr>
									<tr>
										<td>
											<br/>
											생년월일
											<input type="date" name="birth" value="<%=birth %>" style="align:center;width:87%">
										</td>
									</tr>
									<tr>
										<td>
											<br/>
											이메일
											<input type="text" name="email1" id="email1" value="<%=cususr.getEmail().substring(0,cususr.getEmail().lastIndexOf("@")) %>"  onblur="emailCheckFunction();">&nbsp;@&nbsp;
											<input type="text" name="email2" id="email2" value="<%=cususr.getEmail().substring(cususr.getEmail().lastIndexOf("@")+1) %>" onblur="emailCheckFunction();" >
											<select name="email3" onchange="mailchanges()" onblur="emailCheckFunction();">
												<option value="">직접입력</option>
												<option value="naver.com">naver.com</option>
												<option value="hanmail.com">hanmail.com</option>
												<option value="daum.net">daum.net</option>
												<option value="nate.com">nate.com</option>
												<option value="gmail.com">gmail.com</option>
												<option value="hotmail.com">hotmail.com</option>
											</select>
											<p class="lead" id="pEmail"></p>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
											주소
											<input type="text" name="zcode" value="<%=cususr.getZcode() %>" style="width:20%" onkeydown="return isNumberKey2(event);">&nbsp;<a href="#" id="zipcode" title="신주소"><i class="fa fa-search"></i></a>
											&nbsp;<input type="text" name="adres" value="<%=cususr.getAdres() %>" style="width:68%">
										</td>
									</tr>
									<tr>
										<td>
											<br/>
											주소상세
											<input type="text" name="adr02" value="<%=cususr.getAdr02() %>" style="width:87%">
										</td>
									</tr>
								</table>
							</div>
							<button type="submit" class="btn btn-blue btn-lg btn-block">확인</button>
							<button type="button" class="btn btn-dark btn-lg btn-block" onclick="location.href='/member/memberContent.jsp?PageNum=<%=PageNum%>&keyword=<%=keyword %>&type=<%=type %>&cusid=<%=cususr.getCusid()%>'">돌아가기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function isNumberKey2(evt) {
			var charCode = (evt.which) ? evt.which : evt.keyCode;
			if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57)) {
				return false;
			}
	
			var value_tmp = evt.srcElement.value;
		
	 		// 소수점(.)이 두번 이상 나오지 못하게
	    	var pattern1 = /^\d*[.]\d*$/; // 현재 value값에 소수점(.) 이 있으면 . 입력불가
	    	if (pattern1.test(value_tmp)) {
	        	if (charCode == 46) {
	            	return false;
	        	}
	    	}
	  		return true;
		}
	 
		function emailCheckFunction(){ 
			var email1 = $("#email1").val();
			var email2 = $("#email2").val();
			var email  = email1 + "@" + email2; 
			
			
			$.ajax({ 
				type : 'POST', 
				url : '/BoardEmailCheckServlet', 
				data : {email : email}, 
				success : function(result){ 
					if(result == 1){ 
						$("#pEmail").css("color","red");
						$("#pEmail").html("사용중인 이메일입니다. 다른 이메일을 입력해 주세요"); 
					} else {
						if(email1 == ''){
							$("#pEmail").html("");
						} else {
							$("#pEmail").css("color","green");
							$("#pEmail").html("사용할 수 있는 이메일입니다.");
						}
					} 
					
					
				} 
			}) 
		}
		
		function passwordcheck(){
			if(document.user.paswd.value != document.user.Repaswd.value){
				document.getElementById("pRePw").style.color = "red";
				document.getElementById("pRePw").innerText   = "비밀번호가 일치 하지 않습니다.";
			} else {
				document.getElementById("pRePw").style.color    = "green";
				document.getElementById("pRePw").style.fontSize = "20px";
				document.getElementById("pRePw").innerText      = "비밀번호가 일치 합니다!!";
			}
		}
	
		function mailchanges(){
			if(document.user.email3.value != ""){
				document.user.email2.value = document.user.email3.value; 
			} else {
				document.user.email2.value = "";
			}
		}
	</script>
</form>	
</body>
</html>