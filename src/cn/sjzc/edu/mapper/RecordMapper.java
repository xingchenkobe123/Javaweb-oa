package cn.sjzc.edu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.sjzc.edu.po.Record;


public interface RecordMapper {
	
	public int findTotalRecords() ;

	public List<Record> pageList(@Param("startIndex") int startIndex, @Param("pageSize")int pageSize) ;
	
	public void add(Record Record);
	
	public void delete(int id);
	

	
	

}
