package cn.sjzc.edu.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.sjzc.edu.mapper.AdminMapper;
import cn.sjzc.edu.po.Admin;
import cn.sjzc.edu.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper adminMapper;

	@Override
	public String findByAccount(String account) {

		return adminMapper.findByAccount(account);
	}

	@Override
	public Admin login(Admin Admin) {

		return adminMapper.login(Admin);
	}

}
