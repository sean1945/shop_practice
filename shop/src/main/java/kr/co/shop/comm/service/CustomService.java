package kr.co.shop.comm.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.shop.comm.vo.CustomVO;

public interface CustomService {

	public String write_ok(CustomVO cvo, HttpSession session);
	public String list(Model model);
	public String readnum(String id);
	public String content(String id, Model model);
	public String rewrite_ok(CustomVO cvo, HttpSession session);
	public String update_rewrite(CustomVO cvo, Model model);
	public String update_rewrite_ok(CustomVO cvo);
	public String delete_rewrite(CustomVO cvo);
}
