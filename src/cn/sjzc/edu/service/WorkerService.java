package cn.sjzc.edu.service;

import java.util.List;

import cn.sjzc.edu.po.PageBean;
import cn.sjzc.edu.po.Worker;

public interface WorkerService {

	PageBean findWithPage(int curPage, int pageSize);
	
	PageBean findWithPage_schema(String branch,String group,int curPage, int pageSize);

	public void add(Worker worker);
	public String findApprover(Worker worker);
	public void delete(int id);

	public Worker findById(int id);

	public void edit(Worker worker);

	public void edit_lv(Worker worker);
	public void edit_pwd(Worker worker);
	public void edit_phone(Worker worker);

	Worker findByPhone(String phone);

	Worker login(Worker Worker);
	

}
