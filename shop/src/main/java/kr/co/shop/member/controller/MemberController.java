package kr.co.shop.member.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.shop.member.service.MemberService;
import kr.co.shop.member.vo.MemberVO;
import kr.co.shop.util.MailSend;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	@Qualifier("ms")
	private MemberService mservice;
	
	private final String module = "/member";
	
	@RequestMapping("/member_input")
	public String member_input()
	{
		return module+"/member_input";
	}
	
	@RequestMapping("/member_input_ok")
	public String member_input_ok(MemberVO mvo)
	{
		return "redirect:"+module+mservice.member_input_ok(mvo);
	}
	
	@RequestMapping("/userid_check")
	public void userid_chk(HttpServletRequest request, PrintWriter out) // 아이디의 사용여부를 javascript로 전달
	{
		String userid = request.getParameter("userid");
		int cnt = mservice.userid_check(userid);
		out.print(cnt); // 아이디로 검색한 레코드 수
	}
	
	@RequestMapping("/login")
	public String login()
	{
		return module+"/login";
	}
	
	@RequestMapping("/login_ok")
	public String login_ok(MemberVO mvo, HttpSession session)
	{
		return mservice.login_ok(mvo, session);
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session)
	{
		session.invalidate();
		return "/main/index";
	}

	@RequestMapping("/userid_search_ok")
	public void userid_search_ok(MemberVO mvo,PrintWriter out)
	{
		String userid=mservice.userid_search_ok(mvo);
		if(userid==null)
			out.print("0");
		else
		    out.print(userid);
	}
	
	@RequestMapping("/pwd_search_ok")
	public void pwd_search_ok(MemberVO mvo,PrintWriter out) throws Exception
	{
		String pwd=mservice.pwd_search_ok(mvo);
		if(pwd==null)
			out.print("0");
		else
		{
			// out.print(pwd);
			// 이메일에 비밀번호를 전송 => Mailsend클래스 이용
			MailSend ms = MailSend.getInstance();
			String email = mvo.getEmail();
			String subject = mvo.getName()+"님의 비밀번호 입니다";
			String body = "당신의 비밀번호는 "+pwd+" 입니다";
			ms.setEmail(email, subject, body);
		}
	}
	
	@RequestMapping("/mypage")
	public String mypage(HttpSession session, Model model)
	{
		return mservice.mypage(session, model);
	}
	
	@RequestMapping("/mypage_update")
	public String mypage_update(HttpSession session, Model model)
	{
		// 현재 수정할 사용자의 레코드를 읽어와서 전달
		return mservice.mypage_update(session, model);
	}
	
	@RequestMapping("/mypage_update_ok")
	public String mypage_update_ok(MemberVO mvo, HttpSession session)
	{
		return mservice.mypage_update_ok(mvo, session);
	}
	
	@RequestMapping("/change_pwd")
	public String chage_pwd(HttpServletRequest request, HttpSession session)
	{
		// 이전비밀번호 확인, 새로운 비밀번호 변경, 로그아웃, main/index로 이동
		return mservice.change_pwd(request, session);
	}
}
