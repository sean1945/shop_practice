package kr.co.shop.pro.mapper;

import java.util.ArrayList;

import kr.co.shop.member.vo.MemberVO;
import kr.co.shop.pro.vo.BaesongVO;
import kr.co.shop.pro.vo.CartVO;
import kr.co.shop.pro.vo.GumaeVO;
import kr.co.shop.pro.vo.ProductVO;

public interface ProductMapper {
	
	public ArrayList<ProductVO> list(String pcode);
	public ProductVO content(String pcode);
	public void cart_add(CartVO cvo);
	public MemberVO get_member(String userid);
	public BaesongVO get_baesong(String userid);
	// public ProductVO get_product(String pcode); procontent메소드와 동일
	public ArrayList<BaesongVO> view_baesong(String userid);
	public void baesong_add_ok(BaesongVO bvo);
	public void phone_chg(String phone, String userid);
	public void req_chg(String req, String id);
	public void gumae_ok(GumaeVO gvo);
}
