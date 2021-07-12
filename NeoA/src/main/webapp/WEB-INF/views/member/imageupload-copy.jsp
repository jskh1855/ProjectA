<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body><th>이미지 등록</th>
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

</body>
</html>