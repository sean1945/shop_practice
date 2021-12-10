package kr.co.shop.pro.mapper;

import java.util.ArrayList;

import kr.co.shop.pro.vo.CartVO;
import kr.co.shop.pro.vo.ProductVO;

public interface ProductMapper {
	
	public ArrayList<ProductVO> list(String pcode);
	public ProductVO content(String pcode);
	public void cart_add(CartVO cvo);
}
