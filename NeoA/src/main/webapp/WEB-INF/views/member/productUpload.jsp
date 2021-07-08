<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<div class="slider-area ">
	<div class="single-slider slider-height2 d-flex align-items-center">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="hero-cap text-center">
						<h1 style="font-size: 100px;">Item Upload</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="container">

	<form action="${pageContext.request.contextPath}/upload" method="post"
		id="form" name="form" enctype="multipart/form-data">
		<sec:csrfInput />
		<br>
		<hr>
		<h3>물품정보</h3>
		<hr>
		<table>
			<tr>
				<th>물품 제목</th>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<th>물품명</th>
				<td><input type="text" name="productName"></td>
			</tr>
			<tr>
				<th>물품 설명</th>
				<td><textarea name="detail" cols="45" rows="10">상품정보 입력</textarea></td>
			</tr>
			<tr>
				<th>이미지 등록</th>
				<td>
					<div class="inputArea">
						<label for="filename">이 사진이 썸네일로 지정됩니다!</label><br> 
						<input type="file" id="filename"
							name="filename" multiple="multiple" />
						<div class="select_img">
							<img src="" />
						</div>
					</div> <script>
						$("#filename").change(
								function() {
									if (this.files && this.files[0]) {
										var reader = new FileReader;
										reader.onload = function(data) {
											$(".select_img img").attr("src",
													data.target.result).width(
													500);
										}
										reader.readAsDataURL(this.files[0]);
									}
								});
					</script>
				</td>
				<!-- 		<td><input id="filename" name="filename" type="file" multiple="multiple"/></td>-->
			</tr>
		</table>

		<br> <br>
		<hr>
		<h3>경매정보</h3>
		<hr>
		<table>
			<tr>
				<th>시작가</th>
				<td><input type="text" name="startPrice"></td>
			</tr>
			<tr>
				<th>입찰단위</th>
				<td><select name="unitPrice" size="6" multiple>
						<option value="100" />100원
						<option value="500" />500원
						<option value="1000" />1000원
						<option value="5000" />5000원
						<option value="10000" />10000원
						<option value="500000" /> 500000원
				</select></td>
			</tr>
			<tr>
				<th>경매기간</th>
				<td><select name="bidTimeUnit" size="6" multiple>
						<option value="1" />1일
						<option value="2" />2일
						<option value="3" />3일
						<option value="4" />4일
						<option value="5" />5일
						<option value="7" />7일
				</select></td>
				<th>즉시구매가격</th>
				<td><input type="number"></td>
			</tr>

		</table>
		<input type="submit" value="등록" />
	</form>
</div>
