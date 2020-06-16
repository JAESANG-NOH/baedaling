package com.bd.recommend;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("recommend.recommendBoardController")
@RequestMapping("/recommend/*")
public class RecommendController {
	@RequestMapping("/list")
	public String list() {
		return ".recommendboard.list";
	}
}
