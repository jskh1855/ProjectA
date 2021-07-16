<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<script type="text/javascript">
	$(document).ready(function() {
		$.ajaxPrefilter(function(options) {
			let headerName = '${_csrf.headerName}';
			let token = '${_csrf.token}';
			if (options.type.toLowerCase() === 'post') {
			options.headers = {};
			options.headers[headerName] = token;
			}
		});
	
		//페이지 로딩시 qna 보여주기
 		$.ajax({
			type:"GET",
			data:"productNo="+$("#productNo").val(),
			dataType:"json",
			url:"/user/getQnAList",
			success:function(qna){
				//alert(qna[0].memberId);
				for(let i=0;i<qna.length;i++){
					let qnaId = "qna_"+qna[i].qnaNo+"_"+qna[i].qnaType;
					qnaDetails=null;
					if(qna[i].qnaType==0){
						qnaDetails = $(
							'<div class="comment-list" id="'+qnaId+'">'
							+'<div class="single-comment justify-content-between d-flex">'
								+'<div class="user justify-content-between d-flex">'
									+'<div class="desc"><p class="comment">'+qna[i].qnaContent+'</p>'
										+'<div class="d-flex justify-content-between">'
											+'<div class="d-flex align-items-center">'
												+'<h5><a href="#">'+qna[i].memberId+'</a></h5>'
												+'<p class="date">'+qna[i].qnaTime+'</p></div>'
											+'<div class="reply-btn">'
											+'<a href="javascript:void(0);" onclick="replyForm(\''+qna[i].qnaNo+'\', \''+qna[i].qnaType+'\')" class="btn-reply text-uppercase">reply</a>'
											+'</div>	</div>	</div>	</div>	</div>	</div>'
					);
					}else{
						qnaDetails = $(
							'<div style="background-color: #F0F8FF" class="comment-list" id="'+qnaId+'">'
								+'<div class="single-comment justify-content-between d-flex">'
									+'<div class="user justify-content-between d-flex">'
										+'<div class="desc"><p class="comment">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp'+qna[i].qnaContent+'</p>'
											+'<div class="d-flex justify-content-between">'
													+'<div class="d-flex align-items-center">'
													+'<h5><a href="#">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp'+qna[i].memberId+'</a></h5>'
													+'<p class="date">'+qna[i].qnaTime+'</p></div>'
												+'<div class="reply-btn">'
												+'<a href="javascript:void(0);" onclick="replyForm(\''+qna[i].qnaNo+'\', \''+qna[i].qnaType+'\')" class="btn-reply text-uppercase">reply</a>'
												+'</div>	</div>	</div>	</div>	</div>	</div>'
						);
					}
					$(".comments-area").append(qnaDetails);
					$("#QnAListSize").html("QnA ["+qna.length+"]");
				}//for
			}//callback
		});//ajax 
		
		//질문 등록 및 qna 새로 띄워주기
		$("#registerQuestion").click(function() {
			//let qnaContent = document.getElementById("qnaContent").value;
			//alert(qnaContent);
			//alert(productNo);
			//alert("${pageContext.request.contextPath}/registerQuestion");
			$(".comments-area").children().remove();
			$.ajax({
				type:"POST",
				url:"/registerQuestion",
				data:"qnaContent="+$("#qnaContent").val()+"&"+"productNo="+$("#productNo").val(),
				dataType:"json",
				success:function(qna){
					for(let i=0;i<qna.length;i++){
						let qnaId = "qna_"+qna[i].qnaNo+"_"+qna[i].qnaType;
						qnaDetails=null;
						if(qna[i].qnaType==0){
							qnaDetails = $(
								'<div class="comment-list" id="'+qnaId+'">'
								+'<div class="single-comment justify-content-between d-flex">'
									+'<div class="user justify-content-between d-flex">'
										+'<div class="desc"><p class="comment">'+qna[i].qnaContent+'</p>'
											+'<div class="d-flex justify-content-between">'
												+'<div class="d-flex align-items-center">'
													+'<h5><a href="#">'+qna[i].memberId+'</a></h5>'
													+'<p class="date">'+qna[i].qnaTime+'</p></div>'
												+'<div class="reply-btn">'
												+'<a href="javascript:void(0);" onclick="replyForm(\''+qna[i].qnaNo+'\', \''+qna[i].qnaType+'\')" class="btn-reply text-uppercase">reply</a>'
												+'</div>	</div>	</div>	</div>	</div>	</div>'
						);
						}else{
							qnaDetails = $(
								'<div style="background-color: #F0F8FF" class="comment-list" id="'+qnaId+'">'
									+'<div class="single-comment justify-content-between d-flex">'
										+'<div class="user justify-content-between d-flex">'
											+'<div class="desc"><p class="comment">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp'+qna[i].qnaContent+'</p>'
												+'<div class="d-flex justify-content-between">'
														+'<div class="d-flex align-items-center">'
														+'<h5><a href="#">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp'+qna[i].memberId+'</a></h5>'
														+'<p class="date">'+qna[i].qnaTime+'</p></div>'
													+'<div class="reply-btn">'
													+'<a href="javascript:void(0);" onclick="replyForm(\''+qna[i].qnaNo+'\', \''+qna[i].qnaType+'\')" class="btn-reply text-uppercase">reply</a>'
													+'</div>	</div>	</div>	</div>	</div>	</div>'
							);
						}
						$(".comments-area").append(qnaDetails);
						$("#QnAListSize").html("QnA ["+qna.length+"]");
					}//for
				}//callback
			});//ajax
			document.getElementById("qnaContent").value='';
		});//click

	})//ready

