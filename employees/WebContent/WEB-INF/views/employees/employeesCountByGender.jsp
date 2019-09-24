<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>employeesCountByGender</title>
</head>
<body>
	<h1>사원 수(성별 group by gender)</h1>
	<a href="${pageContext.request.contextPath}/index">처음으로</a>
	<table border="1">
		<!-- list의 값을 변수 map에 저장 -->
		<c:forEach var="map" items="${list }">
			<tr>
				<!-- map의 값 출력 -->
				<td>${map }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>