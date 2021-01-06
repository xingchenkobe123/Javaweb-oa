package cn.sjzc.edu.service;
import cn.sjzc.edu.po.Logs;
import cn.sjzc.edu.po.PageBean;


public interface LogsService {

	PageBean findWithPage(String type,int curPage, int pageSize) ;
	PageBean own_findWithPage(String name,int curPage, int pageSize) ;
	PageBean group_findWithPage(String type,String branch,String group,int curPage, int pageSize) ;
	
	
	public void add(Logs Logs);
	
	public void delete(int id);
	

	

}
