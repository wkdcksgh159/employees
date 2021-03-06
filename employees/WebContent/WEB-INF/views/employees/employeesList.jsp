<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>employeesList</title>
</head>
<body>
	<div id="top-menu">
		<%@include file="/menu.jsp"%>
	</div>
	<!-- 제목 -->
	<div id="title">
		사원목록
		<hr>
	</div>
	<div id="main">
		<div id="employeesListAll">
			<%@include file="/employeesTag.jsp"%>
		</div>
		<br>
		<form method="get" action="${pageContext.request.contextPath}/employees/getEmployeesList">
			<select name="limit">
				<option value="10">10</option>
				<option value="20">20</option>
				<option value="30">30</option>
				<option value="40">40</option>
				<option value="50">50</option>
			</select>
			개씩
			<button type="submit">출력</button>
		</form>
		<table id="elist">
			<thead>
				<tr>
					<th>사원 번호</th>
					<th>사원 이름</th>
					<th>사원 성</th>
					<th>사원 생일</th>
					<th>사원 성별</th>
					<th>입사 날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="employees" items="${list}">
					<tr>
						<td>${employees.empNo }</td>
						<td>${employees.firstName }</td>
						<td>${employees.lastName }</td>
						<td>${employees.birthDate }</td>
						<td>${employees.gender }</td>
						<td>${employees.hireDate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>