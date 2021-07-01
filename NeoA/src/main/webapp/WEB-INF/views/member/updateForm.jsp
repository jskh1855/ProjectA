<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- spring security custom tag를 사용하기 위한 선언 --%>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>   
 <sec:authorize access="hasRole('ROLE_MEMBER')">
 <form method="post" action="${pageContext.request.contextPath}/updateMemberAction">
 <%-- 
  		csrf 토큰 : csrf 공격을 막기 위한 1회성 인증키인 
  		             csrf토큰을 함께 전달해야 수정이 가능하다
 
  --%>
 <sec:csrfInput/>
		<input type="hidden" name="command" value="update">
		아이디 : <input type="text" name="id" value="<sec:authentication property="principal.id"/>" readonly>
		<br>패스워드 : <input type="text" name="password" required="required">	
		<br>이름 : <input type="text" name="name" 
		value="<sec:authentication property="principal.name"/>" required="required">	
		<br>주소 : <input type="text" name="address" 
		value="<sec:authentication property="principal.address"/>" required="required">	
		<br><input type="submit" value="회원정보수정">
		</form>
</sec:authorize>
<h3>회원정보수정</h3>
		
