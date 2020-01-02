<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.js"></script>
<style>
	
</style>
</head>
<body>
	<div id="top-menu">
		<%@include file="/menu.jsp"%>
	</div>
	<!-- 제목 -->
	<div id="title">
		통계(연봉)
		<hr>
	</div>
	<div id="main">
		<div>
			<a href="/employees/salaries/getSalariesStatistics" style="text-decoration:none;">연봉 통계값(count, sum, avg, max, min, std), </a>
			<a href="/employees/employees/getEmployeesCountByGender" style="text-decoration:none;">사원 수(성별 group by gender)</a>
		</div>
		<br>
		<div style="display:inline-block;width:30%;vertical-align:top;">
			<table id="tlist">
				<thead>
					<tr>
						<th>통계</th>
						<th>값</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>count</td><td>${map.count }</td>
					</tr>
					<tr>
						<td>sum</td><td>${map.sum }</td>
					</tr>
					<tr>
						<td>avg</td><td>${map.avg }</td>
					</tr>
					<tr>
						<td>max</td><td>${map.max }</td>
					</tr>
					<tr>
						<td>min</td><td>${map.min }</td>
					</tr>
					<tr>
						<td>std</td><td>${map.std }</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div style="display:inline-block;width:60%;">
			<canvas id="myChart" width="400" height="400"></canvas>
		</div>
	</div>
</body>
<script>
	var count = "${map.count }";
	var sum = "${map.sum }";
	var avg = "${map.avg }";
	var max = "${map.max }";
	var min = "${map.min }";
	var std = "${map.std }";
	console.log("text : ",count,sum,avg,max,min,std);
	new Chart(document.getElementById("myChart"), {
	    type: 'horizontalBar',
	    data: {
	        labels: ['count', 'avg', 'max', 'min', 'std'],
	        datasets: [{
	            label: '통계',
	            data: [count,avg,max,min,std],
	            borderColor: "rgba(255, 201, 14, 1)",
	            backgroundColor: "rgba(255, 201, 14, 0.5)",
	            fill: false,
	        }]
	    },
	    options: {
	        responsive: true,
	        title: {
	            display: true,
	            text: '통계 차트 (sum 제외)'
	        },
	        hover: {
	            mode: 'nearest',
	            intersect: true
	        },
	        scales: {
	            xAxes: [{
	                display: true,
	                scaleLabel: {
	                    display: true,
	                    labelString: '통계'
	                },
	                ticks: {
	                    autoSkip: false
	                }
	            }],
	            yAxes: [{
	                display: true,
	                ticks: {
	                    suggestedMin: 0,
	                },
	                scaleLabel: {
	                    display: true,
	                    labelString: '값'
	                }
	            }]
	        }
	    }
	});
</script>
</html>