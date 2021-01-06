package cn.sjzc.edu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.sjzc.edu.po.Notice;


public interface NoticeMapper {
	
	public int findTotalRecords() ;

	public List<Notice> pageList(@Param("startIndex") int startIndex, @Param("pageSize")int pageSize) ;
	
	public void add(Notice Notice);
	
	public void delete(int id);
	
	public Notice findById(int id);
	
	public void edit(Notice Notice);
	

}
