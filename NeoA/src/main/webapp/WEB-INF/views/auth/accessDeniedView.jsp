<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
<%-- 인가(authorization) 과정에서 권한이 없을 때 보여주는 페이지  --%>
 <a href="${pageContext.request.contextPath}/home">홈으로</a><hr>
 권한이 없습니다. 
</body>
</html>