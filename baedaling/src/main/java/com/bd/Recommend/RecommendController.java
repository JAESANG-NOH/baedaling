package com.bd.Recommend;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("recommend.recommendController")
@RequestMapping("/recommend/*")
public class RecommendController {
	@RequestMapping("/list")
	public String list() {
		return ".recommendboard.list";
	}
}
