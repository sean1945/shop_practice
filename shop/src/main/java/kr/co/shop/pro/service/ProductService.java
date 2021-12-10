package kr.co.shop.pro.service;

import org.springframework.ui.Model;

import kr.co.shop.pro.vo.CartVO;

public interface ProductService {

	public String list(String pcode, Model model);
	public String content(String pcode, Model model);
	public void cart_add(CartVO cvo);
}
