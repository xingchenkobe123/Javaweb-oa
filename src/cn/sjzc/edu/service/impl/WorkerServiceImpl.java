package cn.sjzc.edu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.sjzc.edu.mapper.WorkerMapper;
import cn.sjzc.edu.po.PageBean;
import cn.sjzc.edu.po.Worker;
import cn.sjzc.edu.service.WorkerService;

@Service
public class WorkerServiceImpl implements WorkerService {
	@Autowired
	private WorkerMapper workerMapper;

	@Override
	public PageBean findWithPage(int curPage, int pageSize) {

		// 查询总记录数
		int totalRecords = workerMapper.findTotalRecords();

		// 创建分页数据模型对象
		PageBean PageBean = new PageBean(curPage, pageSize, totalRecords);

		List<Worker> list = workerMapper.pageList(PageBean.getStartIndex(), PageBean.getPageSize());
		// 填充分页数据到数据集合
		PageBean.setList(list);

		// 返回模型对象
		return PageBean;

	}

	@Override
	public void add(Worker worker) {

		workerMapper.add(worker);
	}

	@Override
	public void delete(int id) {

		workerMapper.delete(id);
	}

	@Override
	public Worker findById(int id) {

		return workerMapper.findById(id);
	}

	@Override
	public void edit(Worker worker) {
		workerMapper.edit(worker);

	}

	@Override
	public void edit_lv(Worker worker) {
		workerMapper.edit_lv(worker);

	}

	@Override
	public Worker findByPhone(String phone) {

		return workerMapper.findByPhone(phone);
	}

	@Override
	public Worker login(Worker Worker) {

		return workerMapper.login(Worker);
	}

	@Override
	public void edit_pwd(Worker worker) {
		workerMapper.edit_pwd(worker);
	}

	@Override
	public void edit_phone(Worker worker) {
		workerMapper.edit_phone(worker);
	}

	@Override
	public PageBean findWithPage_schema(String branch, String group, int curPage, int pageSize) {

		// 查询总记录数
		int totalRecords = workerMapper.findTotalRecords_schema(branch, group);

		// 创建分页数据模型对象
		PageBean PageBean = new PageBean(curPage, pageSize, totalRecords, branch, group);

		List<Worker> list = workerMapper.pageList_schema(branch,group,PageBean.getStartIndex(), PageBean.getPageSize());
		// 填充分页数据到数据集合
		PageBean.setList(list);

		// 返回模型对象
		return PageBean;

	}

	@Override
	public String findApprover(Worker worker) {
		
		return workerMapper.findApprover(worker);
	}

}
