package com.starofdream.crud.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	 * 查询员工数据（分页查询）
	 * @return
	 */
	@RequestMapping("/emps")
	public String getEmps() {
		List<Employee> emps = employeeService.getAll();
		return "list";
	}
}
