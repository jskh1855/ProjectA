<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <main>
        <!-- Hero Area Start-->
        <div class="slider-area ">
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
        </div>
        <!-- Hero Area End-->
        <!-- Latest Products Start -->
        <section class="popular-items latest-padding">
            <div class="container">
                <div class="row product-btn justify-content-between mb-40">
                    <div class="properties__button">
                        <!--Nav Button  -->
                        <nav>                                                      
                            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                <a class="nav-item nav-link" id="nav-home-tab" href="${pageContext.request.contextPath}/mypage" role="tab" aria-controls="nav-home" aria-selected="false"> 판매 목록</a>
                                <a class="nav-item nav-link" id="nav-profile-tab" href="${pageContext.request.contextPath}/myBidList" role="tab" aria-controls="nav-profile" aria-selected="false"> 입찰 목록</a>
                                <a class="nav-item nav-link" id="nav-contact-tab" href="${pageContext.request.contextPath}/mypagePickList" role="tab" aria-controls="nav-contact" aria-selected="false"> pick 목록 </a>
                                <a class="nav-item nav-link active" id="nav-contact-tab" href="${pageContext.request.contextPath}/mypageMyInfo" role="tab" aria-controls="nav-userInfo" aria-selected="true"> 나의 정보 </a>
                            </div>
                        </nav>
                        <!--End Nav Button  -->
                    </div>
                    <!-- Grid and List view -->
                    <div class="grid-list-view">
                    </div>
                    <!-- Select items -->
                </div>
                <!-- Nav Card -->
                <div class="tab-content" id="nav-tabContent">
					<table>
						<tr>
						<td>이름</td><td>ㅇㅇㅇㅇ</td>
						</tr>
						<tr>
						<td>주소</td><td>ㅇㅇㅇㅇ</td>
						</tr>
					</table>                   

                </div>
                <!-- End Nav Card -->
            </div>
        </section>
        <!-- Latest Products End -->
    </main>