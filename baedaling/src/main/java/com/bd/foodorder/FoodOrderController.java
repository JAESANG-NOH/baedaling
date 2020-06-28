package com.bd.foodorder;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("foodorder.foodOrderController")
@RequestMapping("/dashboard/*")
public class FoodOrderController {
	@Autowired
	private FoodOrderService service;
	
	@RequestMapping(value="orderlist")
	public String orderList(
			@RequestParam int restaurantsNum,
			Model model
			) {
		
		int orderCount1 =0;
		int orderCount2 =0;
		int orderCount3 =0;
	
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("restaurantsNum", restaurantsNum);
		map.put("foodOrderState", "주문완료");
		List<FoodOrder> list1 = service.readOrder(map);
		orderCount1 = service.orderCount(map);
		
		map.put("restaurantsNum", restaurantsNum);
		map.put("foodOrderState", "접수완료");
		List<FoodOrder> list2 = service.readOrder(map);
		orderCount2 = service.orderCount(map);
		
		map.put("restaurantsNum", restaurantsNum);
		map.put("foodOrderState", "배달중");
		List<FoodOrder> list3 = service.readOrder(map);
		orderCount3 = service.orderCount(map);
		
		model.addAttribute("list1", list1);
		model.addAttribute("list2",list2);
		model.addAttribute("list3",list3);
		model.addAttribute("orderCount1", orderCount1);
		model.addAttribute("orderCount2", orderCount2);
		model.addAttribute("orderCount3", orderCount3);
		return "/dashboard/orderlist";
	}
	
	
	@RequestMapping(value="salesList")
	public String page(
			@RequestParam int restaurantsNum,
			Model model
			) throws Exception{
		List<FoodOrder> bestlist = service.bestMenuChart(restaurantsNum);
		FoodOrder today = service.todaySalesRead(restaurantsNum);
		FoodOrder month = service.monthlySalesRead(restaurantsNum);
		FoodOrder annual = service.annualSalesRead(restaurantsNum);
		model.addAttribute("today",today);
		model.addAttribute("month",month);
		model.addAttribute("annual",annual);
		model.addAttribute("bestlist",bestlist);
		
		return "/dashboard/salesList";
	}
	
}
