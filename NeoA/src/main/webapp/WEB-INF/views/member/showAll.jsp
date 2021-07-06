<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%-- 전체 목록 출력을 위한 테스트 by jaehoon --%>
전체 목록 출력 
<div class="container">
ddd
	
	<table border="1">
		<tr>
			<th>넘버</th>
			<th>제품명</th>
			<th>시작가</th>
			<th>현재가</th>
			<th>남은시간(종료시간)</th>
		</tr>
	<c:forEach items="${postVOList}" var="list">
		<tr>
			<td>
				${list.productNo}
			</td>
			<td>
				<a href="${pageContext.request.contextPath}/user/showDetails?productNo=${list.productNo}" style="color: black">${list.productName}</a>
			</td>
			<td>
				${list.startPrice}
			</td>
			<td>
				${list.nowPrice}
			</td>
			<td>
				${list.bidEndTime}
			</td>
		</tr>
	</c:forEach>
	</table>

</div>