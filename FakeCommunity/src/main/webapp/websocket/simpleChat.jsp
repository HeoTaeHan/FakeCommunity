<%@page import="com.example.repository.CususrDAO"%>
<%@page import="com.example.domain.CususrVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//세션정보 로그인 아이디 가져오기
	String 		id			= (String) session.getAttribute("sessionid");
	CususrDAO 	cususrDAO 	= CususrDAO.getInstance();
	CususrVO 	cususr 		= cususrDAO.select(id);
%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/include/headStyle.jsp" />
	<meta charset="UTF-8">
	<title>채팅</title>
	<style>
		div#chat {
			display: none;
		}
	
		div#chatBox {
			width: 400px;
			height: 300px;
			padding: 20px 10px;
			border: 1px solid black;
			background-color: #CCFFFF;
			overflow: auto;
		}
	</style>
</head>
<body>
	<jsp:include page="/include/head2.jsp"/>	
	<!-- END NAVBAR -->
	<jsp:include page="/include/left.jsp"/>
	<input type="hidden" name="nickname" id="nickname" value="<%=cususr.getCname()%>">
	<!-- MAIN -->
	<div class="main">
		<!-- MAIN CONTENT -->
		<div class="main-content">
			<div class="container-fluid">
				<div class="panel">
					<div class="panel-heading">	
						<h3 class="panel-title">채팅</h3>
					</div>
					<div class="panel-body">
						<div id="chat">
							<div id="chatBox"></div>
							<br>
							<input type="text" id="message" placeholder="채팅글 입력">
							<button type="button" id="btnSend">전송</button>
							<button type="button" id="btnDisconnect">채팅방 연결끊기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END MAIN -->
	<jsp:include page="/include/footer.jsp"/>
	<!-- END WRAPPER -->
	<!-- Javascript -->
	<jsp:include page="/include/commonJs.jsp"/>
	<script>
		var webSocket;
		var nickname;
	
		// 채팅방 참가 버튼 클릭시
		$(document).ready(function() {
			nickname = $('input#nickname').val();
		
			connect();   // 웹소켓 객체생성하여 웹소켓 서버와 접속 후 소켓이벤트 연결하기
			addWinEvt(); // 브라우저에 beforeunload, unload 이벤트 연결하기
		});

	
		function connect() {
			var url = 'ws://' + location.host + '/simpleChat';
			
			// 웹소켓 서버에 연결하기
			webSocket = new WebSocket(url);
		
			// 소켓이벤트 연결하기 (총 4가지: open, message, close, error)
			webSocket.onopen    = onOpen;    // 서버와 연결된 후 호출됨
			webSocket.onclose   = onClose;   // 서버와 연결이 끊겼을때 호출됨
			webSocket.onmessage = onMessage; // 서버로부터 메시지리를 받으면 호출됨
		} // connect
	
		function onOpen(event) {
			webSocket.send(nickname + ' 님이 입장하였습니다.');
			scrollDown();
		
			$('div#chat').css('display', 'block');
		} // onOpen
	
		function onClose(event) {
			$('div#chatBox').append('<div class="chat-message">채팅방과 연결이 끊어졌습니다.</div>');
			
			scrollDown();
		} // onClose
	
		function onMessage(event) {
			var str = event.data;
			$('div#chatBox').append(`<div class="chat-message">\${str}</div>`);			
			
			scrollDown();
		} // onMessage
		
		// 전송버튼 클릿, 채팅내용을 서버에 전송하기
		$('#btnSend').on('click', function (){
			send();
		});
		
		// 채팅입력 글상자에서 엔터키 누를시, 채팅내용을 서버에 전송하기
		$('input#message').on('keyup', function (event){
			if(event.keyCode == 13){ // 엔터키를 누르면
				send();
			}
		});
		
		$('#btnDisconnect').on('click', function (){
			disconnect();
		});
		
		// 채팅 스크롤바를 하단으로 이동
		function scrollDown() {
			var scrollHeight = $('div#chatBox')[0].scrollHeight;
			$('div#chatBox').scrollTop(scrollHeight);
		}
		
		function send() {
			var message = $('input#message').val();
			
			webSocket.send(nickname + ' : ' + message); // 소켓서버에 메시지 전송하기
			
			$('input#message').val(''); // 텍스트 입력상자 비우기
			$('input#message').focus();
		}
		
		// beforeunload, unload 이벤트 연결
		function addWinEvt() {
			// 브라우저에 현재 화면이 unload 되기 이전에 발생되는 이벤트
			window.addEventListener('beforeunload', function (event) {
				var dialogText    = 'Dialog text here';
				// 크롬은 이벤트 객체에 returnValue 속성에 텍스트값 설정이 필요함
				event.returnValue = dialogText;
				return dialogText;
			});
			
			// 브라우저에 기존 화면이 다른 화면으로 완전히 unload 되면 발생되는 이벤트
			window.addEventListener('unload', function () {
				disconnect();
			});
		}
		
		function disconnect(){
			if(webSocket == null){
				return;
			}
			
			webSocket.send(nickname + ' 님이 퇴장하였습니다.');
			
			webSocket.close();
			webSocket = null;
			
			$(this).prop('disabled', true);
			$('#btnSend').prop('disabled', true);
		}
	</script>
</body>
</html>