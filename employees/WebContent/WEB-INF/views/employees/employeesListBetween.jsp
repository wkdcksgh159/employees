<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		사원목록
		<hr>
	</div>
	<div id="main">
		<div id="employeesListAll">
			<%@include file="/employeesTag.jsp"%>
		</div>
		<table id="elist">
			<thead>
				<tr>
					<th>사원 번호</th>
					<th>사원 생일</th>
					<th>사원 이름</th>
					<th>사원 성</th>
					<th>사원 성별</th>
					<th>입사 날짜</th>
				</tr>
			</thead>
			<tbody>
				<!-- list의 값을 참조하는 변수 employees 생성 -->
				<c:forEach var="employees" items="${list }">
					<tr>
						<td>${employees.empNo }</td>
						<td>${employees.birthDate }</td>
						<td>${employees.firstName }</td>
						<td>${employees.lastName }</td>
						<td>${employees.gender }</td>
						<td>${employees.hireDate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>