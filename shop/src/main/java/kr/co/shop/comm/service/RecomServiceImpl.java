package kr.co.shop.comm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.shop.comm.mapper.RecomMapper;

@Service
@Qualifier("rs")
public class RecomServiceImpl implements RecomService{

	@Autowired
	private RecomMapper mapper;
}
