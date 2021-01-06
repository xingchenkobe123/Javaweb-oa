package cn.sjzc.edu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.sjzc.edu.mapper.MettingMapper;
import cn.sjzc.edu.po.Metting;
import cn.sjzc.edu.po.PageBean;
import cn.sjzc.edu.service.MettingService;

@Service
public class MettingServiceImpl implements MettingService {
	@Autowired
	private MettingMapper MettingMapper;

	@Override
	public PageBean findWithPage(int curPage, int pageSize) {

		// ��ѯ�ܼ�¼��
		int totalRecords = MettingMapper.findTotalRecords();

		// ������ҳ����ģ�Ͷ���
		PageBean PageBean = new PageBean(curPage, pageSize, totalRecords);

		List<Metting> list = MettingMapper.pageList(PageBean.getStartIndex(), PageBean.getPageSize());
		// ����ҳ���ݵ����ݼ���
		PageBean.setList(list);

		// ����ģ�Ͷ���
		return PageBean;

	}

	@Override
	public void add(Metting Metting) {

		MettingMapper.add(Metting);
	}

	@Override
	public void delete(int id) {

		MettingMapper.delete(id);
	}

	@Override
	public PageBean own_findWithPage(String name, int curPage, int pageSize) {
		

		// ��ѯ�ܼ�¼��
		int totalRecords = MettingMapper.findTotalRecords_name(name);

		// ������ҳ����ģ�Ͷ���
		PageBean PageBean = new PageBean(curPage, pageSize, totalRecords,name);

		List<Metting> list = MettingMapper.own_pageList(name,PageBean.getStartIndex(), PageBean.getPageSize());
		// ����ҳ���ݵ����ݼ���
		PageBean.setList(list);

		// ����ģ�Ͷ���
		return PageBean;
	}

}
