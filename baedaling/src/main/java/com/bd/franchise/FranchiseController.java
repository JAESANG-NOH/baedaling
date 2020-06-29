package com.bd.franchise;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

	
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
			return "redirect:/franchise/list?";
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
	
	
}


