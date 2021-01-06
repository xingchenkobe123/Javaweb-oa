package cn.sjzc.edu.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.sjzc.edu.po.PageBean;
import cn.sjzc.edu.po.Worker;
import cn.sjzc.edu.po.Worker;
import cn.sjzc.edu.service.WorkerService;

@Controller
public class WorkerController {
	@Autowired
	private WorkerService WorkerService;

	// 前台业务

	// 登录验证--用户名
	@RequestMapping("w_findByPhone")
	public void w_findByName(String phone, HttpServletResponse response) throws Exception {

		 Worker Worker = WorkerService.findByPhone(phone);
		if (Worker == null) {

			response.getWriter().print("-1");
			return;
		} else {

			response.getWriter().print("1");
		}
	}

	// 员工详细信息
	@RequestMapping("info_findByPhone")
	public String info_findByPhone(String phone, Model model) throws Exception {
		
		

		Worker Worker = WorkerService.findByPhone(phone);
		if (Worker != null) {

			model.addAttribute("Worker", Worker);
			return "jsp/show_schema_info.jsp";
		}

		return null;
	}

	// 登录验证--用户名+密码
	@RequestMapping("workerLogin")
	public void workerLogin(Worker Worker, HttpServletResponse response, HttpSession session) throws Exception {

		Worker login = WorkerService.login(Worker);
		if (login == null) {
			response.getWriter().print("-1");
			return;
		} else {
			session.setAttribute("loginWorker", login);
			response.getWriter().print("1");
		}

	}

	// 公司结构
	@RequestMapping("show_list")
	public String show_list(Model model, String curPage, String branch, String group) throws Exception {

		int CurPage = Integer.parseInt(curPage);

		PageBean pageBean = WorkerService.findWithPage_schema(new String(branch.getBytes("ISO-8859-1"), "UTF-8"), group,
				CurPage, 3);

		model.addAttribute("pageBean", pageBean);

		model.addAttribute("branch", new String(branch.getBytes("ISO-8859-1"), "UTF-8"));
		model.addAttribute("group", group);

		return "jsp/show_schema_list.jsp";

	}

	@RequestMapping("loginOut")
	public void loginOut(HttpServletResponse response, HttpSession session) throws Exception {
		session.invalidate();
		response.sendRedirect("index.jsp");
	}

	// 修改个人信息_pwd
	@RequestMapping("edit_pwd")
	public String edit_pwd(Worker worker) {

		WorkerService.edit_pwd(worker);
		return "loginOut.action";
	}

	// 修改个人信息_phone
	@RequestMapping("edit_phone")
	public String edit_phone(Worker worker, Model model) {

		WorkerService.edit_phone(worker);
		return "loginOut.action";

	}
	@RequestMapping("findApprover")
	public void findApprover(Worker worker, HttpServletResponse response) throws IOException {
		
		
		String name = WorkerService.findApprover(worker);
		
			response.getWriter().println(name);
		
		
	}

	// 后台业务

	// 分页查询职员信息
	@RequestMapping("findWithPage_worker")
	public String findWithPage_worker(Model model, String curPage) {

		int CurPage = Integer.parseInt(curPage);

		PageBean pageBean = WorkerService.findWithPage(CurPage, 4);

		model.addAttribute("pageBean", pageBean);

		return "admin/find_worker.jsp";

	}

	// 分页查询职员信息_权限
	@RequestMapping("findWithPage_worker_private")
	public String findWithPage_worker_private(Model model, String curPage) {

		int CurPage = Integer.parseInt(curPage);

		PageBean pageBean = WorkerService.findWithPage(CurPage, 3);

		model.addAttribute("pageBean", pageBean);

		List<Worker> list = pageBean.getList();
		model.addAttribute("list", list);

		return "admin/private.jsp";

	}

	// 添加职员
	@RequestMapping("add_worker")
	public String add_worker(Worker worker) {

		WorkerService.add(worker);

		return "findWithPage_worker.action?curPage=1";

	}

	// 删除职员
	@RequestMapping("delete_worker")
	public String delete_worker(int id) {

		WorkerService.delete(id);

		return "findWithPage_worker.action?curPage=1";

	}

	// 查询职员详细信息
	@RequestMapping("findById_worker")
	public String findById_worker(int id, Model model) {

		Worker worker = WorkerService.findById(id);

		model.addAttribute("worker", worker);

		return "admin/edit_worker.jsp";

	}

	// 修改职员信息
	@RequestMapping("edit_worker")
	public String edit_worker(Worker worker, Model model) {

		WorkerService.edit(worker);
		return "redirect:findWithPage_worker.action?curPage=1";

	}

	// 修改职员信息_lv
	@RequestMapping("edit_worker_private")
	public void edit_worker_private(Worker worker, HttpServletResponse res) throws IOException {

		WorkerService.edit_lv(worker);
		res.getWriter().println("1");
	}
	
//	// 模糊查询
//	@RequestMapping("likeSearch")
//	public void likeSearch(String name, HttpServletResponse res) throws IOException {
//		
//		//WorkerService.edit_lv(worker);
//		res.getWriter().println("ok");
//	}

}
