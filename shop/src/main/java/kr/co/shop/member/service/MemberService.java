package kr.co.shop.member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.shop.member.vo.MemberVO;

public interface MemberService {

	public String member_input_ok(MemberVO mvo);
	public int userid_check(String userid);
	public String login_ok(MemberVO mvo, HttpSession session);
	public String userid_search_ok(MemberVO mvo);
	public String pwd_search_ok(MemberVO mvo);
	public String mypage(HttpSession session, Model model);
	public String mypage_update(HttpSession session, Model model);
	public String mypage_update_ok(MemberVO mvo, HttpSession session);
	public String change_pwd(HttpServletRequest request, HttpSession session);
}
