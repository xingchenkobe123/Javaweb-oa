package cn.sjzc.edu.service;

import cn.sjzc.edu.po.Transaction;
import cn.sjzc.edu.po.PageBean;

public interface TransactionService {

	PageBean findWithPage(int curPage, int pageSize);
	
	PageBean findWithPage_name(String name,int curPage, int pageSize);
	PageBean findMyTransaction(String approver,int curPage, int pageSize);

	public void add(Transaction Transaction);

	public void delete(int id);

	public void edit(Transaction Transaction);
}
