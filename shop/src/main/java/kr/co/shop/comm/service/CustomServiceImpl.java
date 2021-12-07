package kr.co.shop.comm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.shop.comm.mapper.CustomMapper;

@Service
@Qualifier("cs")
public class CustomServiceImpl implements CustomService{

	@Autowired
	private CustomMapper mapper;
}
