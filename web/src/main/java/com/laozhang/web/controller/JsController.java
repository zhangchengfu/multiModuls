package com.laozhang.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/js")
public class JsController {

	@RequestMapping("/js2")
	public String js2() {
		return "js-study2";
	}
	
	@RequestMapping("/js3")
	public String js3() {
		return "js-study3";
	}
	
	@RequestMapping("/js4")
	public String js4() {
		return "js-studyFour";
	}
}
