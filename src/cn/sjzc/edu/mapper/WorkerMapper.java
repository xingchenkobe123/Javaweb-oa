package cn.sjzc.edu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.sjzc.edu.po.Worker;

public interface WorkerMapper {

	public int findTotalRecords();
	public String findApprover(Worker worker);
	public int findTotalRecords_schema(@Param("branch") String branch, @Param("group") String group);

	public List<Worker> pageList(@Param("startIndex") int startIndex, @Param("pageSize") int pageSize);

	public List<Worker> pageList_schema(@Param("branch") String branch, @Param("group") String group,
			@Param("startIndex") int startIndex, @Param("pageSize") int pageSize);

	public void add(Worker worker);

	public void delete(int id);

	public Worker findById(int id);

	public void edit(Worker worker);

	public void edit_lv(Worker worker);

	public void edit_pwd(Worker worker);

	public void edit_phone(Worker worker);

	public Worker findByPhone(String phone);

	public Worker login(Worker Worker);

}
