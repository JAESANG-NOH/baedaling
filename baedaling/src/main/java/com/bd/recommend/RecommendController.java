package com.bd.recommend;

import java.io.File;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bd.common.FileManager;
import com.bd.common.MyUtil;
import com.bd.user.SessionInfo;


@Controller("recommend.recommendBoardController")
@RequestMapping("/recommend/*")
public class RecommendController {
	@Autowired
	private RecommendService service;
	@Autowired
	private MyUtil myUtil;
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping("/list")
	public String list(
			@RequestParam(value="page",defaultValue="1") int on_page,
			@RequestParam(defaultValue="any") String category,
			@RequestParam(defaultValue="") String key,
			HttpServletRequest req,
			Model model
			) throws Exception {
		int shownum = 10;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			key = URLDecoder.decode(key,"utf-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		map.put("key", key);
		
		dataCount = service.dataCount(map);
		if(dataCount!=0) {
			total_page = myUtil.pageCount(shownum, dataCount);
		}
		
		if(total_page<on_page) {
			on_page  = total_page;
		}
		int offset = (on_page-1) * shownum;
		if(offset<0) {
			offset = 0;
		}
		map.put("offset", offset);
		map.put("shownum", shownum);
		
		List<Recommend> list = service.listRecommend(map);
		int listnum = 0;
		int n = 0; 
		for(Recommend dto : list) {
			listnum = dataCount - (offset+n);
			dto.setListNum(listnum);
			n++;
		}
		
		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp+"/recommend/list";
		String pageUrl = cp+"/recommend/page?page="+on_page;
		if(key.length()!=0) {
			query = "category="+category+"&key="+URLEncoder.encode(key,"utf-8");
		}
		
		if(query.length()!=0) {
			listUrl = cp+"/recommend/list?"+query;
			pageUrl = cp+"/recommend/page?page="+on_page+"&"+query;
		}
		
		String paging = myUtil.paging(on_page, total_page, listUrl);
		
		
		
		model.addAttribute("list", list);
		model.addAttribute("page", on_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);		
		model.addAttribute("pageUrl", pageUrl);
		model.addAttribute("category", category);
		model.addAttribute("key", key);
		return ".recommendboard.list";
	}
	
	@RequestMapping(value="write", method=RequestMethod.GET)
	public String insertForm(
			Model model
			) {
		model.addAttribute("state","write");
		return ".recommendboard.write";
	}
	
	@RequestMapping(value="write", method=RequestMethod.POST)
	public String insertSubmit(
			Recommend dto,
			HttpSession session
			) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		
		String root = session.getServletContext().getRealPath("/");
		System.out.println(root);
		String pathname = root+"resource"+File.separator+"recommendboard";
		System.out.println(pathname);
		try {
			dto.setUserId(info.getUserId());
			dto.setUserName(info.getUserName());
			dto.setUserIdx(info.getUserIdx());
			service.writeRecommend(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/recommend/list";
	}
	
	@RequestMapping(value="page")
	public String readpage(
			@RequestParam int num,
			@RequestParam String page,
			@RequestParam(defaultValue="any") String category,
			@RequestParam(defaultValue="") String key,
			Model model
			) throws Exception {
		key = URLDecoder.decode(key, "utf-8");
		String query="page="+page;
		if(key.length()!=0) {
			query+="&category="+category+"&key="+URLEncoder.encode(key, "UTF-8");
		}
		
		service.updateHitCount(num);
		
		Recommend dto = service.readPage(num);
		if(dto==null) {
			return "redirect:/recommend/list?"+query;
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		map.put("key", key);
		map.put("num", num);
		
		Recommend preReadDto = service.preReadRecommend(map);
		Recommend nextReadDto = service.nextReadRecommend(map);
        
		List<Recommend> listFile=service.listFile(num);
		
		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		model.addAttribute("listFile", listFile);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		return ".recommendboard.page";
	}
	
	@RequestMapping(value="download")
	public void download(
			@RequestParam int fileNum,
			HttpServletResponse resp,
			HttpSession session
			)throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "resource" + File.separator + "recommendboard";
		boolean b = false;
		
		Recommend dto = service.readFile(fileNum);
		if(dto!=null) {
			String saveFilename = dto.getSaveFilename();
			String originalFilename = dto.getOriginalFilename();
			
			b = fileManager.doFileDownload(saveFilename, originalFilename, pathname, resp);
		}
		if(!b) {
			try {
				resp.setContentType("text/html; charset=utf-8");
				PrintWriter out = resp.getWriter();
				out.println("<script>alert('파일 다운로드가 불가능 합니다 !!!');history.back();</script>");
			} catch (Exception e) {
				throw e;
			}
		}
	}
	
}
