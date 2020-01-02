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
<!-- 		<table border="1"> -->
<!-- 			<thead> -->
<!-- 				<tr> -->
<!-- 					<th>부서 번호</th> -->
<!-- 					<th>부서 이름</th> -->
<!-- 				</tr> -->
<!-- 			</thead> -->
<!-- 			<tbody> -->
<%-- 				<c:forEach var="departments" items="${list}"> --%>
<!-- 					<tr> -->
<%-- 						<td>${departments.deptNo }</td> --%>
<%-- 						<td>${departments.deptName }</td> --%>
<!-- 					</tr> -->
<%-- 				</c:forEach> --%>
<!-- 			</tbody> -->
<!-- 		</table> -->
		<c:forEach var="departments" items="${list}">
			<div>
				<div style="background-color:#ECCEF5;position:relative;height:100px;">
					<div style="position:absolute;top:40px;right:30px;font-size:20px;color:gray;">
						${departments.deptNo }
					</div>
					<div style="position:absolute;top:30px;left:30px;font-size:30px;font-weight:600;">
						${departments.deptName }			
					</div>
				</div>
				<hr style="border:1px solid;margin:0">
				<div style="height:500px;">
					<img style="width:100%;height:100%;" src="/employees/img/${departments.deptName}.jpg">
				</div>
				<hr style="border:1px solid;margin:0">
				<c:if test="${departments.deptName eq 'Marketing'}">
					<div style="height:80px;padding:30px;">
						각 제품 및 서비스에 대한 매출, 판매량, 이익률, 고객의 평가 등을 분석하고 자사 브랜드가 소비자에게 어떻게 인식되는지
						파악하고 기업이 원하는 방향으로 인지될 수 있도록 관리하며 고객이 원하거나 필요로 하는 서비스를 제공한다.
					</div>
				</c:if>
				<c:if test="${departments.deptName eq 'Finance'}">
					<div style="height:80px;padding:30px;">
						회계직무는 크게 회계업무와 세무업무로 나눠 집니다. 회계업무는 기업활동을 수행하는 과정에서 발생하는 수많은 경제적 활동들을 
						체계적으로 기록 및 정리ㆍ요약을 실시하며, 회계정보를 활용하여 의사결정자들에게 유용한 정보를 제공하는 업무를 수행합니다.
					</div>
				</c:if>
				<c:if test="${departments.deptName eq 'Human Resources'}">
					<div style="height:80px;padding:30px;">
						인사기획, 인력채용, 교육훈련, 평가, 보상, 급여 및
						복리후생, 승진, 노사관리 등과 관련한 업무들을 담당
					</div>
				</c:if>
				<c:if test="${departments.deptName eq 'Production'}">
					<div style="height:80px;padding:30px;">
						공정개선을 통해 원가 절감, 생산성 및 품질 향상, 공정 관리 등
						불량률을 최소화하며 원가절감을 이루며 제품생산이 원활하게 이루어질 수 있도록 유지하는 업무를 담당
					</div>
				</c:if>
				<c:if test="${departments.deptName eq 'Development'}">
					<div style="height:80px;padding:30px;">
						고객니즈와 시장상황에 부합하는 신제품을 개발하고 기존 제품을 지속적으로 개선,
						미래의 핵심기술을 연구함으로써 회사 이익증대와 기술경제력 확보에 기여
					</div>
				</c:if>
				<c:if test="${departments.deptName eq 'Quality Management'}">
					<div style="height:80px;padding:30px;">
						품질관리란 품질관리를 통해 품질을 결점이 없도록 균일하게 유지하고, 품질과 관련된 문제 발생 시 
						이를 해결하는 모든 활동을 말한다. 생산관리와 판매관리를 통해 기업의 생산 및 공정 효율성을 높이는 것이 주요 업무다.
					</div>
				</c:if>
				<c:if test="${departments.deptName eq 'Sales'}">
					<div style="height:80px;padding:30px;">
						이익을 창출하기 위해 벌이는 판매활동을 하는 부서, 눈에 보이는 완성 제품은 물론, 보이지 않는 기술과 서비스에 이르기까지 다양한 유무형의
						제품을 판매 및 신규시장 개천전략 수립, 판촉 활동, 고객 관리, 매출 보고 등의 업무를 담당
					</div>
				</c:if>
				<c:if test="${departments.deptName eq 'Research'}">
					<div style="height:80px;padding:30px;">
						고객 Needs를 분석하여 타당성 및 적용 가능성을 검토하고 효과적인 도입을 위한 표준 절차 및 지침을 개발, 제정합니다.
					</div>
				</c:if>
				<c:if test="${departments.deptName eq 'Customer Service'}">
					<div style="height:80px;padding:30px;">
						고객만족을 위한 서비스를 기획하고, 고객을 만족시키기 위한 전략을 세우고,
						실행방법을 고민하며 관련 교육 계획을 수립하고, 고객서비스 평가를 담당
					</div>
				</c:if>
				<c:if test="${departments.deptName eq 'Strategic Planning'}">
					<div style="height:80px;padding:30px;">
						전사&경영방침/가치관/방향/미션 등을 다양한 채널을 통해 직원과 공유하며 회사의 비전 실현에 가장 적합한 조직으로 한 단계 나아갈 수 있도록 제반되는 조직관리 전략을 개선
					</div>
				</c:if>
			</div>
		</c:forEach>
	</div>
</body>
</html>