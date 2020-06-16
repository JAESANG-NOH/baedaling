package com.bd.freeboard;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("free.freeBoardController")
@RequestMapping("/freeboard/*")
public class FreeBoardController {
	@RequestMapping("/list")
	public String list() {
		return ".freeboard.list";
	}
}

