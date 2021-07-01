<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%-- spring security custom tag를 사용하기 위한 선언 --%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>   
인증 / 인가 테스트 결과 페이지 <br><br>
<sec:authorize access="isAuthenticated()">
	로그인한 사람이 볼 수 있음 
</sec:authorize>
<sec:authorize access="hasRole('ROLE_ADMIN') and hasRole('ROLE_MEMBER')">
<p>Must have ROLE_ADMIN and ROLE_MEMBER</p>
</sec:authorize>
