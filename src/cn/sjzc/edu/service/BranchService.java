package cn.sjzc.edu.service;
import java.util.List;

import cn.sjzc.edu.po.Branch;
import cn.sjzc.edu.po.PageBean;


public interface BranchService {

	PageBean findWithPage( int curPage, int pageSize) ;
	
	public void add(Branch branch);
	
	public void delete(int id);
	
	public Branch findById(int id);
	public List<Branch> findAll();
	
	public void edit(Branch branch);
	

}
