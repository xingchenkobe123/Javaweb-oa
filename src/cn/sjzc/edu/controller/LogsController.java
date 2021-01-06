package cn.sjzc.edu.controller;

import java.io.UnsupportedEncodingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.sjzc.edu.po.Logs;
import cn.sjzc.edu.po.PageBean;
import cn.sjzc.edu.service.LogsService;

@Controller
public class LogsController {
	@Autowired
	private LogsService LogsService;

	//��ҳ��ѯ��־��Ϣ--ǰ̨--����
	@RequestMapping("own_findWithPage_logs")
	public String own_findWithPage_logs(Model model, String curPage,String name) throws UnsupportedEncodingException {

		
		int CurPage = Integer.parseInt(curPage);

		PageBean  pageBean = LogsService.own_findWithPage(new String(name.getBytes("ISO-8859-1"),"UTF-8"),CurPage, 2);
		
		model.addAttribute("pageBean", pageBean);

		return "jsp/show_my_log.jsp";

	}
	
	//��ҳ��ѯ��־��Ϣ--ǰ̨--С��
	@RequestMapping("group_findWithPage_logs")
	public String group_findWithPage_logs(Model model, String curPage,String type,String branch,String group) throws UnsupportedEncodingException {
		
		int CurPage = Integer.parseInt(curPage);
		
		PageBean  pageBean = LogsService.group_findWithPage(type,new String(branch.getBytes("ISO-8859-1"),"UTF-8"),group,CurPage, 2);
		
		model.addAttribute("pageBean", pageBean);
		
		return "jsp/show_group_log.jsp";
		
	}
	
	//��ҳ��ѯ��־��Ϣ--��̨
	@RequestMapping("findWithPage_logs")
	public String findWithPage_logs(Model model, String curPage,String type) {
		
		String path=null;
		int CurPage = Integer.parseInt(curPage);
		
		PageBean pageBean = LogsService.findWithPage(type,CurPage, 2);
		
		model.addAttribute("pageBean", pageBean);
//		 1--�ձ�--��ְͨԱ,2--�ܱ�--С�鳤,3--�±�--��������  4--С����־--С�鳤
		switch (type) {
		case "1"://�ձ�
			path="admin/day_log.jsp";
			break;
		case "2"://�ܱ�
			path="admin/week_log.jsp";
			break;
		case "3"://�±�
			path="admin/month_log.jsp";
			break;
//		case "4"://С����־
//			path="admin/group_log.jsp";
//			break;
			
		}
		
		return path;
		
	}

	//�����־
	@RequestMapping("add_logs")
	public String add_logs(Logs Logs) {

		LogsService.add(Logs);

		return "redirect:/jsp/write_mylog.jsp";

	}

	//ɾ����־
	@RequestMapping("delete_logs")
	public String delete_logs(int id) {
		
		LogsService.delete(id);
		
		return "findWithPage_logs.action?curPage=1";
		
	}
	



}
