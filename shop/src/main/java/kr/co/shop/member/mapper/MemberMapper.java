package kr.co.shop.member.mapper;

import kr.co.shop.member.vo.MemberVO;

public interface MemberMapper {
	
	public void member_input_ok(MemberVO mvo);
	public int userid_check(String userid);
	public MemberVO login_ok(MemberVO mvo);
	public String userid_search_ok(MemberVO mvo);
	public String pwd_search_ok(MemberVO mvo);
	public MemberVO mypage(String userid);
	public void mypage_update_ok(MemberVO mvo);
	public int ispwd(String before_pwd, String userid);
	public void change_pwd(String pwd, String userid);
}
