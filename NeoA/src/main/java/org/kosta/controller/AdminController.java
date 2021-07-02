package org.kosta.controller;

import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin")
public class AdminController {

	@Secured("ROLE_ADMIN")
	@RequestMapping("main")
	public String adminMain() {
		return "admin/main.tiles";
	}
}
