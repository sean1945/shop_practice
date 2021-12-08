package kr.co.shop.comm.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.shop.comm.mapper.CustomMapper;
import kr.co.shop.comm.vo.CustomVO;

@Service
@Qualifier("cs")
public class CustomServiceImpl implements CustomService{

	@Autowired
	private CustomMapper mapper;
	
	private final String module = "/custom";
	
	@Override
	public String write_ok(CustomVO cvo, HttpSession session)
	{
		// grp값을 처리 해야 한다.
		int grp = mapper.get_grp();
		cvo.setGrp(grp+1);
		
		// 회원인경우, 비회원인 경우 처리가 달라야 한다.
		if(session.getAttribute("userid") == null)
		{
			mapper.nonmember_write_ok(cvo);
		}
		else
		{
			// 회원인 경우 세션변수의 아이디를 vo에 userid변수에 setter
			cvo.setUserid(session.getAttribute("userid").toString());
			mapper.member_write_ok(cvo);
		}
		
		return "redirect:"+module+"/list";
	}
	
	@Override
	public String list(Model model)
	{
		model.addAttribute("list", mapper.list());
		return module+"/list";
	}
	
	@Override
	public String readnum(String id)
	{
		mapper.readnum(id);
		return "redirect:"+module+"/content?id="+id;
	}
	
	@Override
	public String content(String id, Model model)
	{
		model.addAttribute("cvo", mapper.content(id));
		return module+"/content";
	}
	
	@Override
	public String rewrite_ok(CustomVO cvo, HttpSession session)
	{
		// 회원인경우, 비회원인 경우 처리가 달라야 한다.
		if(session.getAttribute("userid") == null)
		{
			mapper.nonmember_rewrite_ok(cvo);
		}
		else
		{
			// 회원인 경우 세션변수의 아이디를 vo에 userid변수에 setter
			cvo.setUserid(session.getAttribute("userid").toString());
			mapper.member_rewrite_ok(cvo);
		}
		
		return "redirect:"+module+"/list";
	}
}
