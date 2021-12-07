package kr.co.shop.comm.mapper;

import java.util.ArrayList;

import kr.co.shop.comm.vo.GongjiVO;

public interface GongjiMapper {
	
	public void write_ok(GongjiVO gvo);
	public ArrayList<GongjiVO> list();
	public void delete(int id);
	public void readnum(int id);
	public GongjiVO content(int id);
}
