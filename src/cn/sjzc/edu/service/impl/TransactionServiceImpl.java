package cn.sjzc.edu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.sjzc.edu.mapper.TransactionMapper;
import cn.sjzc.edu.po.PageBean;
import cn.sjzc.edu.po.Transaction;
import cn.sjzc.edu.service.TransactionService;

@Service
public class TransactionServiceImpl implements TransactionService {
	@Autowired
	private TransactionMapper TransactionMapper;

	@Override
	public PageBean findWithPage(int curPage, int pageSize) {

		// ��ѯ�ܼ�¼��
		int totalRecords = TransactionMapper.findTotalRecords();

		// ������ҳ����ģ�Ͷ���
		PageBean PageBean = new PageBean(curPage, pageSize, totalRecords);

		List<Transaction> list = TransactionMapper.pageList(PageBean.getStartIndex(), PageBean.getPageSize());
		// ����ҳ���ݵ����ݼ���
		PageBean.setList(list);

		// ����ģ�Ͷ���
		return PageBean;

	}

	@Override
	public void add(Transaction Transaction) {

		TransactionMapper.add(Transaction);
	}

	@Override
	public void delete(int id) {

		TransactionMapper.delete(id);
	}

	@Override
	public void edit(Transaction Transaction) {
		
		TransactionMapper.edit(Transaction);
	}

	@Override
	public PageBean findWithPage_name(String name, int curPage, int pageSize) {
		
		// ��ѯ�ܼ�¼��
				int totalRecords = TransactionMapper.findTotalRecords_name(name);

				// ������ҳ����ģ�Ͷ���
				PageBean PageBean = new PageBean(curPage, pageSize, totalRecords,name);

				List<Transaction> list = TransactionMapper.pageList_name(name,PageBean.getStartIndex(), PageBean.getPageSize());
				// ����ҳ���ݵ����ݼ���
				PageBean.setList(list);

				// ����ģ�Ͷ���
				return PageBean;
	}

	@Override
	public PageBean findMyTransaction(String approver, int curPage, int pageSize) {
		
		int totalRecords = TransactionMapper.findTotalRecords_approver(approver);

		// ������ҳ����ģ�Ͷ���
		PageBean PageBean = new PageBean(curPage, pageSize, totalRecords,approver);

		List<Transaction> list = TransactionMapper.findMyTransaction(approver,PageBean.getStartIndex(), PageBean.getPageSize());
		// ����ҳ���ݵ����ݼ���
		PageBean.setList(list);

		// ����ģ�Ͷ���
		return PageBean;
	}

}
