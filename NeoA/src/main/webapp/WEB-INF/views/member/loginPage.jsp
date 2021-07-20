<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
        <!-- Hero Area Start-->
<!--         <div class="slider-area ">
            <div class="single-slider slider-height2 d-flex align-items-center">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-cap text-center">
                                <h2>Login</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> -->
        <!-- Hero Area End-->
        <!--================login_part Area =================-->
        <section class="login_part section_padding ">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-6 col-md-6">
                        <div class="login_part_text text-center">
                            <div class="login_part_text_iner">
                                <h2>New to our a_uction?</h2>
                                <br>
                                <p>저희 옥션에 처음이시라면 아래에서 회원가입을 해주세요</p>
                                <p> 경매 물품은 항상 신중하게 골라주세요 </p>
                                <a href="${pageContext.request.contextPath}/user/registerForm" class="btn_3">Create an Account</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="login_part_form">
                            <div class="login_part_form_iner">
                                <h3 align="center">Project_a <br>
                                	
                                    </h3>
                                <form class="row contact_form" action="${pageContext.request.contextPath}/login" method="post" novalidate="novalidate" id="loginForm">
                                	<sec:csrfInput/>
<!--                                     <div class="col-md-12 form-group p_star" id= "loginForm"> -->
                                        <input type="text" class="form-control" id="name" name="id" value=""
                                            placeholder="Username">
<!--                                     </div> -->
<!--                                     <div class="col-md-12 form-group p_star"> -->
                                        <input type="password" class="form-control" id="password" name="password" value=""
                                            placeholder="Password">
<!--                                     </div> -->
<!--                                     <div class="col-md-12 form-group"> -->
<!--                                         <div class="creat_account d-flex align-items-center"> -->
<!--                                             <input type="checkbox" id="f-option" name="selector"> -->
<!--                                             <label for="f-option">Remember me</label> -->
<!--                                         </div> -->
                                 		<div class="col-md-12 form-group">
                                     	   <button type="submit" value="submit" class="btn_3">
                                           Log in
                                     	   </button>
                                  		</div>
<!--                                         <button type="submit" value="submit" class="btn_3"> -->
<!--                                             log in -->
<!--                                         </button> -->
                                        
<!--                                         <a class="lost_pass" href="#">forget password?</a> -->
<!--                                     </div> -->
                                </form>

                            </div>
                         	<script type="text/javascript">
								$(document).ready(function() {
									$("#logoutAction").click(function() {
										$("#logoutForm").submit();
									});
								});
							</script>

                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--================login_part end =================-->