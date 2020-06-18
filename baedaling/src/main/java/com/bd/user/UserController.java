package com.bd.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("user.userController")
@RequestMapping("/user/*")
public class UserController {
	@Autowired
	private UserService service;
	
	/*@RequestMapping(value="user", method=RequestMethod.GET)
	public String userForm(Model model) {
		model.addAttribute("mode","user");
		return ".user.user";
	}*/
	
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String loginForm() {
		return ".user.login";
	}
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String loginSubmit(
			@RequestParam String userId,
			@RequestParam String userPwd,
			HttpSession session,
			Model model
			) {
		User dto = service.loginUser(userId);
		if(dto==null||!userPwd.equals(dto.getUserPwd())) {
			model.addAttribute("message","아이디 또는 패스워드가 일치하지 않습니다.");
			return ".user.login";
		}
		SessionInfo info=new SessionInfo();
		info.setUserId(dto.getUserId());
		info.setUserName(dto.getUserName());
		info.setSeparate(dto.getSeparate());
		info.setUserIdx(dto.getUserIdx());
		
		session.setMaxInactiveInterval(30*60);
		session.setAttribute("user", info);
		
		String uri=(String)session.getAttribute("preLoginURI");
		session.removeAttribute("preLoginURI");
		if(uri==null)
			uri="redirect:/";
		else
			uri="redirect:"+uri;
		
		return uri;
	}
	
	@RequestMapping(value="logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		session.invalidate();
		
		return "redirect:/";
	}
}