<%--질문하기 폼--%>
function replyForm(qnaNo,qnaType){
	//alert(qnaNo);	
	//alert(qnaType);
	$(".reply-form").remove();
	var reply = $(
			'<div class="reply-form">'
			+'<div class="row">'
				+'<div class="col-12">'
					+'<div class="form-group">'
						+'<textarea class="form-control w-100" id="answerContent" cols="30" rows="3" placeholder="답변을 작성하세요"></textarea>'
					+'</div>'
				+'</div>'
			+'</div>'
			+'<div>'
				+'<button id="registerAnswer" onclick="registerAnswer('+qnaNo+')" class="button button-contactForm btn_1 boxed-btn">답변하기</button>'
			+'</div>'
		+'</div>'
		);
	$("#qna_"+qnaNo+"_"+qnaType).append(reply);
}
<%--답변하기--%>	
function registerAnswer(qnaNo){
	//alert(qnaNo);
	//alert(document.getElementById("answerContent").value);
	answerContent = document.getElementById("answerContent").value;
	$(".comments-area").children().remove();
	$.ajax({
		type:"POST",
		url:"/registerAnswer",
		data:"qnaContent="+answerContent+"&productNo="+$("#productNo").val()+"&qnaNo="+qnaNo,
		dataType:"json",
		success:function(qna){
			for(let i=0;i<qna.length;i++){
				let qnaId = "qna_"+qna[i].qnaNo+"_"+qna[i].qnaType;
				qnaDetails=null;
				if(qna[i].qnaType==0){
					qnaDetails = $(
						'<div class="comment-list" id="'+qnaId+'">'
						+'<div class="single-comment justify-content-between d-flex">'
							+'<div class="user justify-content-between d-flex">'
								+'<div class="desc"><p class="comment">'+qna[i].qnaContent+'</p>'
									+'<div class="d-flex justify-content-between">'
										+'<div class="d-flex align-items-center">'
											+'<h5><a href="#">'+qna[i].memberId+'</a></h5>'
											+'<p class="date">'+qna[i].qnaTime+'</p></div>'
										+'<div class="reply-btn">'
										+'<a href="javascript:void(0);" onclick="replyForm(\''+qna[i].qnaNo+'\', \''+qna[i].qnaType+'\')" class="btn-reply text-uppercase">reply</a>'
										+'</div>	</div>	</div>	</div>	</div>	</div>'
				);
				}else{
					qnaDetails = $(
						'<div style="background-color: #F0F8FF" class="comment-list" id="'+qnaId+'">'
							+'<div class="single-comment justify-content-between d-flex">'
								+'<div class="user justify-content-between d-flex">'
									+'<div class="desc"><p class="comment">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp'+qna[i].qnaContent+'</p>'
										+'<div class="d-flex justify-content-between">'
												+'<div class="d-flex align-items-center">'
												+'<h5><a href="#">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp'+qna[i].memberId+'</a></h5>'
												+'<p class="date">'+qna[i].qnaTime+'</p></div>'
											+'<div class="reply-btn">'
											+'<a href="javascript:void(0);" onclick="replyForm(\''+qna[i].qnaNo+'\', \''+qna[i].qnaType+'\')" class="btn-reply text-uppercase">reply</a>'
											+'</div>	</div>	</div>	</div>	</div>	</div>'
					);
				}
				$(".comments-area").append(qnaDetails);
				$("#QnAListSize").html("QnA ["+qna.length+"]");
			}//for
		}//callback
	});//ajax
}	
		function bid() {
	    var data=$("#input").val();
	    var messageDTO={
	        result:data
	    };
	    $.ajax({
	        url: "${pageContext.request.contextPath}/bid",
	        data: messageDTO,
	        type:"POST",
	        beforeSend : function(
					xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				xhr
						.setRequestHeader(
								"${_csrf.headerName}",
								"${_csrf.token}");
			},
			success : function(data) {
				if (data == "fail") {
					alert("아이디가 중복됩니다");
					$(
							"#idCheckView")
							.html(
									id
											+ " 사용불가!")
							.css(
									"color",
									"red");
					checkResultId = "";
				} else {
					$(
							"#idCheckView")
							.html(
									id
											+ " 사용가능!")
							.css(
									"color",
									"blue");
					checkResultId = id;
				}
			}//callback
	    });
	}
