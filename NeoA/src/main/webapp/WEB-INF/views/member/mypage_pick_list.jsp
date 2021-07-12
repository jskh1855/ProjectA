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
                                <a class="nav-item nav-link active" id="nav-contact-tab" href="${pageContext.request.contextPath}/mypagePickList" role="tab" aria-controls="nav-contact" aria-selected="true"> pick 목록 </a>
                                <a class="nav-item nav-link" id="nav-contact-tab" href="${pageContext.request.contextPath}/mypageMyInfo" role="tab" aria-controls="nav-userInfo" aria-selected="false"> 나의 정보 </a>
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
                    
                    <!-- Card three -->
                    <div class="tab-pane fade show active" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
                        <div class="row">
                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                <div class="single-popular-items mb-50 text-center">
                                    <div class="popular-img">
                                        <img src="/myweb/assets/img/gallery/popular3.png" alt="">
                                        <div class="img-cap">
                                            <span>Add to cart</span>
                                        </div>
                                    </div>
                                    <div class="popular-caption">
                                        <h3><a href="product_details.html">Thermo Ball Etip Gloves</a></h3>
                                        <span>시작가</span>
                                        <span>현재가</span>
                                        <span>남은 시간</span>
                                        <span>입찰자수</span>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                    
                </div>
                <!-- End Nav Card -->
            </div>
        </section>
        <!-- Latest Products End -->
    </main>