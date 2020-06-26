package com.bd.rerestaurants;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bd.common.DistanceManager;
import com.bd.common.MyUtil;
import com.bd.user.Sessionlocation;

@Controller("restaurants.restaurantsController")
@RequestMapping("/restaurants/*")
public class RestaurantsController {
	@Autowired
	private DistanceManager distance;
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="list")
	public String list(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="scope", defaultValue="default") String scope,
			HttpServletRequest req,
			HttpSession session,
			Model model
			) throws Exception{
		
		Sessionlocation location = (Sessionlocation) session.getAttribute("location");
		String cp = req.getContextPath();
		
		if(location==null) {
			return "redirect:/";
		}
		
		
		
		int rows = 20;
		int total_page = 0;
		int dataCount = 0;
		String city = location.getAddr().trim();
		city = city.substring(0,city.indexOf(" "));
		System.out.println(city);
		
		Map<String, Object> map = new HashMap<String,Object>();
		
		return ".restaurantsmenu.list";
	}
}
