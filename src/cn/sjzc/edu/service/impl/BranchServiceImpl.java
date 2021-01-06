package cn.sjzc.edu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.sjzc.edu.mapper.BranchMapper;
import cn.sjzc.edu.po.Branch;
import cn.sjzc.edu.po.PageBean;
import cn.sjzc.edu.service.BranchService;

@Service
public class BranchServiceImpl implements BranchService {
	@Autowired
	private BranchMapper BranchMapper;

	@Override
	public PageBean findWithPage(int curPage, int pageSize) {

		// ��ѯ�ܼ�¼��
		int totalRecords = BranchMapper.findTotalRecords();

		// ������ҳ����ģ�Ͷ���
		PageBean PageBean = new PageBean(curPage, pageSize, totalRecords);

		List<Branch> list = BranchMapper.pageList(PageBean.getStartIndex(), PageBean.getPageSize());
		// ����ҳ���ݵ����ݼ���
		PageBean.setList(list);

		// ����ģ�Ͷ���
		return PageBean;

	}

	@Override
	public void add(Branch Branch) {

		BranchMapper.add(Branch);
	}

	@Override
	public void delete(int id) {

		BranchMapper.delete(id);
	}

	@Override
	public Branch findById(int id) {

		return BranchMapper.findById(id);
	}

	@Override
	public void edit(Branch Branch) {
		BranchMapper.edit(Branch);

	}

	@Override
	public List<Branch> findAll() {
		
		return BranchMapper.findAll();
	}

}
