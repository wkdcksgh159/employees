<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<table id="elist">
		<thead>
			<tr>
				<th>count</th>
				<th>sum</th>
				<th>avg</th>
				<th>max</th>
				<th>min</th>
				<th>std</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${map.count }</td>
				<td>${map.sum }</td>
				<td>${map.avg }</td>
				<td>${map.max }</td>
				<td>${map.min }</td>
				<td>${map.std }</td>
			</tr>
		</tbody>
		</table>
	</div>
</body>
</html>