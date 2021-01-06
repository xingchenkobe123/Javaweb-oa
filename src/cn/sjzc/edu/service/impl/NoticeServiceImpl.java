package cn.sjzc.edu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.sjzc.edu.mapper.NoticeMapper;
import cn.sjzc.edu.po.Notice;
import cn.sjzc.edu.po.PageBean;
import cn.sjzc.edu.service.NoticeService;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeMapper NoticeMapper;

	@Override
	public PageBean findWithPage(int curPage, int pageSize) {

		// 查询总记录数
		int totalRecords = NoticeMapper.findTotalRecords();

		// 创建分页数据模型对象
		PageBean PageBean = new PageBean(curPage, pageSize, totalRecords);

		List<Notice> list = NoticeMapper.pageList(PageBean.getStartIndex(), PageBean.getPageSize());
		// 填充分页数据到数据集合
		PageBean.setList(list);

		// 返回模型对象
		return PageBean;

	}

	@Override
	public void add(Notice Notice) {

		NoticeMapper.add(Notice);
	}

	@Override
	public void delete(int id) {

		NoticeMapper.delete(id);
	}

	@Override
	public Notice findById(int id) {

		return NoticeMapper.findById(id);
	}

	@Override
	public void edit(Notice Notice) {
		NoticeMapper.edit(Notice);

	}

}
