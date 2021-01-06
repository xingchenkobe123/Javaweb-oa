package cn.sjzc.edu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.sjzc.edu.po.Metting;

public interface MettingMapper {

	public int findTotalRecords();
	
	public int findTotalRecords_name(String name);

	public List<Metting> pageList(@Param("startIndex") int startIndex, @Param("pageSize") int pageSize);
	public List<Metting> own_pageList(@Param("name") String name,@Param("startIndex") int startIndex, @Param("pageSize") int pageSize);

	public void add(Metting Metting);

	public void delete(int id);

}
