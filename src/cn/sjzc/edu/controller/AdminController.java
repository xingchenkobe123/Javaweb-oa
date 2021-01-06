package cn.sjzc.edu.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.sjzc.edu.po.Admin;
import cn.sjzc.edu.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;

	//后台--根据用户名查询-用于管理员头像异步显示
	@RequestMapping("findByAccount")
	public void findByAccount(String account, HttpServletResponse response) throws Exception {

		String pic = adminService.findByAccount(account);
		if (pic == null) {

			response.getWriter().print("-1");
			return;
		} else {
			response.getWriter().print(pic);
		}
	}
	
//管理员登陆检测
	@RequestMapping("adminLogin")
	public void adminLogin(Admin admin, HttpServletResponse response,HttpSession session) throws Exception {

		Admin login = adminService.login(admin);
		if (login == null) {
			response.getWriter().print("-1");
			return;
		} else {
			session.setAttribute("loginAdmin", login);
			response.getWriter().print("1");
		}

	}
	//退出登录
	@RequestMapping("adminLoginOut")
	public void loginOut(HttpServletResponse response, HttpSession session) throws Exception {
		session.invalidate();
		response.sendRedirect("admin/login.jsp");
	}
}
