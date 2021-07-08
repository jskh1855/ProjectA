<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%-- spring security custom tag를 사용하기 위한 선언 --%>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%> 
<sec:authentication var="mvo" property="principal" />  
 
 ${mvo.name}님  카페입장 환영!
<br><br>
<%-- ajax 인증 test --%>
<script type="text/javascript">
	$(document).ready(function(){
		//ajaxSetup():  실행될  AJAX 요청에 대한 기본 속성을 정의해 재사용 
		$.ajaxSetup({
			success:function(result){					
				alert(result);
			},
			error: function (jqXHR) {
                alert("jqXHR status code:"+jqXHR.status+" message:"+jqXHR.responseText);
            }
		});//ajaxSetup
		$("#countBtn").click(function(){	
			$.ajax({
				type:"get",
				url:"getMemberTotalCount",
				success:function(result){					
					$("#countView").html(result+"명");
				},
				error: function (jqXHR) {
	                if(jqXHR.status==401){
	                	alert("인증이 필요합니다");
	                	//기존페이지를 새로운 페이지로 변경시킨다. 참고 - location.href="url"; 는 새로운 페이지로 이동시킨다 
	                	//href는 페이지를 이동하므로 뒤로가기 버튼을 누르면 이전 페이지로 이동이 가능,
                        //replace는 현재 페이지를 새로운 페이지로 대체하므로 이전 페이지로 이동이 불가 
	                	location.replace("home");
	                }
	            }
			});//ajax
		});//click
	});//ready
</script>	
<input type="button" value="총회원수보기" id="countBtn">
<span id="countView"></span> 


















