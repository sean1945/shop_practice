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
}
