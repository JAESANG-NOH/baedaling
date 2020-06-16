package com.bd.event;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("event.eventController")
@RequestMapping("/event/*")
public class EventController {
	@RequestMapping("/list")
	public String list() {
		return ".event.eventlist";
	}
}
