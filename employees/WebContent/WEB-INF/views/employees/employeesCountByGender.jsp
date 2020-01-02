<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>employeesCountByGender</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.js"></script>
</head>
<body>
	<div id="top-menu">
		<%@include file="/menu.jsp"%>
	</div>
	<!-- 제목 -->
	<div id="title">
		통계(사원 수)
		<hr>
	</div>
	<div id="main">
		<div>
			<a href="/employees/salaries/getSalariesStatistics" style="text-decoration:none;">연봉 통계값(count, sum, avg, max, min, std), </a>
			<a href="/employees/employees/getEmployeesCountByGender" style="text-decoration:none;">사원 수(성별 group by gender)</a>
		</div>
		<br>
		<div style="display:inline-block;width:30%;">
		<table id="tlist">
			<!-- list의 값을 변수 map에 저장 -->
			<thead>
				<tr>
					<th>성별</th>
					<th>인원수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="map" items="${list }">
					<tr>
						<!-- map의 값 출력 -->
						<td>${map.gender }</td><td>${map.cnt }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
		<div style="display:inline-block;width:60%;">
			<canvas id="myChart" width="auto" height="auto"></canvas>
		</div>
	</div>
</body>
<script>
	let gender = [];
	let cnt = [];
	//el 반복문으로 서블릿에서 넘긴 값 받기
	<c:forEach var="map" items="${list }">
		gender.push("${map.gender }");
		cnt.push(${map.cnt });
	</c:forEach>
	console.log(gender);
	console.log(cnt);
	//성별별 분포도 계산
	allCnt = cnt[0] + cnt[1];
	console.log(allCnt);
	cnt1 = Math.round(cnt[0]/allCnt*100);
	cnt2 = Math.round(cnt[1]/allCnt*100);
	console.log("분포도 확인 : ",cnt1,cnt2);
	cntDis = [cnt1, cnt2];
	//차트 출력
	new Chart(document.getElementById("myChart"), {
	    type: 'pie',
	    data: {
	        labels: gender,
	        datasets: [{
	            label: '통계',
	            data: cntDis,
	            borderColor: ["rgba(138, 043, 226, 1)","rgba(255, 020, 147, 1)"],
	            backgroundColor: ["rgba(138, 043, 226, 0.5)","rgba(255, 020, 147, 0.5)"],
	            fill: false,
	        }]
	    },
	    options: {
	        responsive: true,
	        title: {
	            display: true,
	            text: '성벌 분포도'
	        },
	        hover: {
	            mode: 'nearest',
	            intersect: true
	        }
	    }
	});
</script>
</html>