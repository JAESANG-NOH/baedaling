package com.bd.foodorder;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


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
		int orderCount4 =0;
	
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
		
		map.put("restaurantsNum", restaurantsNum);
		map.put("foodOrderState", "배달완료");
		List<FoodOrder> list4 = service.readOrder(map);
		orderCount4 = service.orderCount(map);
		
		model.addAttribute("list1", list1);
		model.addAttribute("list2",list2);
		model.addAttribute("list3",list3);
		model.addAttribute("list4",list4);
		model.addAttribute("orderCount1", orderCount1);
		model.addAttribute("orderCount2", orderCount2);
		model.addAttribute("orderCount3", orderCount3);
		model.addAttribute("orderCount4", orderCount4);
		return "dashboard/orderlist";
	}
	
	
	@RequestMapping(value="salesList")
	public String page(
			@RequestParam int restaurantsNum,
			Model model
			) throws Exception{
		// List<FoodOrder> bestlist = service.bestMenuChart(restaurantsNum);
		Map<String, Object> mm = new HashMap<String, Object>();
		mm.put("restaurantsNum", restaurantsNum);
		mm.put("foodOrderState", "배달완료");
		List<FoodOrder> listall = service.allList(mm);
		
		FoodOrder today = service.todaySalesRead(restaurantsNum);
		FoodOrder month = service.monthlySalesRead(restaurantsNum);
		FoodOrder annual = service.annualSalesRead(restaurantsNum);
		
		//Map<String, Object> sSales = service.montlyChart(restaurantsNum);
		
		model.addAttribute("today",today);
		model.addAttribute("month",month);
		model.addAttribute("annual",annual);
		model.addAttribute("restaurantsNum",restaurantsNum);
		model.addAttribute("list",listall);
	//	model.addAttribute("sSales", sSales);
		// model.addAttribute("bestlist",bestlist);
		
		return "dashboard/salesList";
	}
	
	
	@RequestMapping(value="pie3d", produces="application/json;charset=utf-8")
	@ResponseBody	
	public String pie3d(
			@RequestParam int restaurantsNum
			) throws Exception{
		List<FoodOrder> bestlist = service.bestMenuChart(restaurantsNum);
		
		JSONArray arr = new JSONArray();
		JSONObject job = new JSONObject();
		
		JSONArray ja = new JSONArray();
		for(FoodOrder dto : bestlist) {
			ja.put(new JSONArray("['"+dto.getMenuName()+"',"+dto.getBestSales()+"]"));
		}
		
		job.put("data", ja);
		arr.put(job);
		
		return arr.toString();
	}
	
	
	
	
	
	@RequestMapping(value="barChart", produces="application/json;charset=utf-8")
	@ResponseBody
	public String lineChart(
			@RequestParam int restaurantsNum
			)throws Exception{
		
		Map<String, Object> sSales = service.montlyChart(restaurantsNum);
		
		JSONArray arr = new JSONArray();
		
		JSONObject ob;
		ob = new JSONObject();
		ob.put("name", "1월");
		ob.put("y", sSales.get("M01"));
		arr.put(ob);
		
		ob = new JSONObject();
		ob.put("name", "2월");
		ob.put("y", sSales.get("M02"));
		arr.put(ob);

		ob = new JSONObject();
		ob.put("name", "3월");
		ob.put("y", sSales.get("M03"));
		arr.put(ob);

		ob = new JSONObject();
		ob.put("name", "4월");
		ob.put("y", sSales.get("M04"));
		arr.put(ob);

		ob = new JSONObject();
		ob.put("name", "5월");
		ob.put("y", sSales.get("M05"));
		arr.put(ob);

		ob = new JSONObject();
		ob.put("name", "6월");
		ob.put("y", sSales.get("M06"));
		arr.put(ob);

		ob = new JSONObject();
		ob.put("name", "7월");
		ob.put("y", sSales.get("M07"));
		arr.put(ob);

		ob = new JSONObject();
		ob.put("name", "8월");
		ob.put("y", sSales.get("M08"));
		arr.put(ob);

		ob = new JSONObject();
		ob.put("name", "9월");
		ob.put("y", sSales.get("M09"));
		arr.put(ob);

		ob = new JSONObject();
		ob.put("name", "10월");
		ob.put("y", sSales.get("M10"));
		arr.put(ob);

		ob = new JSONObject();
		ob.put("name", "11월");
		ob.put("y", sSales.get("M11"));
		arr.put(ob);

		ob = new JSONObject();
		ob.put("name", "12월");
		ob.put("y", sSales.get("M12"));
		arr.put(ob);
		
		JSONObject job = new JSONObject();
		job.put("name", "월별 판매현황");
		job.put("colorByPoint", true);
		job.put("data", arr);

		
		JSONArray jarr = new JSONArray();
		jarr.put(job);

		return jarr.toString(); 
	}
	
	
	@RequestMapping(value="updateState",method=RequestMethod.POST, produces="application/json;charset=utf-8")
	@ResponseBody
	public Map<String, Object> updateState(
			@RequestParam int restaurantsNum,
			@RequestParam int foodorderNum,
			@RequestParam String orderState
			) throws Exception{
		
		String state = "false";
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("orderState", orderState);
			map.put("foodorderNum", foodorderNum);
			
			service.updateOrderState(map);
			state = "true";
		} catch (Exception e) {
			
		}
		Map<String, Object> model = new HashMap<>();
		model.put("state",state);
		
		return model;
		
	}
	
	@RequestMapping(value="delete", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delete(
			@RequestParam int foodorderNum
			) throws Exception{
		String state = "false";
		try {
			service.deleteOrder(foodorderNum);
			state = "true";
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	
	@RequestMapping(value="fcinfo_write", method=RequestMethod.GET )
	public String fcpageUpdate(
			@RequestParam int restaurantsNum,
			Model model
			) {
		try {
//			service.updateInfo(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "dashboard/fcinfo_write";
	}
	

	
}
