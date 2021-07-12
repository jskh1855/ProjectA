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


@RequestMapping(value = "upload", method = RequestMethod.POST)
	public String upload(HttpServletRequest request, @RequestParam("filename") MultipartFile[] mFiles) {
		StringBuilder images = new StringBuilder();
		try {
			String path2 = "..\\resources\\static\\myweb\\images\\";
			String path = request.getSession().getServletContext().getRealPath("");
			
			for (int i=0;i<mFiles.length;i++) {
				mFiles[i].transferTo(new File(path+path2+mFiles[i].getOriginalFilename()));
				images.append(mFiles[i].getOriginalFilename());
				images.append(";");
				
			}
			
			
			

			// mFile.transferTo(new File("c:/Users/short/kosta/ProjectA/NeoA/src/main/resources/static/myweb/images/"+mFile.getOriginalFilename()));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "redirect:productUpload_ok";
	}
	
	@RequestMapping("/productUpload_ok")
	public String productUpload_ok() {
	
		return "member/productUpload_ok.tiles";
	}