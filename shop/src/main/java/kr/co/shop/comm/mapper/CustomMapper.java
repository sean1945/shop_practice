package kr.co.shop.comm.mapper;

import java.util.ArrayList;

import kr.co.shop.comm.vo.CustomVO;

public interface CustomMapper {
	
	public void member_write_ok(CustomVO cvo);
	public void nonmember_write_ok(CustomVO cvo);
	public int get_grp();
	public ArrayList<CustomVO> list();
	public void readnum(String id);
	public CustomVO content(String id);
	public void member_rewrite_ok(CustomVO cvo);
	public void nonmember_rewrite_ok(CustomVO cvo);
	public void up_seq(int seq, int grp);
	public CustomVO update_rewrite(int id);
	public void update_rewrite_ok(CustomVO cvo);
	public int pwd_check(String userid, String pwd, int id);
	public void delete_rewrite(int id);
}
