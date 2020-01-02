<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		직급체계
		<hr>
	</div>
	<div id="main">
		<div style="margin-left:15%;">
			<div style="display:inline-block;vertical-align:top">
				<ul style="font-size:45px;">
					<c:forEach var="row" items="${list }">
						<li>${row}</li>
					</c:forEach>
				</ul>
			</div>
			<div style="display:inline-block;width:55%;margin-left:10%;vertical-align:bottom">
				<img style="width:100%" src="/employees/img/rank system.jpg">
			</div>
		</div>
	</div>
</body>
</html>