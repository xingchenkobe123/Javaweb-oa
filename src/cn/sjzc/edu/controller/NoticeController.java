package cn.sjzc.edu.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.sjzc.edu.po.Notice;
import cn.sjzc.edu.po.PageBean;
import cn.sjzc.edu.service.NoticeService;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService NoticeService;

	// ��ҳ��ѯ������Ϣ--ǰ̨
		@RequestMapping("findWithPage_notice_show")
		public String findWithPage_notice_show(Model model, String curPage) {

			int CurPage = Integer.parseInt(curPage);

			PageBean pageBean = NoticeService.findWithPage(CurPage, 3);

			model.addAttribute("pageBean", pageBean);

			return "jsp/show_notice.jsp";

		}
		
		// ��ҳ��ѯ������Ϣ--��̨
		@RequestMapping("findWithPage_notice")
		public String findWithPage_notice(Model model, String curPage) {

			int CurPage = Integer.parseInt(curPage);

			PageBean pageBean = NoticeService.findWithPage(CurPage, 3);

			model.addAttribute("pageBean", pageBean);

			return "admin/find_notice.jsp";

		}

	// ��ӹ���
	@RequestMapping("add_notice")
	public String add_notice(Notice notice) {

		NoticeService.add(notice);

		return "findWithPage_notice.action?curPage=1";

	}

	// ɾ������
	@RequestMapping("delete_notice")
	public String delete_notice(int id) {

		NoticeService.delete(id);

		return "findWithPage_notice.action?curPage=1";

	}

	// ��ѯ������ϸ��Ϣ
	@RequestMapping("findById_notice")
	public String findById_notice(int id, Model model) {

		Notice notice = NoticeService.findById(id);

		model.addAttribute("notice", notice);

		return "admin/edit_notice.jsp";

	}

	// ��ѯ������ϸ��Ϣ__xhr---��ȡ����
	@RequestMapping("findById_notice_xhr")
	public void findById_notice_xhr(int id, HttpServletResponse res) throws IOException {
		
		res.setContentType("text/html;charset=utf8");

		Notice notice = NoticeService.findById(id);

		res.getWriter().println(notice.getContent());

	}

	// �޸Ĺ�����Ϣ
	@RequestMapping("edit_notice")
	public String edit_notice(Notice notice, Model model) {

		NoticeService.edit(notice);
		return "redirect:findWithPage_notice.action?curPage=1";

	}

}
