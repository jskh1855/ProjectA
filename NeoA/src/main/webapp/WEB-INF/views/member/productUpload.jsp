<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="container">

<<<<<<< HEAD
<form action="${pageContext.request.contextPath}/productUpload2" id="form" name="form" enctype="multipart/form-data">
=======
<form action="${pageContext.request.contextPath}/productUpload2" method="post" id="form" name="form" enctype="multipart-form-data">
>>>>>>> f6d82289ed5e4bb8130d2bdb081a06b1c1439b21
	<input id="filename" name="filename" type="file"/>
	<input type="submit" value="등록"/>
</form>
</div>
