<%@page import="model.EmployeesDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
	<a href="/employees/employees/getEmployeesList" style="text-decoration:none;">사원목록, </a>
	<a href="/employees/employees/getEmployeesListOrderBy?order=asc" style="text-decoration:none;">오름차순(limit 50), </a>
	<a href="/employees/employees/getEmployeesListOrderBy?order=desc" style="text-decoration:none;">내림차순(limit 50), </a>
	<a href="/employees/employees/getEmployeesListByPage" style="text-decoration:none;">사원목록 페이지(10명씩)</a>
</div>
<div>
	<!-- 사원번호 범위 입력 -->
	<form method="post" action="/employees/employees/getEmployeesListBetween">
		<input type="number" name="begin">~<input type="number" name="end">
		<button type="submit">사원 목록 between...and...</button>
		<% 
			EmployeesDao employeesDao = new EmployeesDao();
			int maxEmpNo = employeesDao.selectEmpNo("max");
			int minEmpNo = employeesDao.selectEmpNo("min");
		%>
		<%=minEmpNo %>~<%=maxEmpNo %>
	</form>
</div>