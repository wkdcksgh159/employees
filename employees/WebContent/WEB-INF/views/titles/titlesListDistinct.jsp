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
	<h1>업무 목록(중복제거 distinct)</h1>
	<a href="${pageContext.request.contextPath}/index">처음으로</a>
	<ol>
		<c:forEach var="row" items="${list }">
			<li>${row}</li>
		</c:forEach>
	</ol>
</body>
</html>