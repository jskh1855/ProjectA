<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
	<style>
		h3.a{
			text-align: center;
		}


	</style>
<script type="text/javascript">
// var str = $("#textarea").val();

// str = str.replace(/(?:\r\n|\r|\n)/g, '<br />');

// $("#text").html(str);



var malls = true;

function update_selected() {
  $("#mallSelect").val(0);
  $("#mallSelect").find("option[value!=0]").detach();

  $("#mallSelect").append(malls.filter(".mall" + $(this).val()));
}

$(function() {
  malls = $("#mallSelect").find("option[value!=0]");
  malls.detach();

  $("#productSelect").change(update_selected);
  $("#productSelect").trigger("change");
});
</script>


<br>
<br>

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
<%-- <sec:authorize access="hasRole('ROLE_ADMIN')">
 --%><%--    <sec:authentication var="mvo" property="principal" />
 
 
 --%>

 
 
 <div class="container">

	<form action="${pageContext.request.contextPath}/upload" method="post"
		id="form" name="form" enctype="multipart/form-data" onLoad="initForm(document.form)">
		<sec:csrfInput />

		<br>
		 		<select id="productSelect" name = "top" style="font-style: oblique;">
				   <option value="0" selected="selected">대분류 선택</option>
				   <option value="전자제품">전자제품</option>
				   <option value="패션">패션</option>
				   <option value="책">책</option>
				</select>
				<select id="mallSelect" name = "mid"style="font-style: oblique;">
				   <option value="0">중분류 선택</option>
				   <option value="스마트폰" class="mall전자제품">스마트폰</option>
				   <option value="컴퓨터" class="mall전자제품">컴퓨터</option>
				   <option value="TV" class="mall전자제품">TV</option>
				   <option value="신발" class="mall패션">신발</option>
				   <option value="상의" class="mall패션">상의</option>  
				   <option value="하의" class="mall패션">하의</option>
				   <option value="악세서리" class="mall패션">악세서리</option> 
				   <option value="소설" class="mall책">소설</option>
				   <option value="만화책" class="mall책">만화책</option>
				   <option value="전문서적" class="mall책">전문서적</option>
				   <option value="잡지" class="mall책">잡지</option>
				</select>

		<br>

		<hr>
		<h2 style="color: #a0a0a0">물품정보</h2>
		<hr>
		<br>
		<table>

			<tr>
				<div>
				<th><label for ="title" style="margin-right: 30px; font-size: large; font-style: italic;">물품 제목</label></th>
				<td><input type="text" style="margin-right: 30px; font-size: large; font-style: italic;"id="title" name="title" ></td>
				
				
				<th><label for ="productName" style="margin-right: 30px; font-size: large; font-style: italic;">물품명</label></th>
				<td><input type="text" style="margin-right: 30px; font-size: large; font-style: italic;" id="productName" name="productName"></td>
				</div>
			</tr>
			<tr>
				<div>
				<th><label for ="detail"style="margin-right: 30px; font-size: large; font-style: italic;">물품 설명</label></th>
				<td><textarea name="detail" style="margin-right: 30px; font-size: large; font-style: italic;"id="detail" cols="45" rows="10">상품정보 입력</textarea></td>
				</div>
			</tr>
			<tr>
				<th style="margin-right: 30px; font-size: large; font-style: italic;">이미지 등록</th>
				<td>
					<div class="inputArea">
						<label for="postImage" style="font-style: italic;font-size: large;">이 사진이 썸네일로 지정됩니다!</label><br> 
						<input type="file" id="postImage"
							name="filename" multiple="multiple" />
						<div class="select_img">
							<img src="" />
						</div>
					</div> <script>
						$("#postImage").change(
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
		<h2 style="color: #a0a0a0">경매정보</h2>
		<hr>
		<br>
		<table>
			<tr>
				<div >
				<th><label for ="startPrice" style="margin-right: 30px; font-size: large; font-style: italic;">시작가</label></th>
				<td ><input type="text" style="margin-right: 30px;font-size: large; font-style: italic;" id="startPrice" name="startPrice"></td>
				
				<th><label for ="giveMeThatPrice"  style="margin-right: 30px;font-size: large; font-style: italic;">즉시구매가격</label></th>
				<td><input type="number"style="margin-right: 30px; font-size: large; font-style: italic;" id="giveMeThatPrice" name="giveMeThatPrice"></td>
				</div>
			</tr>
			<tr>
				<div >
				<th><label for ="unitPrice" style="margin-top: 50px; font-size: large; font-style: italic;">입찰단위</label></th>
				<td><select name="unitPrice" style="margin-top: 50px; font-family: fantasy;" id ="unitPrice" size="6" multiple>
						<option value="100" />100원
						<option value="500" />500원
						<option value="1000" />1000원
						<option value="5000" />5000원
						<option value="10000" />10000원
						<option value="500000" /> 500000원
				</select></td>
				</div>
				<div>
				<th><label for ="bidTimeUnit" style="margin-top: 50px;font-size: large; font-style: italic;">경매기간</th>
				<td><select name="bidTimeUnit" style="margin-top: 50px; font-style: oblique;" id = "bidTimeUnit" size="6" multiple>
						<option value="1" />1일
						<option value="2" />2일
						<option value="3" />3일
						<option value="4" />4일
						<option value="5" />5일
						<option value="7" />7일
				</select></td>
				</div>
				
			</tr>
			
		</table>
	
			<div align="center" style="margin-top: 50px;">
							<button  type="submit"class="button button-contactForm btn_1 boxed-btn" style="font-size: large;" >상품등록</button>
			</div>
	</form>
</div>

<%--  <%=request.getRealPath("") %> --%>
 
<%--  <%= request.getSession().getServletContext().getContext("/productUpload").getRealPath("")%> --%>
 
 
