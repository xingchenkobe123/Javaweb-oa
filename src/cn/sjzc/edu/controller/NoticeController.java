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

	// 分页查询公告信息--前台
		@RequestMapping("findWithPage_notice_show")
		public String findWithPage_notice_show(Model model, String curPage) {

			int CurPage = Integer.parseInt(curPage);

			PageBean pageBean = NoticeService.findWithPage(CurPage, 3);

			model.addAttribute("pageBean", pageBean);

			return "jsp/show_notice.jsp";

		}
		
		// 分页查询公告信息--后台
		@RequestMapping("findWithPage_notice")
		public String findWithPage_notice(Model model, String curPage) {

			int CurPage = Integer.parseInt(curPage);

			PageBean pageBean = NoticeService.findWithPage(CurPage, 3);

			model.addAttribute("pageBean", pageBean);

			return "admin/find_notice.jsp";

		}

	// 添加公告
	@RequestMapping("add_notice")
	public String add_notice(Notice notice) {

		NoticeService.add(notice);

		return "findWithPage_notice.action?curPage=1";

	}

	// 删除公告
	@RequestMapping("delete_notice")
	public String delete_notice(int id) {

		NoticeService.delete(id);

		return "findWithPage_notice.action?curPage=1";

	}

	// 查询公告详细信息
	@RequestMapping("findById_notice")
	public String findById_notice(int id, Model model) {

		Notice notice = NoticeService.findById(id);

		model.addAttribute("notice", notice);

		return "admin/edit_notice.jsp";

	}

	// 查询公告详细信息__xhr---拉取内容
	@RequestMapping("findById_notice_xhr")
	public void findById_notice_xhr(int id, HttpServletResponse res) throws IOException {
		
		res.setContentType("text/html;charset=utf8");

		Notice notice = NoticeService.findById(id);

		res.getWriter().println(notice.getContent());

	}

	// 修改公告信息
	@RequestMapping("edit_notice")
	public String edit_notice(Notice notice, Model model) {

		NoticeService.edit(notice);
		return "redirect:findWithPage_notice.action?curPage=1";

	}

}
