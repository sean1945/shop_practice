package kr.co.shop.comm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import kr.co.shop.comm.service.RecomService;

@Controller
public class RecomController {

	@Autowired
	@Qualifier("rs")
	private RecomService rservice;
}
