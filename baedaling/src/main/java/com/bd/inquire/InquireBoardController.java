package com.bd.inquire;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String list(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpServletRequest req,
			Model model
			) throws Exception {
		
		String cp = req.getContextPath();
		
		int rows=10;
		int total_page=0;
		int dataCount=0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword=URLDecoder.decode(keyword, "utf-8");
		}
		
		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		dataCount=service.dataCount(map);
		if(dataCount != 0) {
			total_page = myUtil.pageCount(rows, dataCount);
		}
		
		// 다른사람이 자료를 삭제하여 전체 페이지수가 변화된 경우
		if(total_page < current_page) {
			current_page = total_page;
		}
		
		// 리스트에 출력할 데이터를 가져오기
		int offset = (current_page-1)*rows;
		if(offset < 0) offset=0;
		map.put("offset", offset);
		map.put("rows", rows);
		
		// 글리스트
		List<Inquire> list = service.listInquire(map);

		// 리스트 번호
		int num, n=0;
		for(Inquire dto : list) {
			num = dataCount-(offset+n);
			dto.setNum(num);
			n++;
		}
		String query="";
		String listUrl=cp+"/inquire/list";
		String articleUrl = cp+"/inquire/article?page="+current_page;
		if(keyword.length() != 0) {
			query = "condition=" + condition +
					"&keyword=" + URLEncoder.encode(keyword, "utf-8");
		}
		
		if(query.length() != 0) {
			listUrl = cp+"/inquire/list?" + query;
			articleUrl = cp+"/inquire/article?page=" + current_page +"&"+query;
			
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
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
			service.insertInquire(dto);
		} catch (Exception e) {
		}
		
		return "redirect:/inquire/list";
	}
	
	@RequestMapping("article")
	public String article(
			@RequestParam int num,
			@RequestParam String page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			Model model
			) throws Exception {
		keyword = URLDecoder.decode(keyword, "utf-8");
		
		String query="page="+page;
		
		if(keyword.length() != 0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
			
		}
		return ".inquire.article";
		
		
	}

	
}
