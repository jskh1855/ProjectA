<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<main>
	<!-- Hero Area Start-->
	<!--         <div class="slider-area ">
            <div class="single-slider slider-height2 d-flex align-items-center">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-cap text-center">
                                <h2>마이 페이지</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> -->
	<!-- Hero Area End-->
	<!-- Latest Products Start -->
	<section class="popular-items latest-padding">
		<div class="container">
			<div class="row product-btn justify-content-between mb-40">
				<div class="properties__button">
					<!--Nav Button  -->
					<nav>
						<div class="nav nav-tabs" id="nav-tab" role="tablist">
							<a class="nav-item nav-link" id="nav-home-tab"
								href="${pageContext.request.contextPath}/mypage" role="tab"
								aria-controls="nav-home" aria-selected="false"> 판매 목록</a> <a
								class="nav-item nav-link" id="nav-profile-tab"
								href="${pageContext.request.contextPath}/myBidList" role="tab"
								aria-controls="nav-profile" aria-selected="false"> 입찰 목록</a> <a
								class="nav-item nav-link" id="nav-contact-tab"
								href="${pageContext.request.contextPath}/mypagePickList"
								role="tab" aria-controls="nav-contact" aria-selected="false">
								pick 목록 </a> <a class="nav-item nav-link active"
								id="nav-contact-tab"
								href="${pageContext.request.contextPath}/mypageMyInfo"
								role="tab" aria-controls="nav-userInfo" aria-selected="true">
								나의 정보 </a>
						</div>
					</nav>
					<!--End Nav Button  -->
				</div>
				<!-- Grid and List view -->
				<div class="grid-list-view"></div>
				<!-- Select items -->
			</div>
			<!-- End Nav Card -->
		</div>
	</section>

	<c:if test="${!empty message}">
		<h2 style="text-align: center">
			<c:out value="${message}" />
		</h2>
	</c:if>
	<!-- 회원탈퇴 -->
	<div class="col-lg-6 col-md-6" align="right">
		<form action="${pageContext.request.contextPath}/deleteMember"
			method="post">
			<sec:csrfInput />
			<button>회원탈퇴</button>
		</form>
	</div>

	<section class="login_part">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6 col-md-6">
					<div class="login_part_text text-center">
						<div class="login_part_text_iner">
							<h2>회원 정보 수정</h2>
							<p>
								이 사이트는 중고 경매 사이트 입니다.<br>
								<br> 경매에 낙찰될 시, 택배거래를 위해 <br>
								<br> 판매자님에게는 <br>구매자님의 전화번호와 집 주소가 공개되고<br>
								<br> 구매자님에게는 <br>판매자님의 성명과 은행명, 계좌번호가 공개됩니다.<br>
							</p>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="login_part_form">
						<div class="login_part_form_iner">
							<form class="row contact_form" method="post"
								action="${pageContext.request.contextPath}/updateMemberInfo">
								<sec:csrfInput />
								<div class="col-md-12 form-group p_star">
									<input type="text" class="form-control" id="memberId"
										name="memberId" value="${memberVO.memberId }"
										placeholder="아이디" autocomplete='off' readonly>
								</div>
								<div class="col-md-12 form-group p_star">
									<input type="text" class="form-control" id="password"
										name="password" value="" placeholder="비밀번호(공란일 경우 변경되지 않아요)"
										autocomplete='off'>
								</div>
								<div class="col-md-12 form-group p_star">
									<input type="email" class="form-control" id="memberEmail"
										name="memberEmail" value="${memberVO.memberEmail }"
										placeholder="이메일" autocomplete='off'>
								</div>
								<div class="col-md-12 form-group p_star">
									<input type="text" class="form-control" id="name" name="name"
										value="${memberVO.name }" placeholder="이름" autocomplete='off'>
								</div>
								<div class="col-md-12 form-group p_star">
									<input type="text" class="form-control" id="address"
										name="address" value="${memberVO.address }" placeholder="주소"
										autocomplete='off'>
								</div>
								<div class="col-md-12 form-group p_star">
									<input type="text" class="form-control" id="phoneNo"
										name="phoneNo" value="${memberVO.phoneNo }" placeholder="전화번호"
										autocomplete='off'>
								</div>
								<div class="col-md-12 form-group p_star">
									<input type="text" class="form-control" id="bankName"
										name="bankName" value="${memberVO.bankName }"
										placeholder="은행명" autocomplete='off'>
								</div>
								<div class="col-md-12 form-group p_star">
									<input type="text" class="form-control" id="accountNo"
										name="accountNo" value="${memberVO.accountNo }"
										placeholder="계좌번호" autocomplete='off'>
								</div>
								<div class="col-md-12 form-group">
									<button type="submit" value="submit" class="btn_3">회원
										정보 변경</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Latest Products End -->
</main>