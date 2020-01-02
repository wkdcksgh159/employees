<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body>
	<div id="top-menu">
		<%@include file="/menu.jsp"%>
	</div>
	<!-- 제목 -->
	<div id="title">
		홈
		<hr>
	</div>
	<div id="main">
		<!-- 페이지 기능 간략히 출력 -->
		<div style="margin:auto;color:white;">
			<div style="display:inline-block;width:45%;margin:35px;">
				<div style="border:1px solid;height:80px;background-color:#9b59b6;">
					<div style="position:relative;top:20px;left:20px;font-size:30px;">
						부서목록
					</div>
				</div>
				<div style="border:1px solid;height:250px;">
					<a href="/employees/departments/getDepartmentsList">
						<img style="width:100%;height:100%;" src="/employees/img/DepartmentsList.JPG">
					</a>
				</div>
			</div>
			<div style="display:inline-block;width:45%;margin:35px;">
				<div style="border:1px solid;height:80px;background-color:#9b59b6;">
					<div style="position:relative;top:20px;left:20px;font-size:30px;">
						사원목록
					</div>
				</div>
				<div style="border:1px solid;height:250px;">
					<a href="/employees/employees/getEmployeesList">
						<img style="width:100%;height:100%;" src="/employees/img/EmployeesList.JPG">
					</a>
				</div>
			</div>
			<br>
			<div style="display:inline-block;width:45%;margin:35px;">
				<div style="border:1px solid;height:80px;background-color:#9b59b6;">
					<div style="position:relative;top:20px;left:20px;font-size:30px;">
						직급체계
					</div>
				</div>
				<div style="border:1px solid;height:250px;">
					<a href="/employees/titles/getTitlesListDistinct">
						<img style="width:100%;height:100%;" src="/employees/img/TitlesList.JPG">
					</a>
				</div>
			</div>
			<div style="display:inline-block;width:45%;margin:35px;">
				<div style="border:1px solid;height:80px;background-color:#9b59b6;">
					<div style="position:relative;top:20px;left:20px;font-size:30px;">
						통계
					</div>
				</div>
				<div style="border:1px solid;height:250px;">
					<a href="/employees/salaries/getSalariesStatistics">
						<img style="width:100%;height:100%;" src="/employees/img/SalariesStatistics.JPG">
					</a>
				</div>
			</div>
		</div>
		<hr style="border:1px solid;margin:30px;">
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
				<li><a href="/employees/departments/getDepartmentsList">부서 목록</a></li>
				<li><a href="/employees/employees/getEmployeesList">사원 목록</a></li>
				<li>
					사원 목록 first_name
					<a href="/employees/employees/getEmployeesListOrderBy?order=asc">오름차순(limit 50)</a>
					<a href="/employees/employees/getEmployeesListOrderBy?order=desc">내림차순(limit 50)</a>
				</li>
				<li><a href="/employees/titles/getTitlesListDistinct">업무 목록</a></li>
				<li><a href="/employees/salaries/getSalariesStatistics">연봉 통계값(count, sum, avg, max, min, std)</a></li>
				<li><a href="/employees/employees/getEmployeesCountByGender">사원 수(성별 group by gender)</a></li>
				<!-- 
					url : /departments/getDepartmentsCountByDeptNo
					controller : GetDepartmentsCountByDeptNoServlet.class
					model : DepartmentsDao.selectDepartmentsCountByDeptNo()
					view : /WEB-INF/views/departments/departmentsCountByDeptNo.jsp
				 -->
				<li><a href="/employees/departments/getDepartmentsCountByDeptNo">부서당 사원 수</a></li>
				<li><a href="/employees/employees/getEmployeesListByPage">사원목록 페이지(10명씩)</a></li>
			</ul>
		</DIV>
		<div>
			<!-- 사원번호 범위 입력 -->
			<form method="post" action="/employees/employees/getEmployeesListBetween">
				<input type="number" name="begin">~<input type="number" name="end">
				<button type="submit">사원 목록 between...and...</button>
				${minEmpNo }~${maxEmpNo }
			</form>
		</div>
	</div>
</body>
</html>