package com.bd.inquire;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("inquire.inquireBoardController")
@RequestMapping("/inquire/*")
public class InquireBoardController {
	@RequestMapping("/list")
	public String list() {
		return ".inquire.list";
	}
	
	@RequestMapping("/write")
	public String write() {
		return ".inquire.write";
	}
	
	@RequestMapping("/answer")
	public String answer() {
		return ".inquire.answer";
	}
}
