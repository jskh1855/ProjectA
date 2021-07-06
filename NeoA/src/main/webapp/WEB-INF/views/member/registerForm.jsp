<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script type="text/javascript">
 	$(document).ready(function(){
		var checkResultId="";		
		$("#regForm").submit(function(){				
			if(checkResultId==""){
				alert("아이디 중복확인을 하세요");
				return false;
			}		
		});
		$("#regForm :input[name=memberId]").keyup(function(){
			var id=$(this).val().trim();
			if(id.length<4 || id.length>10){
				$("#idCheckView").html("아이디는 4자이상 10자 이하여야 함!").css(
						"background","pink");
				checkResultId="";
				return;
			}
			// spring security 적용시 ajax post 방식은 아래와 같이 beforeSend property에서 csrf 값을 셋팅해야 함 
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/user/idcheckAjax",				
				data:"id="+id,	
				beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
				success:function(data){						
					if(data=="fail"){
					$("#idCheckView").html(id+" 사용불가!").css("background","red");
						checkResultId="";
					}else{						
						$("#idCheckView").html(id+" 사용가능!").css(
								"background","yellow");		
						checkResultId=id;
					}					
				}//callback			
			});//ajax
		});//keyup
	});//ready 
</script>
<form method="post" action="${pageContext.request.contextPath}/user/registerMember" id="regForm">
<sec:csrfInput/>
아이디 <input type="text" name="memberId" id="memberId"><span id="idCheckView"></span><br>
비밀번호 <input type="password" name="password"><br>
이메일 <input type="email" name="memberEmail"><br>
이름 <input type="text" name="name"><br>
주소 <input type="text" name="address"><br>
전화번호 <input type="text" name="phoneNo"><br>
은행이름 <input type="text" name="bankName"><br>
계좌번호 <input type="text" name="accountNo"><br>
<input type="submit" value="가입하기">
</form>
<%--	  register.jsp -- MemberController
								|
								register_result.jsp 
								가입정보 출력 
								새로고침시 재등록 되지 않는다 
				ajax(jquery)로 
				id 중복확인을 한다 				
		 --%>












