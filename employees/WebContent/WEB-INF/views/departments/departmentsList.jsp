<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>departmentsList</title>
</head>
<body>
	<div id="top-menu">
		<%@include file="/menu.jsp"%>
	</div>
	<!-- 제목 -->
	<div id="title">
		부서목록
		<hr>
	</div>
	<div id="main">
		<table border="1">
			<thead>
				<tr>
					<th>부서 번호</th>
					<th>부서 이름</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="departments" items="${list}">
					<tr>
						<td>${departments.deptNo }</td>
						<td>${departments.deptName }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div style="border:1px solid;">
			<div style="height:100px;">
				안녕하세요 저는
			</div>
			<hr style="border:1px solid;">
			<div style="height:400px;">
				장찬호 입니다.
			</div>
		</div>
	</div>
</body>
</html>