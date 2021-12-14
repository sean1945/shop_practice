package kr.co.shop.pro.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.shop.pro.vo.BaesongVO;
import kr.co.shop.pro.vo.CartVO;

public interface ProductService {

	public String list(String pcode, Model model);
	public String content(String pcode, Model model);
	public void cart_add(CartVO cvo);
	public String gumae(HttpServletRequest request, Model model, HttpSession session);
	public String view_baesong(HttpSession session, Model model);
	public String baesong_add_ok(BaesongVO bvo, HttpSession session);
	
}
