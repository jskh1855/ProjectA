<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="container">

<form action="${pageContext.request.contextPath}/productUpload2" method="post" id="form" name="form" enctype="multipart-form-data">
	<input id="filename" name="filename" type="file"/>
	<input type="submit" value="등록"/>
</form>
</div>
