<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	alert("${param.id} 아이디에 해당하는 회원없음!");
	location.href="${pageContext.request.contextPath}/home";
</script>
