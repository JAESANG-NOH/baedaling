package com.bd.freeboard;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bd.common.FileManager;
import com.bd.common.MyUtil;
import com.bd.user.SessionInfo;

@Controller("free.freeBoardController")
@RequestMapping("/freeboard/*")
public class FreeBoardController {
	@Autowired
	private FreeBoardService service;
	@Autowired
	private MyUtil myUtil;
	@Autowired
	private FileManager fileManager;
	
	
	@RequestMapping(value= "list")
	public String list() {
		return ".freeboard.list";
	}
	
	
	@RequestMapping(value="write", method=RequestMethod.GET)
	public String writeForm(
			Model model
			) throws Exception {

		model.addAttribute("mode", "write");
		return ".freeboard.write";
	}

	@RequestMapping(value="write", method=RequestMethod.POST)
	public String writeSubmit(
			FreeBoard dto,
			HttpSession session) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "freeBoard";		
			
			dto.setUserId(info.getUserId());
			service.insertBoard(dto, pathname);
		} catch (Exception e) {
		}
		
		return "redirect:/freeboard/list";
	}

}

