package cn.sjzc.edu.service;
import cn.sjzc.edu.po.Metting;
import cn.sjzc.edu.po.PageBean;


public interface MettingService {

	PageBean findWithPage( int curPage, int pageSize) ;
	
	PageBean own_findWithPage( String name,int curPage, int pageSize) ;
	
	public void add(Metting Metting);
	
	public void delete(int id);
	

	

}
