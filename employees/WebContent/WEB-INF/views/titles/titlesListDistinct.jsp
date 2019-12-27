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
		업무목록
		<hr>
	</div>
	<div id="main">	
		<ol>
			<c:forEach var="row" items="${list }">
				<li>${row}</li>
			</c:forEach>
		</ol>
	</div>
</body>
</html>