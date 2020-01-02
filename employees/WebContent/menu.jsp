<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	#main {
/* 		border:1px solid; */
		margin:auto;
		width:1500px;
	}
	#title {
		font-size:45px;
		text-align:center;
		margin:70px;
		color:#585858;
		font-weight:600;
	}
	#title hr {
		width:50px;
		height:5px;
		background-color:#9b59b6;
	}
	#elist {
		border:1px solid;
		width:100%;
		text-align:center;
	}
	#elist th {
		border:1px solid;
		padding:20px;
		background-color:#ECCEF5;
	}
	#elist td {
		border:1px solid;
		padding:10px;
	}
	#tlist {
		border:1px solid;
		text-align:center;
		width:300px;
		height:500px;
		font-size:20px;
	}
	#tlist th {
		border:1px solid;
		padding:15px;
		background-color:#ECCEF5;
	}
	#tlist td {
		border:1px solid;
		padding:5px;
	}
</style>
<!-- 회사 카테고리 -->
<div style="font-size:30px;text-align:right;margin:80px;">
	<span style="float:left;">
		<a href="/employees/index">
			<img style="width:200px;position:absolute;left:0px;top:0px;" src="/employees/img/thanos.png">
		</a>
	</span>
	<span style="margin:70px;"><a href="/employees/index" style="text-decoration:none;color:black;">홈</a></span>
	<span style="margin:70px;"><a href="/employees/departments/getDepartmentsList" style="text-decoration:none;color:black;">부서목록</a></span>
	<span style="margin:70px;"><a href="/employees/employees/getEmployeesList" style="text-decoration:none;color:black;">사원목록</a></span>
	<span style="margin:70px;"><a href="/employees/titles/getTitlesListDistinct" style="text-decoration:none;color:black;">직급체계</a></span>
	<span style="margin:70px;"><a href="/employees/salaries/getSalariesStatistics" style="text-decoration:none;color:black;">통계</a></span>
</div>
<!-- 회사 로고 -->
<div style="background-color:#9b59b6;height:400px;text-align:center;">
	<img style="width:900px;" src="/employees/img/thanos-logo.png">
</div>