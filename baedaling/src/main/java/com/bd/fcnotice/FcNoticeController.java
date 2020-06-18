package com.bd.fcnotice;

import java.io.File;
import java.net.URLDecoder;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.bd.common.FileManager;
import com.bd.common.MyUtil;
import com.bd.user.SessionInfo;


@Controller("fcnotice.fcNoticeController")
@RequestMapping("/fcnotice/*")
public class FcNoticeController {
	
	@Autowired
	private FcNoticeService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping(value="list")
	public String list(
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpServletRequest req,
			Model model
			) throws Exception {
		int rows = 5; // 한 화면에 보여주는 게시물 수
		int total_page = 0;
		int dataCount = 0;
   	    
		if(req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
        // 전체 페이지 수
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("condition", condition);
        map.put("keyword", keyword);

        dataCount = service.dataCount(map);
        if(dataCount != 0)
            total_page = myUtil.pageCount(rows,  dataCount) ;

        // 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
        if(total_page < current_page) 
            current_page = total_page;
		
        List<FcNotice> importantList = service.listImpotantNotice();
        
        
        int offset = (current_page-1) * rows;
		if(offset < 0) offset = 0;
        map.put("offset", offset);
        map.put("rows", rows);
        
        List<FcNotice> list = service.listNotice(map);
        int listNum, n = 0;
        for(FcNotice dto : list) {
            listNum = dataCount - (offset + n);
            dto.setListNum(listNum);
            n++;
        }
        
        String paging = myUtil.pagingMethod(current_page, total_page, "listPage");
        model.addAttribute("importantList",importantList);
        model.addAttribute("list",list);
        model.addAttribute("pageNo",current_page);
        model.addAttribute("dataCount",dataCount);
        model.addAttribute("total_page",total_page);
        model.addAttribute("paging",paging);
        
        model.addAttribute("condition",condition);
        model.addAttribute("keyword",keyword);
        
		return ".fcnotice.list";
	}
	
	@RequestMapping(value="created",method=RequestMethod.GET)
	public String createdForm(
			Model model
			)throws Exception{
		model.addAttribute("pageNo","1");
		model.addAttribute("mode","created");
		
		return ".fcnotice.write";
	}
	
	@RequestMapping(value="created", method=RequestMethod.POST)
	public String createdSubmit(
			FcNotice dto,
			HttpSession session
			) throws Exception{
		SessionInfo info= (SessionInfo)session.getAttribute("user");
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads"+File.separator + "fcnotice";
			
			dto.setUserId(info.getUserId());
			dto.setUserName(info.getUserName());
			dto.setUserIdx(info.getUserIdx());
			service.insertNotice(dto, pathname);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return "redirect:/fcnotice/list";
		
	}
	
	
}
