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

		// 查询总记录数
		int totalRecords = BranchMapper.findTotalRecords();

		// 创建分页数据模型对象
		PageBean PageBean = new PageBean(curPage, pageSize, totalRecords);

		List<Branch> list = BranchMapper.pageList(PageBean.getStartIndex(), PageBean.getPageSize());
		// 填充分页数据到数据集合
		PageBean.setList(list);

		// 返回模型对象
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
