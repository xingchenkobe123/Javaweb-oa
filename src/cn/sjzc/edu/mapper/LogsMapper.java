package cn.sjzc.edu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.sjzc.edu.po.Logs;


public interface LogsMapper {
	
	public int findTotalRecords(String type) ;
	public int findTotalRecords_name(String name) ;
	public int findTotalRecords_group(@Param("type")String type,@Param("branch")String branch,@Param("group")String group) ;

	public List<Logs> pageList(@Param("type")String type,@Param("startIndex") int startIndex,@Param("pageSize")int pageSize) ;
	
	public List<Logs> own_pageList(@Param("name")String name,@Param("startIndex") int startIndex,@Param("pageSize")int pageSize) ;
	
	public List<Logs> group_pageList(@Param("type")String type,@Param("branch")String branch,@Param("group")String group,@Param("startIndex") int startIndex,@Param("pageSize")int pageSize) ;
			
	public void add(Logs Logs);
	
	public void delete(int id);
	

	
	
	

}
