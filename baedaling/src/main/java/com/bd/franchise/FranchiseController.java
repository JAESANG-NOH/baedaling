package com.bd.franchise;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

	
@Controller("franchise.franchiseController")
@RequestMapping("/franchise/*")
public class FranchiseController {
	@Autowired
	private FranchiseService service;
	
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
	
	@RequestMapping(value="pay")
	public String insertorder(
			Franchise dto,
			@RequestParam int restaurantsNum
			){
		
		return "";
	}
	
}


