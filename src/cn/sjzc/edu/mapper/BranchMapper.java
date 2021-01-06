package cn.sjzc.edu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.sjzc.edu.po.Branch;


public interface BranchMapper {
	
	public int findTotalRecords() ;

	public List<Branch> pageList(@Param("startIndex") int startIndex, @Param("pageSize")int pageSize) ;
	
	public void add(Branch branch);
	
	public void delete(int id);
	
	public Branch findById(int id);
	
	public List<Branch> findAll();
	
	public void edit(Branch branch);
	

}
