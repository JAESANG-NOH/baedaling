package com.bd.mypage;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		
		Mypage dto = null;
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
	//	SessionInfo info = (SessionInfo)session.getAttribute("user");
		
		return ".mypage.order.list";
	}
	

	@RequestMapping(value="complete/message", method=RequestMethod.GET)
	public String passwordForm(Model model) throws Exception{
		
			String msg = "개인정보 보호를 위해 비밀번호를 다시 한번 입력해주세요.";
	
			model.addAttribute("title", "비밀번호 변경");
			model.addAttribute("message", msg);
			
			return ".mypage.complete.message";
	}
	
	@RequestMapping(value="complete/message", method=RequestMethod.POST)
	public String passwordCheck(
			Mypage dto,
			Model model,
			HttpSession session
			) throws Exception {
			
			SessionInfo info = (SessionInfo)session.getAttribute("user");
		
			boolean result = service.checkPwd(info.getUserIdx(), dto.getUserPwd());
			
			if(result) {
				return "redirect:/mypage/infochange";
			} else {
			}			
			
		return "redirect:/mypage/infochange";
	}
	
	
	@RequestMapping(value="infochange", method=RequestMethod.GET)
	public String infoChangeFrom(Model model, HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("user");
		int userIdx = info.getUserIdx();
		
		Mypage dto = service.readMypage(userIdx);
		
		if(dto==null) {
			return "";
		}
		
		model.addAttribute("dto", dto);
		
		return ".mypage.infochange";
		
	}
	
	@RequestMapping(value="infochange", method=RequestMethod.POST)
	public String infoChangeSubmit(
			Mypage dto,
			Model model,
			final RedirectAttributes redAttr,
			HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("user");
		int idx = info.getUserIdx();
		dto.setUserIdx(idx);
		
		try {
			service.updateUser(dto);
		} catch (Exception e) {
		}
		
		StringBuilder sb = new StringBuilder();
		sb.append(dto.getUserName()+"님의 회원 정보 수정이 정상적으로 처리되었습니다.");

		redAttr.addFlashAttribute("title", "회원정보 수정");
		redAttr.addFlashAttribute("message", sb.toString());
		
		return "redirect:/mypage/complete/message2";
	}
}