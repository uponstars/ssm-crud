package com.starofdream.crud.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.starofdream.crud.bean.Employee;
import com.starofdream.crud.service.EmployeeService;

/**
 * 处理员工CRUD请求
 * @author 17465
 *
 */
@Controller
public class EmployeeController {
	@Autowired
	EmployeeService employeeService;
	
	/**
	 * 为使@ResponseBody正常工作，需要导入jackson包
	 * @param pn
	 * @return
	 */
	@RequestMapping("/emps")
	@ResponseBody
	public PageInfo getEmpsWithJason(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		PageHelper.startPage(pn, 5);
		List<Employee> emps = employeeService.getAll();
		return new PageInfo(emps, 5);
	}
	/**
	 * 查询员工数据（分页查询）
	 * @return
	 */
//	@RequestMapping("/emps")
	public String getEmps(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
		//引入pageHelper分页插件，调用pagehelper方法
		PageHelper.startPage(pn, 5);
		List<Employee> emps = employeeService.getAll();
		PageInfo page = new PageInfo(emps, 5);
		model.addAttribute("pageInfo", page);
		return "list";
	}
}