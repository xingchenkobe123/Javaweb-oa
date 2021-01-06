package cn.sjzc.edu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.sjzc.edu.mapper.LogsMapper;
import cn.sjzc.edu.po.Logs;
import cn.sjzc.edu.po.PageBean;
import cn.sjzc.edu.service.LogsService;

@Service
public class LogsServiceImpl implements LogsService {
	@Autowired
	private LogsMapper LogsMapper;

	@Override
	public PageBean findWithPage(String type,int curPage, int pageSize) {

		// 查询总记录数
		int totalRecords = LogsMapper.findTotalRecords(type);

		// 创建分页数据模型对象
		PageBean PageBean = new PageBean(curPage, pageSize, totalRecords,type);

		List<Logs> list = LogsMapper.pageList(type,PageBean.getStartIndex(), PageBean.getPageSize());
		// 填充分页数据到数据集合
		PageBean.setList(list);

		// 返回模型对象
		return PageBean;

	}

	@Override
	public void add(Logs Logs) {

		LogsMapper.add(Logs);
	}

	@Override
	public void delete(int id) {

		LogsMapper.delete(id);
	}

	@Override
	public PageBean own_findWithPage(String name, int curPage, int pageSize) {
		
		// 查询总记录数
		int totalRecords = LogsMapper.findTotalRecords_name(name);

		// 创建分页数据模型对象
		PageBean PageBean = new PageBean(curPage, pageSize, totalRecords,name);

		List<Logs> list = LogsMapper.own_pageList(name,PageBean.getStartIndex(), PageBean.getPageSize());
		// 填充分页数据到数据集合
		PageBean.setList(list);

		// 返回模型对象
		return PageBean;
	}

	@Override
	public PageBean group_findWithPage(String type, String branch, String group, int curPage, int pageSize) {
		
		// 查询总记录数
		int totalRecords = LogsMapper.findTotalRecords_group(type,branch,group);

		// 创建分页数据模型对象
		PageBean PageBean = new PageBean(curPage, pageSize, totalRecords,type,branch,group);

		List<Logs> list = LogsMapper.group_pageList(type,branch,group,PageBean.getStartIndex(), PageBean.getPageSize());
		// 填充分页数据到数据集合
		PageBean.setList(list);

		// 返回模型对象
		return PageBean;
	}


}
