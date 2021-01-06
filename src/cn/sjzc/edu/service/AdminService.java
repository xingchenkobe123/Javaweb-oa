package cn.sjzc.edu.service;

import cn.sjzc.edu.po.Admin;

public interface AdminService {
	String findByAccount(String account);
	Admin login(Admin Admin);
}
