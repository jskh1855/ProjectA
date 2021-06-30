package org.kosta.myproject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SuppressWarnings({ "unchecked", "rawtypes" })
@RestController
public class TestController {
	@GetMapping("/test")
	public ResponseEntity getAllProductList() {
		//System.out.println("Request Method : GET");
		String str = "project A";
		return new ResponseEntity(str, HttpStatus.OK);
	}
}
