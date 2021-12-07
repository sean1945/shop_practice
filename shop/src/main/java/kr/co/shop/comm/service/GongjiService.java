package kr.co.shop.comm.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import kr.co.shop.comm.vo.GongjiVO;

public interface GongjiService {

	public String write_ok(GongjiVO gvo);
	public String list(Model model);
	public String delete(HttpServletRequest request);
	public String readnum(HttpServletRequest request);
	public String content(HttpServletRequest request, Model model);
}
