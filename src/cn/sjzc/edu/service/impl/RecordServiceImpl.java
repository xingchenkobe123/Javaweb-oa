package cn.sjzc.edu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.sjzc.edu.mapper.RecordMapper;
import cn.sjzc.edu.po.PageBean;
import cn.sjzc.edu.po.Record;
import cn.sjzc.edu.service.RecordService;

@Service
public class RecordServiceImpl implements RecordService {
	@Autowired
	private RecordMapper RecordMapper;

	@Override
	public PageBean findWithPage(int curPage, int pageSize) {

		// 查询总记录数
		int totalRecords = RecordMapper.findTotalRecords();

		// 创建分页数据模型对象
		PageBean PageBean = new PageBean(curPage, pageSize, totalRecords);

		List<Record> list = RecordMapper.pageList(PageBean.getStartIndex(), PageBean.getPageSize());
		// 填充分页数据到数据集合
		PageBean.setList(list);

		// 返回模型对象
		return PageBean;

	}

	@Override
	public void add(Record Record) {

		RecordMapper.add(Record);
	}

	@Override
	public void delete(int id) {

		RecordMapper.delete(id);
	}




}
