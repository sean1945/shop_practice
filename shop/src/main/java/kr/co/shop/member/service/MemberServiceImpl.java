package kr.co.shop.member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.shop.member.mapper.MemberMapper;
import kr.co.shop.member.vo.MemberVO;

@Service
@Qualifier("ms")
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberMapper mapper;
	
	@Override
	public String member_input_ok(MemberVO mvo)
	{
		mapper.member_input_ok(mvo);
		
		return "/login";
	}

	@Override
	public int userid_check(String userid) 
	{
		return mapper.userid_check(userid);
	}
	
	@Override
	public String login_ok(MemberVO mvo, HttpSession session)
	{
		MemberVO mvo2 = mapper.login_ok(mvo);
		// 로그인 => 아이디, 비번체크 => 세션변수 할당
		if(mvo2 == null) // 아이디, 비번 잘못 입력
		{
			return "/member/login";
		}
		else
		{
			session.setAttribute("userid", mvo2.getUserid());
			session.setAttribute("name", mvo2.getName());
			return "redirect:/main/index";
		}	
	}

	@Override
	public String userid_search_ok(MemberVO mvo) 
	{
		return mapper.userid_search_ok(mvo);
	}

	@Override
	public String pwd_search_ok(MemberVO mvo) 
	{
		return mapper.pwd_search_ok(mvo);
	}
	
	@Override
	public String mypage(HttpSession session, Model model)
	{
		MemberVO mvo = mapper.mypage(session.getAttribute("userid").toString());
		model.addAttribute("mvo", mvo);
		return "/member/mypage";
	}
	
	@Override
	public String mypage_update(HttpSession session, Model model)
	{
		MemberVO mvo = mapper.mypage(session.getAttribute("userid").toString());
		model.addAttribute("mvo", mvo);
		return "/member/mypage_update";
	}
	
	@Override
	public String mypage_update_ok(MemberVO mvo, HttpSession session)
	{
		mvo.setUserid(session.getAttribute("userid").toString());
		mapper.mypage_update_ok(mvo);
		return "redirect:/member/mypage";
	}
	
	@Override
	public String change_pwd(HttpServletRequest request, HttpSession session)
	{
		// 이전비밀번호가 맞는지 확인
		String before_pwd = request.getParameter("before_pwd");
		String pwd = request.getParameter("pwd");
		int chk = mapper.ispwd(before_pwd, session.getAttribute("userid").toString());
		if(chk == 1) // 이전비밀번호가 맞다
		{
			mapper.change_pwd(pwd, session.getAttribute("userid").toString());
			session.invalidate();
			return "redirect:/main/index";
		}
		else
		{
			return "redirect:/member/mypage";
		}
		
	}
}
