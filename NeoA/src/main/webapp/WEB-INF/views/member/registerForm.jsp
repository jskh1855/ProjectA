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

<section class="login_part section_padding ">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-6 col-md-6">
                        <div class="login_part_text text-center">
                            <div class="login_part_text_iner">
                            	<h2>환영합니다!</h2>
                                <h2>회원 가입을 부탁드릴게요~</h2>
                                <p>이 사이트는 중고 경매 사이트 입니다.<br><br>
                                경매에 낙찰될 시, 택배거래를 위해 <br><br> 판매자님에게는 <br>구매자님의 전화번호와 집 주소가 공개되고<br><br>
                                구매자님에게는 <br>판매자님의 성명과 은행명, 계좌번호가 공개됩니다.<br></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="login_part_form">
                            <div class="login_part_form_iner">
 								<form class="row contact_form" method="post" action="${pageContext.request.contextPath}/user/registerMember" id="regForm">
								<sec:csrfInput/>                                   
                                    <div class="col-md-12 form-group p_star">
                                        <input type="text" class="form-control" id="memberId" name="memberId" value="" placeholder="아이디" autocomplete='off'><span id="idCheckView"></span>
                                    </div>
                                    <div class="col-md-12 form-group p_star">
                                        <input type="password" class="form-control" id="password" name="password" value="" placeholder="비밀번호" autocomplete='off'>
                                    </div>
                                    <div class="col-md-12 form-group p_star">
                                        <input type="email" class="form-control" id="memberEmail" name="memberEmail" value="" placeholder="이메일" autocomplete='off'>
                                    </div>
                                    <div class="col-md-12 form-group p_star">
                                        <input type="text" class="form-control" id="name" name="name" value="" placeholder="이름" autocomplete='off'>
                                    </div>
                                    <div class="col-md-12 form-group p_star">
                                        <input type="text" class="form-control" id="address" name="address" value="" placeholder="주소" autocomplete='off'>
                                    </div>
                                    <div class="col-md-12 form-group p_star">
                                        <input type="text" class="form-control" id="phoneNo" name="phoneNo" value="" placeholder="전화번호" autocomplete='off'>
                                    </div>
                                    <div class="col-md-12 form-group p_star">
                                        <input type="text" class="form-control" id="bankName" name="bankName" value="" placeholder="은행명" autocomplete='off'>
                                    </div>
                                    <div class="col-md-12 form-group p_star">
                                        <input type="text" class="form-control" id="accountNo" name="accountNo" value="" placeholder="계좌번호" autocomplete='off'>
                                    </div>

                                    <div class="col-md-12 form-group">
                                        <button type="submit" value="submit" class="btn_3">
                                            회원 가입
                                        </button>
                                        <a class="lost_pass" href="#">forget password?</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>





<%--	  register.jsp -- MemberController
								|
								register_result.jsp 
								가입정보 출력 
								새로고침시 재등록 되지 않는다 
				ajax(jquery)로 
				id 중복확인을 한다 				
		 --%>












