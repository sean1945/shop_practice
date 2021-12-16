package kr.co.shop.pro.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.shop.pro.mapper.ProductMapper;
import kr.co.shop.pro.vo.BaesongVO;
import kr.co.shop.pro.vo.CartVO;
import kr.co.shop.pro.vo.GumaeVO;

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
	
	@Override
	public String gumae(HttpServletRequest request, Model model, HttpSession session)
	{
		// 구매자정보, 배송정보, 상품정보
		String pcode = request.getParameter("pcode");
		String userid = session.getAttribute("userid").toString();
		model.addAttribute("pvo", mapper.content(pcode));
		model.addAttribute("mvo", mapper.get_member(userid));
		model.addAttribute("bvo", mapper.get_baesong(userid));
		model.addAttribute("su", request.getParameter("su"));
		
		return module+"/gumae";
	}
	
	@Override
	public String view_baesong(HttpSession session, Model model)
	{
		String userid = session.getAttribute("userid").toString();
		ArrayList<BaesongVO> list=mapper.view_baesong(userid);
		model.addAttribute("list", list);
		return module+"/view_baesong";
	}
	
	@Override
	public String baesong_add_ok(BaesongVO bvo, HttpSession session)
	{
		bvo.setUserid(session.getAttribute("userid").toString());
		mapper.baesong_add_ok(bvo);
		return "redirect:/pro/view_baesong";
	}
	
	@Override
	public void phone_chg(HttpServletRequest request, HttpSession session)
	{
		String phone = request.getParameter("phone");
		String userid = session.getAttribute("userid").toString();
		mapper.phone_chg(phone, userid);
	}
	
	@Override
	public void req_chg(HttpServletRequest request)
	{
		String id = request.getParameter("id");
		String req = request.getParameter("req");
		mapper.req_chg(req, id);
	}
	
	@Override
	public String gumae_ok(GumaeVO gvo, HttpSession session)
	{
		gvo.setUserid(session.getAttribute("userid").toString());
		mapper.gumae_ok(gvo);
		return "redirect:"+module+"/gumae_view";
	}
}
