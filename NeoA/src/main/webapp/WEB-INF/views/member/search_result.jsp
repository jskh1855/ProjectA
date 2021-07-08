<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    


	<div class="container">

	<table border="1">
		<tr>
			<th>넘버</th>
			<th>제품사진</th>
			<th>제목</th>
			<th>제품명</th>
			<th>현재가</th>
			<th>종료시간</th>
			<th>판매자아이디</th>
			<th>판매자이름</th>
		</tr>
	<c:forEach items="${searchResult}" var="list">
		<tr>
			<td>${list.productNo}</td>
			<td>${list.postImage}</td>
			<td>${list.title}</td>
			<td>${list.productName}</td>
			<td>${list.nowPrice}</td>
			<td>${list.bidEndTime}</td>
			<td>${list.memberVO.memberId}</td>
			<td>${list.memberVO.name}</td>
		</tr>
	</c:forEach>
	</table> 
</div>
