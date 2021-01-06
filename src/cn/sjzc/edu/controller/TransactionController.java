package cn.sjzc.edu.controller;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.sjzc.edu.po.PageBean;
import cn.sjzc.edu.po.Transaction;
import cn.sjzc.edu.po.Worker;
import cn.sjzc.edu.service.TransactionService;

@Controller
public class TransactionController extends HttpServlet {
	@Autowired
	private TransactionService TransactionService;

	// 分页查询事务信息--前台个人
	@RequestMapping("findWithPage_transaction_name")
	public String findWithPage_transaction_name(Model model, String curPage,String name) throws Exception {

		int CurPage = Integer.parseInt(curPage);

		PageBean pageBean = TransactionService.findWithPage_name(new String(name.getBytes("ISO-8859-1"), "UTF-8"),CurPage, 2);

		model.addAttribute("pageBean", pageBean);

		return "jsp/show_transaction.jsp";

	}
	@RequestMapping("findMyTransaction")
	public String findMyTransaction(Model model, String curPage,String approver) throws Exception {
		
		int CurPage = Integer.parseInt(curPage);
		
		PageBean pageBean = TransactionService.findMyTransaction(new String(approver.getBytes("ISO-8859-1"), "UTF-8"),CurPage, 2);
		
		model.addAttribute("pageBean", pageBean);
		
		return "jsp/show_transaction2.jsp";
		
	}
	
	// 分页查询事务信息--后台
	@RequestMapping("findWithPage_transaction")
	public String findWithPage_transaction(Model model, String curPage) {
		
		int CurPage = Integer.parseInt(curPage);
		
		PageBean pageBean = TransactionService.findWithPage(CurPage, 3);
		
		model.addAttribute("pageBean", pageBean);
//		List<Transaction> list=pageBean.getList();
//		for (Transaction transaction : list) {
//			System.out.println(list);
//		}
		
		return "admin/tr.jsp";
		
	}

	// 添加事务信息
	@RequestMapping("add_transaction")
	public String add_transaction(Transaction Transaction) {

		TransactionService.add(Transaction);

		return "findWithPage_transaction.action?curPage=1";

	}
	// 添加事务信息--前台
	@RequestMapping("add_transaction_show")
	public String add_transaction_show(Transaction Transaction) {
		
		TransactionService.add(Transaction);
		
		return "index.jsp";
	}

	// 删除事务信息
	@RequestMapping("delete_transaction")
	public String delete_transaction(int id) {

		TransactionService.delete(id);

		return "findWithPage_transaction.action?curPage=1";

	}
	
	// 编辑事务信息
	@RequestMapping("edit_transaction")
	public void edit_transaction(Transaction transaction,HttpServletResponse res) throws IOException {
		
		TransactionService.edit(transaction);
		res.getWriter().println(1);
	
		
	}

}
