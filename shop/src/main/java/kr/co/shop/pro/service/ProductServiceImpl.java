package kr.co.shop.pro.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.shop.pro.mapper.ProductMapper;
import kr.co.shop.pro.vo.CartVO;

@Service
@Qualifier("ps")
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProductMapper mapper;
	
	private final String module = "/pro";
	
	@Override
	public String list(String pcode, Model model)
	{
		model.addAttribute("plist", mapper.list(pcode));
		return module+"/list";
	}
	
	@Override
	public String content(String pcode, Model model)
	{
		model.addAttribute("pvo", mapper.content(pcode));
		return module+"/content";
	}
	
	@Override
	public void cart_add(CartVO cvo)
	{
		mapper.cart_add(cvo);
	}

}