</script>
<main>
	<!-- Hero Area Start-->
	<div class="slider-area ">
		<div class="single-slider slider-height2 d-flex align-items-center">
			<div class="container">
				<div class="row">
					<div class="col-xl-12">
						<div class="hero-cap text-center">
							<h2>상품 상세페이지</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	${productDetails }

	<!--================Blog Area =================-->
	<section class="blog_area single-post-area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 posts-list">
					<div class="single-post">
						<div class="feature-img">
							<img class="img-fluid" src="assets/img/gallery/popular3.png" alt="" style="width: 300px;">
						</div>

						<div class="blog_details">
							<%--제목 --%>
							<h2>${productDetails.title }</h2>
							<%--내용 --%>
							<p class="excert">${productDetails.detail }</p>
						</div>

					</div>

					<%--Qna 시작 --%>
					<sec:authorize access="isAuthenticated()">
						<div class="comments-area">
							<h4 id="QnAListSize">QnA</h4>
						</div>
					</sec:authorize>
					<%--QnA 끝 --%>
					<%--Qna 시작 --%>
					<sec:authorize access="isAnonymous()">
						<h4 id="QnAListSize">QnA</h4>
						<h5 style="color: #a0a0a0">로그인 하시면 QnA 를 보실수 있어요</h5>
						<div class="comments-area" style="display: none"></div>
					</sec:authorize>
					<%--QnA 끝 --%>

					<%--Qna 로그인유저 질문하기 폼 시작 --%>
					<sec:authorize access="isAuthenticated()">
						<div class="comment-form">
							<h4>질문하기</h4>
							<div class="row">
								<div class="col-12">
									<div class="form-group">
										<textarea class="form-control w-100" id="qnaContent" cols="30" rows="9" placeholder="질문을 작성하세요"></textarea>
										<input type="hidden" id="productNo" value="${productDetails.productNo }">
									</div>
								</div>
							</div>
							<div>
								<button id="registerQuestion" class="button button-contactForm btn_1 boxed-btn">질문하기</button>
							</div>
						</div>
					</sec:authorize>
					<%--Qna 로그인유저 질문하기 폼 끝 --%>
					<%--Qna 비로그인유저 질문하기 폼 시작 --%>
					<sec:authorize access="isAnonymous()">
						<div class="comment-form">
							<h4>질문하기</h4>
							<div class="row">
								<div class="col-12">
									<div class="form-group">
										<textarea class="form-control w-100" disabled id="qnaContent" cols="30" rows="9" placeholder="로그인을 하시면 질문을 작성하실 수 있어요"></textarea>
										<input type="hidden" id="productNo" value="${productDetails.productNo }">
									</div>
								</div>
							</div>
							<div>
								<button id="registerQuestion" style="background-color: #808080" class="button button-contactForm btn_1 boxed-btn" disabled>질문하기</button>
							</div>
						</div>
					</sec:authorize>
					<%--Qna 비로그인유저 질문하기 폼 끝 --%>


				</div>
				<div class="col-lg-4">
					<div class="blog_right_sidebar">
						<%--입찰하기 --%>
						<div class="add_to_cart">
							<input type="text" value="${productDetails.nowPrice+productDetails.unitPrice }" size="12"> 원으로 <a href="#" class="btn_3"
								onclick="startBid()">입찰하기</a>
						</div>
						<%--제품 정보들 --%>
						<aside class="single_sidebar_widget post_category_widget">
							<%--현재가격 --%>
							<h4 class="widget_title">현재가격 ${productDetails.nowPrice }</h4>
							<%--기타 정보들 --%>
							<ul class="list cat-list">
								<li><a href="#" class="d-flex">
										<p>시작가</p>
										<p>${productDetails.startPrice }</p>
								</a></li>
								<li><a href="#" class="d-flex">
										<p>즉구가</p>
										<p>${productDetails.giveMeThatPrice }</p>
								</a></li>
								<li><a href="#" class="d-flex">
										<p>경매시작시간</p>
										<p>${productDetails.productUpTime }</p>
								</a></li>
								<li><a href="#" class="d-flex">
										<p>경매종료시간</p>
										<p>${productDetails.bidEndTime }</p>
								</a></li>
								<li><a href="#" class="d-flex">
										<p>남은 시간</p>
										<p id="remainTime"></p> <script>
												var stDate = new Date().getTime();
												var edDate = new Date("${productDetails.bidEndTime}").getTime(); // 종료날짜
												var RemainDate = edDate - stDate;
												if(RemainDate<0){
													document.getElementById(${item.productNo}).innerHTML= "만료";
												}else{
												var hours = Math.floor((RemainDate % (1000 * 60 * 60 * 24)) / (1000*60*60));
												var miniutes = Math.floor((RemainDate % (1000 * 60 * 60)) / (1000*60));
												var seconds = Math.floor((RemainDate % (1000 * 60)) / 1000);
												m = hours + ":" +  miniutes + ":" + seconds ; // 남은 시간 text형태로 변경 
												document.getElementById("remainTime").innerHTML= m;
												}
										</script> <script>
											var timer = setInterval(function(){
												var stDate = new Date().getTime();
												var edDate = new Date("${productDetails.bidEndTime}").getTime(); // 종료날짜
												var RemainDate = edDate - stDate;
												if(RemainDate<0){
													document.getElementById(${item.productNo}).innerHTML= "만료";
												}else{
												var hours = Math.floor((RemainDate % (1000 * 60 * 60 * 24)) / (1000*60*60));
												var miniutes = Math.floor((RemainDate % (1000 * 60 * 60)) / (1000*60));
												var seconds = Math.floor((RemainDate % (1000 * 60)) / 1000);
												m = hours + ":" +  miniutes + ":" + seconds ; // 남은 시간 text형태로 변경 
												document.getElementById("remainTime").innerHTML=m;
												}
											}, 1000);
										</script>
								</a></li>
								<li><a href="#" class="d-flex">
										<p>총 입찰자 수</p>
										<p>ajax 로 구현할 부분</p>
								</a></li>
							</ul>
						</aside>
						<aside class="single_sidebar_widget popular_post_widget">
							<h3 class="widget_title">최근 입찰 내역</h3>
							<div class="media post_item">
								<img src="assets/img/post/post_1.png" alt="post">
								<div class="media-body">
									<a href="single-blog.html">
										<h3>A 님 25000원</h3>
									</a>
									<p>January 12, 2019</p>
								</div>
							</div>
							<div class="media post_item">
								<img src="assets/img/post/post_2.png" alt="post">
								<div class="media-body">
									<a href="single-blog.html">
										<h3>B 님 24000원</h3>
									</a>
									<p>02 Hours ago</p>
								</div>
							</div>
							<div class="media post_item">
								<img src="assets/img/post/post_3.png" alt="post">
								<div class="media-body">
									<a href="single-blog.html">
										<h3>C 님 20000원</h3>
									</a>
									<p>03 Hours ago</p>
								</div>
							</div>
							<div class="media post_item">
								<img src="assets/img/post/post_1.png" alt="post">
								<div class="media-body">
									<a href="single-blog.html">
										<h3>A 님 10000원</h3>
									</a>
									<p>01 Hours ago</p>
								</div>
							</div>
						</aside>
						<aside class="single_sidebar_widget tag_cloud_widget">
							<h4 class="widget_title">판매자 신용도</h4>
							<ul class="list">
								<li><a href="#">project</a></li>
								<li><a href="#">love</a></li>
								<li><a href="#">technology</a></li>
								<li><a href="#">travel</a></li>
								<li><a href="#">restaurant</a></li>
								<li><a href="#">life style</a></li>
								<li><a href="#">design</a></li>
								<li><a href="#">illustration</a></li>
							</ul>
						</aside>
						<aside class="single_sidebar_widget instagram_feeds">
							<h4 class="widget_title">이런 상품도 있어요~</h4>
							<ul class="instagram_row flex-wrap">
								<li><a href="#"> <img class="img-fluid" src="assets/img/post/post_5.png" alt="">
								</a></li>
								<li><a href="#"> <img class="img-fluid" src="assets/img/post/post_6.png" alt="">
								</a></li>
								<li><a href="#"> <img class="img-fluid" src="assets/img/post/post_7.png" alt="">
								</a></li>
								<li><a href="#"> <img class="img-fluid" src="assets/img/post/post_8.png" alt="">
								</a></li>
								<li><a href="#"> <img class="img-fluid" src="assets/img/post/post_9.png" alt="">
								</a></li>
								<li><a href="#"> <img class="img-fluid" src="assets/img/post/post_10.png" alt="">
								</a></li>
							</ul>
						</aside>

					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================ Blog Area end =================-->
</main>