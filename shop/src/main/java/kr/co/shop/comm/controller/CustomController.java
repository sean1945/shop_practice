package kr.co.shop.comm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.shop.comm.service.CustomService;
import kr.co.shop.comm.vo.CustomVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/custom")
public class CustomController {

	@Autowired
	@Qualifier("cs")
	private CustomService cservice;
	
	private final String module = "/custom";
	
	@RequestMapping("/write")
	public String write()
	{
		return module+"/write";
	}
	
	@RequestMapping("/write_ok")
	public String write_ok(CustomVO cvo, HttpSession session)
	{
		return cservice.write_ok(cvo, session);
	}
	
	@RequestMapping("/list")
	public String list(Model model)
	{
		return cservice.list(model);
	}
	
	@RequestMapping("/readnum")
	public String readnum(HttpServletRequest request)
	{
		return cservice.readnum(request.getParameter("id"));
	}
	
	@RequestMapping("/content")
	public String content(HttpServletRequest request, Model model)
	{
		model.addAttribute("err", request.getParameter("err"));
		return cservice.content(request.getParameter("id"), model);
	}
	
	@RequestMapping("/rewrite")
	public String rewrite(HttpServletRequest request, Model model)
	{
		model.addAttribute("grp", request.getParameter("grp"));
		model.addAttribute("seq", request.getParameter("seq"));
		model.addAttribute("depth", request.getParameter("depth"));
		return module+"/rewrite";
	}
	
	@RequestMapping("/rewrite_ok")
	public String rewrite_ok(CustomVO cvo, HttpSession session)
	{
		return cservice.rewrite_ok(cvo, session);
	}
	
	@RequestMapping("/update_rewrite")
	public String update_rewrite(CustomVO cvo, Model model)
	{
		return cservice.update_rewrite(cvo, model);
	}
	
	@RequestMapping("/update_rewrite_ok")
	public String update_rewrite_ok(CustomVO cvo)
	{
		return cservice.update_rewrite_ok(cvo);
	}
	
	@RequestMapping("/delete_rewrite")
	public String delete_rewrite(CustomVO cvo)
	{
		return cservice.delete_rewrite(cvo);
	}
}
