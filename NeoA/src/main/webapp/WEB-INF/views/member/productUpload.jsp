<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<div class="container">

<form action="${pageContext.request.contextPath}/upload" method="post" id="form" name="form" enctype="multipart/form-data">
<sec:csrfInput/>
	<input id="filename" name="filename" type="file" multiple="multiple"/>
	<input type="submit" value="등록"/>
</form>
</div>
