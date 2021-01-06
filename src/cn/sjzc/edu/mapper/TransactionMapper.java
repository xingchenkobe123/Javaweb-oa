package cn.sjzc.edu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.sjzc.edu.po.Transaction;
import cn.sjzc.edu.po.Worker;


public interface TransactionMapper {
	
	public int findTotalRecords() ;
	public int findTotalRecords_approver(String apprver) ;
	
	
	public int findTotalRecords_name(String name) ;

	public List<Transaction> pageList(@Param("startIndex") int startIndex, @Param("pageSize")int pageSize) ;
	
	public List<Transaction> pageList_name(@Param("name") String name,@Param("startIndex") int startIndex, @Param("pageSize")int pageSize) ;
	
	public List<Transaction> findMyTransaction(@Param("approver") String approver,@Param("startIndex") int startIndex, @Param("pageSize")int pageSize) ;
	
	public void add(Transaction Transaction);
	
	public void delete(int id);
	
	
	public void edit(Transaction Transaction);
	
	

}
