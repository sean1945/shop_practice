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
}
