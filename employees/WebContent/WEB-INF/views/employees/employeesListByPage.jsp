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
	<h1>사원목록 페이지(10명씩)</h1>
	<table border="1">
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
	<a href="${pageContext.request.contextPath}/employees/getEmployeesListByPage?currentPage=1">시작 페이지</a>
	<c:if test="${currentPage > 1 }">
		<a href="${pageContext.request.contextPath}/employees/getEmployeesListByPage?currentPage=${currentPage-1}">이전</a>
	</c:if>
	<c:if test="${currentPage < lastPage }">
		<a href="${pageContext.request.contextPath}/employees/getEmployeesListByPage?currentPage=${currentPage+1}">다음</a>
	</c:if>
	<a href="${pageContext.request.contextPath}/employees/getEmployeesListByPage?currentPage=${lastPage}">마지막 페이지</a>
</body>
</html>