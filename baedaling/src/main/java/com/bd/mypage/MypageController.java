package com.bd.mypage;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bd.user.SessionInfo;

@Controller("mypage.mypageController")
@RequestMapping("/mypage/*")
public class MypageController {
	@Autowired
	private MypageService service;
	
	@RequestMapping(value="userInfo")
	public String readMypage(
				Model model,
				HttpSession session
				) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("user");
		int userIdx = info.getUserIdx();
		
		Mypage dto = new Mypage();
		try {
			dto = service.readMypage(userIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		model.addAttribute("dto", dto);
		
		return ".mypage.userInfo";
	}
	
	@RequestMapping(value="order/list")
	public String orderList(HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("user");
	
		
		return ".mypage.order.list";
	}
}
