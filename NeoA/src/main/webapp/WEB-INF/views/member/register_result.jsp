<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
h2.a {
	font-weight: bold;
}

table.type03 {
	border-collapse: separate;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	border-left: 3px solid #369;
	margin-left: auto;
	margin-right: auto;
}

table.type03 th {
	width: 147px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #153d73;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	color: orange;
}

table.type03 td {
	width: 349px;
	padding: 10px;
	vertical-align: top;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	text-align: center;
}
</style>

<div class="slider-area ">
	<div class="single-slider slider-height2 d-flex align-items-center">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="hero-cap text-center">
						<h2>${name}님 안녕하세요</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<br>
<br>
<br>
<h2 align="center" class="a">가입정보</h2>
<br>
<br>
<table class="type03">
	<tr>
		<th scope="col">ID</th>
		<td scope="col">${id}</td>
	</tr>
	<tr>
		<th scope="col">Name</th>
		<td scope="col">${name}</td>
	</tr>
	<tr>
		<th scope="col">Address</th>
		<td scope="col">${address}</td>
	</tr>
	<tr>
		<th scope="col">Phone</th>
		<td scope="col">${phone}</td>
	</tr>
</table>
<%-- <table class="table">
	<tr>
	<td scope="col">ID</td>
	<td scope="col">${requestScope.memberVO.memberId}</td>
	</tr>
	<tr>
	<td scope="col">Name</td>
	<td scope="col">${requestScope.memberVO.name} </td>
	</tr>
	<tr>
	<td scope="col">Address</td>
	<td scope="col">${requestScope.memberVO.address}</td>
	</tr>
</table> --%>
