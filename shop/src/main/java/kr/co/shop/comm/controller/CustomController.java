package kr.co.shop.comm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import kr.co.shop.comm.service.CustomService;

@Controller
public class CustomController {

	@Autowired
	@Qualifier("cs")
	private CustomService cservice;
	
}
