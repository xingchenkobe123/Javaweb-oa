package cn.sjzc.edu.service;

import cn.sjzc.edu.po.Record;
import cn.sjzc.edu.po.PageBean;

public interface RecordService {

	PageBean findWithPage(int curPage, int pageSize);

	public void add(Record Record);

	public void delete(int id);



}
