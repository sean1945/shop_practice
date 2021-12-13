package kr.co.shop.pro.mapper;

import java.util.ArrayList;

import kr.co.shop.member.vo.MemberVO;
import kr.co.shop.pro.vo.BaesongVO;
import kr.co.shop.pro.vo.CartVO;
import kr.co.shop.pro.vo.ProductVO;

public interface ProductMapper {
	
	public ArrayList<ProductVO> list(String pcode);
	public ProductVO content(String pcode);
	public void cart_add(CartVO cvo);
	public MemberVO get_member(String userid);
	public BaesongVO get_baesong(String userid);
	// public ProductVO get_product(String pcode); procontent메소드와 동일
}
