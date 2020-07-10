package com.bd.franchise;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bd.common.MyUtil;

	
@Controller("franchise.franchiseController")
@RequestMapping("/franchise/*")
public class FranchiseController {
	@Autowired
	private FranchiseService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="page")
	public String page(
			@RequestParam int restaurantsNum,
			Model model 
			) {
		
		Franchise dto= service.readBoard(restaurantsNum);
		if(dto==null) {
			return "redirect:/restaurants/list";
		}
		
		model.addAttribute("dto", dto);
		return ".franchise.page";
	}

	@RequestMapping(value="menu")
	public String menu(
			@RequestParam int restaurantsNum,
			Model model
			) throws Exception{
		
		List<FranchiseMenu> menuList = service.listMenu(restaurantsNum);
		List<FranchiseMenu> category = service.listCategory();
		
		
		
		model.addAttribute("menuList",menuList);
		model.addAttribute("listCatrgory",category);
		
		return "franchise/menuList";
	}
	
	@RequestMapping(value="detailMenu")
	public String detailMenu(
			@RequestParam int menuCategoryNum,
			@RequestParam int restaurantsNum,
			Model model
			) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("restaurantsNum", restaurantsNum);
		map.put("menuCategoryNum", menuCategoryNum);
		
		List<FranchiseMenu> detailList = service.detailList(map);
		
		model.addAttribute("detailList",detailList);
		
		return "franchise/detailMenu";
				
	}
	
	@RequestMapping(value="info")
	public String info(
			@RequestParam int restaurantsNum,
			Model model
			) throws Exception{
		
		Franchise dto= service.readBoard(restaurantsNum);
		if(dto==null) {
			return "redirect:/franchise/list?";
		}
		
		model.addAttribute("dto", dto);
		
		return "franchise/infoList";
	}
	
	
	@RequestMapping(value="read")
	@ResponseBody
	public Map<String, Object> readMenu(
			@RequestParam int menuNum
			) {
		Map<String, Object> map = new HashMap<>();
		FranchiseMenu dto = service.readMenu(menuNum);
		
		map.put("dto", dto);
		
		return map;
	}
	
	
	@RequestMapping(value="review")
	public String list(
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			HttpServletRequest req,
			@RequestParam int restaurantsNum,
			Model model	) throws Exception {
		
		int rows = 1;
		int total_page;
		int dataCount;
		int replyCount;
		double aveStarCount;
		aveStarCount = service.aveStarCount(restaurantsNum);
		double aveStarCount1 = Double.parseDouble(String.format("%.1f",aveStarCount));
		int aveStarCount2 = (int) Math.floor(aveStarCount);

		replyCount = service.reviewReplyCount(restaurantsNum);
		dataCount = service.reviewCount(restaurantsNum);
		total_page = myUtil.pageCount(rows, dataCount);

		if (total_page < current_page)
			current_page = total_page;
		
		int offset = (current_page-1) * rows;
		
		Map<String, Object> map = new HashMap<>();
		if(offset < 0) offset = 0;
        map.put("offset", offset);
        map.put("rows", rows);
        map.put("restaurantsNum", restaurantsNum);
		List<FranchiseReview> list = service.listReview(map);

        // ajax 페이징처리
        String paging = myUtil.pagingMethod(current_page, total_page, "listPagee");

		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("paging", paging);
		model.addAttribute("total_page", total_page);
		model.addAttribute("aveStarCount",aveStarCount1);
		model.addAttribute("replyCount",replyCount);
		model.addAttribute("aveStarCount2",aveStarCount2);
		return "franchise/reviewList";
	}
	
}


