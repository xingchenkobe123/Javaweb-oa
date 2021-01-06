package cn.sjzc.edu.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.sjzc.edu.po.PageBean;
import cn.sjzc.edu.po.Record;
import cn.sjzc.edu.service.RecordService;

@Controller
public class RecordController {
	@Autowired
	private RecordService RecordService;

	// ��ҳ��ѯ���ڼ�¼��Ϣ
	@RequestMapping("findWithPage_record")
	public String findWithPage_record(Model model, String curPage) {

		int CurPage = Integer.parseInt(curPage);

		PageBean pageBean = RecordService.findWithPage(CurPage, 3);

		model.addAttribute("pageBean", pageBean);

		return "admin/record.jsp";

	}

	// ��ӿ��ڼ�¼
	@RequestMapping("add_record")
	public void add_record(Record Record,HttpServletResponse res) throws IOException {

		RecordService.add(Record);

		res.getWriter().println("1");

	}

	// ɾ�����ڼ�¼
	@RequestMapping("delete_record")
	public String delete_record(int id) {

		RecordService.delete(id);

		return "findWithPage_record.action?curPage=1";

	}

}
