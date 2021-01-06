package cn.sjzc.edu.service;
import cn.sjzc.edu.po.Notice;
import cn.sjzc.edu.po.PageBean;


public interface NoticeService {

	PageBean findWithPage( int curPage, int pageSize) ;
	
	public void add(Notice Notice);
	
	public void delete(int id);
	
	public Notice findById(int id);
	
	public void edit(Notice Notice);
	

}
