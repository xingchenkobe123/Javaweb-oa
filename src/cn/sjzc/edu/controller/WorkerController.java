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

	// ǰ̨ҵ��

	// ��¼��֤--�û���
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

	// Ա����ϸ��Ϣ
	@RequestMapping("info_findByPhone")
	public String info_findByPhone(String phone, Model model) throws Exception {
		
		

		Worker Worker = WorkerService.findByPhone(phone);
		if (Worker != null) {

			model.addAttribute("Worker", Worker);
			return "jsp/show_schema_info.jsp";
		}

		return null;
	}

	// ��¼��֤--�û���+����
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

	// ��˾�ṹ
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

	// �޸ĸ�����Ϣ_pwd
	@RequestMapping("edit_pwd")
	public String edit_pwd(Worker worker) {

		WorkerService.edit_pwd(worker);
		return "loginOut.action";
	}

	// �޸ĸ�����Ϣ_phone
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

	// ��̨ҵ��

	// ��ҳ��ѯְԱ��Ϣ
	@RequestMapping("findWithPage_worker")
	public String findWithPage_worker(Model model, String curPage) {

		int CurPage = Integer.parseInt(curPage);

		PageBean pageBean = WorkerService.findWithPage(CurPage, 4);

		model.addAttribute("pageBean", pageBean);

		return "admin/find_worker.jsp";

	}

	// ��ҳ��ѯְԱ��Ϣ_Ȩ��
	@RequestMapping("findWithPage_worker_private")
	public String findWithPage_worker_private(Model model, String curPage) {

		int CurPage = Integer.parseInt(curPage);

		PageBean pageBean = WorkerService.findWithPage(CurPage, 3);

		model.addAttribute("pageBean", pageBean);

		List<Worker> list = pageBean.getList();
		model.addAttribute("list", list);

		return "admin/private.jsp";

	}

	// ���ְԱ
	@RequestMapping("add_worker")
	public String add_worker(Worker worker) {

		WorkerService.add(worker);

		return "findWithPage_worker.action?curPage=1";

	}

	// ɾ��ְԱ
	@RequestMapping("delete_worker")
	public String delete_worker(int id) {

		WorkerService.delete(id);

		return "findWithPage_worker.action?curPage=1";

	}

	// ��ѯְԱ��ϸ��Ϣ
	@RequestMapping("findById_worker")
	public String findById_worker(int id, Model model) {

		Worker worker = WorkerService.findById(id);

		model.addAttribute("worker", worker);

		return "admin/edit_worker.jsp";

	}

	// �޸�ְԱ��Ϣ
	@RequestMapping("edit_worker")
	public String edit_worker(Worker worker, Model model) {

		WorkerService.edit(worker);
		return "redirect:findWithPage_worker.action?curPage=1";

	}

	// �޸�ְԱ��Ϣ_lv
	@RequestMapping("edit_worker_private")
	public void edit_worker_private(Worker worker, HttpServletResponse res) throws IOException {

		WorkerService.edit_lv(worker);
		res.getWriter().println("1");
	}
	
//	// ģ����ѯ
//	@RequestMapping("likeSearch")
//	public void likeSearch(String name, HttpServletResponse res) throws IOException {
//		
//		//WorkerService.edit_lv(worker);
//		res.getWriter().println("ok");
//	}

}
