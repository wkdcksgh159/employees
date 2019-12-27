<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>employeesCountByGender</title>
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
		<table>
			<!-- list의 값을 변수 map에 저장 -->
			<c:forEach var="map" items="${list }">
				<tr>
					<!-- map의 값 출력 -->
					<td>${map }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>