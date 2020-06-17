package com.bd.inquire;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bd.common.MyUtil;
import com.bd.user.SessionInfo;

@Controller("inquire.inquireBoardController")
@RequestMapping("/inquire/*")
public class InquireBoardController {
	@Autowired
	private InquireService service;
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="list")
	public String list() {
		return ".inquire.list";
	}
	
	@RequestMapping(value="created", method=RequestMethod.GET)
	public String createdForm(
			Model model
			) throws Exception {
		
		model.addAttribute("mode", "created");
		return ".inquire.created";
	}
	
	@RequestMapping(value="created", method=RequestMethod.POST)
	public String createdSubmit(
			Inquire dto,
			HttpSession session
			) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		
		try {
			dto.setUserId(info.getUserId());
		} catch (Exception e) {
		}
		
		return "redirect:/inquire/list";
	}
	
}
