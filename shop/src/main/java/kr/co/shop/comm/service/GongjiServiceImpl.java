package kr.co.shop.comm.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.shop.comm.mapper.GongjiMapper;
import kr.co.shop.comm.vo.GongjiVO;

@Service
@Qualifier("gs")
public class GongjiServiceImpl implements GongjiService{

	@Autowired
	private GongjiMapper mapper;
	
	@Override
	public String write_ok(GongjiVO gvo)
	{
		mapper.write_ok(gvo);
		return "/list";
	}
	
	@Override
	public String list(Model model)
	{
		model.addAttribute("list", mapper.list());
		return "/gongji/list";
	}
	
	@Override
	public String delete(HttpServletRequest request)
	{
		int id = Integer.parseInt(request.getParameter("id"));
		mapper.delete(id);
		return "/list";
	}
	
	@Override
	public String readnum(HttpServletRequest request)
	{
		int id = Integer.parseInt(request.getParameter("id"));
		mapper.readnum(id);
		return "redirect:/gongji/content?id="+id;
	}
	
	@Override
	public String content(HttpServletRequest request, Model model)
	{
		int id = Integer.parseInt(request.getParameter("id"));
		model.addAttribute("gvo", mapper.content(id));
		return "/gongji/content";
	}
}
