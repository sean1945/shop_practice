package kr.co.shop.pro.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.shop.pro.service.ProductService;
import kr.co.shop.pro.vo.BaesongVO;
import kr.co.shop.pro.vo.CartVO;

@Controller
@RequestMapping("/pro")
public class ProductController {

	@Autowired
	@Qualifier("ps")
	private ProductService pservice;
	
	private final String module = "/pro";
	
	@RequestMapping("/list")
	public String list(HttpServletRequest request, Model model)
	{
		return pservice.list(request.getParameter("pcode"), model);
	}
	
	@RequestMapping("/procontent")
	public String procontent(HttpServletRequest request, Model model)
	{
		return pservice.content(request.getParameter("pcode"), model);
	}
	
	@RequestMapping("/cart_add")
	public void cart_add(CartVO cvo, PrintWriter out, HttpSession session)
	{
		if(session.getAttribute("userid") == null)
		{
			out.print("2");
		}
		else
		{
			cvo.setUserid(session.getAttribute("userid").toString());
			pservice.cart_add(cvo);
			out.print("1");
		}
	}
	
	@RequestMapping("/gumae")
	public String gumae(HttpServletRequest request, Model model, HttpSession session)
	{
		if(session.getAttribute("userid") == null)
		{
			return "redirect:/member/login";
		}
		else
		{
			return pservice.gumae(request, model, session);
		}
		
	}
	
	@RequestMapping("view_baesong")
	public String view_baesong(HttpSession session, Model model)
	{
		return pservice.view_baesong(session, model);
	}
	
	@RequestMapping("baesong_add")
	public String baesong_add()
	{
		return module+"/baesong_add";
	}
	
	@RequestMapping("baesong_add_ok")
	public String baesong_add_ok(BaesongVO bvo, HttpSession session)
	{
		return pservice.baesong_add_ok(bvo, session);
	}
}
