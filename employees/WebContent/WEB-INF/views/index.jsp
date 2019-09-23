<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body>
	<h1>Index</h1>
	<h2>테이블 정보</h2>
	<!-- 테이블당 항목 개수 출력 -->
	<div>
		<table border="1">
			<thead>
				<tr>
					<th>테이블 이름</th>
					<th>전체 행의 수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>departments</td>
					<td>${departmentsRowCount }</td>
				</tr>
				<tr>
					<td>employees</td>
					<td>${employeesRowCount }</td>
				</tr>
				<tr>
					<td>dept_manager</td>
					<td>${deptmanagerRowCount }</td>
				</tr>
				<tr>
					<td>dept_emp</td>
					<td>${deptempRowCount }</td>
				</tr>
				
				<tr>
					<td>titles</td>
					<td>${titlesRowCount }</td>
				</tr>
				<tr>
					<td>salaries</td>
					<td>${salariesRowCount }</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<!-- WEB APP 네비게이션 -->
	<DIV>
		<ul>
			<li><a href="${pageContext.request.contextPath}/departments/getDepartmentsList">부서 목록</a></li>
			<li><a href="${pageContext.request.contextPath}/employees/getEmployeesList">사원 목록</a></li>
			<li>
				<a href="${pageContext.request.contextPath}/employees/getEmployeesListOrderBy?order=asc">오름차순(limit 50)</a>
				<a href="${pageContext.request.contextPath}/employees/getEmployeesListOrderBy?order=desc">내림차순(limit 50)</a>
			</li>
		</ul>
	</DIV>
</body>
</html>