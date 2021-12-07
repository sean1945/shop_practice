package kr.co.shop.comm.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.shop.comm.service.GongjiService;
import kr.co.shop.comm.vo.GongjiVO;

@Controller
@RequestMapping("gongji")
public class GongjiController {

	@Autowired
	@Qualifier("gs")
	private GongjiService gservice;
	
	private final String module="/gongji";

	@RequestMapping("/write")
	public String write()
	{
		return module+"/write";
	}
	
	@RequestMapping("/write_ok")
	public String write_ok(GongjiVO gvo)
	{	
		return "redirect:"+module+gservice.write_ok(gvo);
	}
	
	@RequestMapping("/list")
	public String list(Model model)
	{
		return gservice.list(model);
	}
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request)
	{
		return "redirect:"+module+gservice.delete(request);
	}
	
	@RequestMapping("/readnum")
	public String readnum(HttpServletRequest request)
	{
		return gservice.readnum(request);
	}
	
	@RequestMapping("/content")
	public String content(HttpServletRequest request, Model model)
	{
		return gservice.content(request, model);
	}
}
