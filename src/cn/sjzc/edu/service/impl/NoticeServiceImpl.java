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

		// ��ѯ�ܼ�¼��
		int totalRecords = NoticeMapper.findTotalRecords();

		// ������ҳ����ģ�Ͷ���
		PageBean PageBean = new PageBean(curPage, pageSize, totalRecords);

		List<Notice> list = NoticeMapper.pageList(PageBean.getStartIndex(), PageBean.getPageSize());
		// ����ҳ���ݵ����ݼ���
		PageBean.setList(list);

		// ����ģ�Ͷ���
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
