<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/include/headStyle.jsp" />
	<meta charset="UTF-8">
	<title>파이 그래프 - 회원별 글 작성수</title>
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
						<h3 class="panel-title">파이 그래프 - 회원별 글 작성수</h3>
					</div>
					<div class="panel-body">
						<canvas id="myChart" width="400" height="300"></canvas>
					</div>
				</div>
			</div>
		</div>
	</div>	
	<!-- Javascript -->
	<script src="/js/chart.min.js"></script>
	<jsp:include page="/include/commonJs.jsp"/>
	<script>
		$(document).ready(function() {
			requestChartData();
		});
		
		function requestChartData() {
			$.ajax({
				url: '/api/chart/gender-per-count',
				method: 'GET',
				success: function (data) {
					drawChart(data.labelList, data.dataList);
				}
			});
		} // requestChartData
		
		function drawChart(labelList, dataList) {
			// 차트를 그릴 캔버스 객체 가져오기
			var canvas = document.getElementById('myChart');
			// 캔버스 객체에 그림을 그릴 컨텍스트 객체 가져오기
			var context = canvas.getContext('2d');
			// 파이 차트 그리기
			var myChart = new Chart(context, {
				type: 'pie',
				data: {
					labels: labelList, // 차트 레이블 적용
					datasets: [
						{
							data: dataList, // 차트 데이터 적용
							backgroundColor: ['green', 'yellow', 'blue', 'gray'],
							hoverBackgroundColor: ['lightgreen', 'lightyellow', 'lightblue', 'lightgray']
						}
					]
				},
				options: {
					responsive: false
				}
			});
		} // drawChart
	</script>
</body>
</html>