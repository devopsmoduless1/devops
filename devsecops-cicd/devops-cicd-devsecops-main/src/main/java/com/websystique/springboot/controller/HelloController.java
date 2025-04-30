package com.websystique.springboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelloController {

	@RequestMapping("/")
	String home(ModelMap modal) {
		modal.addAttribute("title", "DEVOPS DEMO");
		modal.addAttribute("message", "Welcome to Devops Demo V2---- TeamDevops");
		return "hello";
	}
}
