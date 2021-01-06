package cn.sjzc.edu.mapper;

import cn.sjzc.edu.po.Admin;

public interface AdminMapper {
	
	String findByAccount(String account);
	Admin login(Admin admin);

}
