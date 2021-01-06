package cn.sjzc.edu.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.sjzc.edu.po.Metting;
import cn.sjzc.edu.po.PageBean;
import cn.sjzc.edu.service.MettingService;

@Controller
public class MettingController extends HttpServlet {
	@Autowired
	private MettingService MettingService;

	// 分页查询会议纪要--后台-- 前台--个人
	@RequestMapping("own_findWithPage_metting")
	public String own_findWithPage_metting(Model model, String curPage,String name) throws UnsupportedEncodingException {

		int CurPage = Integer.parseInt(curPage);

		
		PageBean pageBean = MettingService.own_findWithPage(new String(name.getBytes("ISO-8859-1"),"UTF-8"),CurPage, 2);

		model.addAttribute("pageBean", pageBean);

		return "jsp/show_metting_log.jsp";

	}
	// 分页查询会议纪要--后台
	@RequestMapping("findWithPage_metting")
	public String findWithPage_metting(Model model, String curPage) {
		
		int CurPage = Integer.parseInt(curPage);
		
		PageBean pageBean = MettingService.findWithPage(CurPage, 3);
		
		model.addAttribute("pageBean", pageBean);
		
		return "admin/metting.jsp";
		
	}

	// 添加会议纪要
	@RequestMapping("add_metting")
	public String add_metting(Metting Metting) {
		
		

		MettingService.add(Metting);

		return "redirect:/jsp/write_metting_log.jsp";

	}

	// 删除会议纪要
	@RequestMapping("delete_metting")
	public String delete_metting(int id) {

		MettingService.delete(id);

		return "findWithPage_metting.action?curPage=1";

	}

}
