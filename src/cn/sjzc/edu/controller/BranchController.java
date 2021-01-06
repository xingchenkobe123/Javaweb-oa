package cn.sjzc.edu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.sjzc.edu.po.Branch;
import cn.sjzc.edu.po.PageBean;
import cn.sjzc.edu.service.BranchService;

@Controller
public class BranchController {
	@Autowired
	private BranchService BranchService;
	
	//��ѯ���в���--ǰ̨
		@RequestMapping("findAll_branch")
		public String findAll_branch(Model model ) {
			
			List<Branch> list = BranchService.findAll();
			model.addAttribute("list", list);
			
			return "jsp/show_schema.jsp";
			
		}

	//��ҳ��ѯ������Ϣ--��̨
	@RequestMapping("findWithPage_branch")
	public String findWithPage_branch(Model model, String curPage) {

		int CurPage = Integer.parseInt(curPage);

		PageBean pageBean = BranchService.findWithPage(CurPage, 3);

		model.addAttribute("pageBean", pageBean);

		return "admin/find_branch.jsp";

	}

	//��Ӳ���--��̨
	@RequestMapping("add_branch")
	public String add_branch(Branch Branch) {

		BranchService.add(Branch);

		return "findWithPage_branch.action?curPage=1";

	}
	
	
	

	//��ѯ������ϸ��Ϣ--��̨
	@RequestMapping("findById_branch")
	public String findById_branch(int  id,Model model) {
		
		Branch Branch = BranchService.findById(id);
		
		model.addAttribute("branch", Branch);
		
		return "admin/edit_branch.jsp";
		
	}

	//ɾ������--��̨
	@RequestMapping("delete_branch")
	public String delete_branch(int id) {
		
		BranchService.delete(id);
		
		return "findWithPage_branch.action?curPage=1";
		
	}
	

	//�޸Ĳ�����Ϣ--��̨
	@RequestMapping("edit_branch")
	public String edit_branch(Branch Branch,Model model) {
		
		 BranchService.edit(Branch);
		 return "redirect:findWithPage_branch.action?curPage=1";
		
	}

}
