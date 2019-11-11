package com.starofdream.crud.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.starofdream.crud.bean.Employee;
import com.starofdream.crud.bean.Msg;
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
	 * 检查用户名是否可用
	 * 为支持JSR-303校验，导入Hibernate-Validator
	 * @param empName
	 * @return
	 */
	@RequestMapping("/checkuser")
	@ResponseBody
	public Msg checkUser(@RequestParam("empName") String empName) {
		//判断姓名是否是合法的表达式
		String regex = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
		if (!empName.matches(regex)) {
			return Msg.fail().add("va_msg", "用户名可以是2-5位中文或者是6-16位英文和数字的组合");
		}
		//数据库重复校验
		boolean b = employeeService.checkUser(empName);
		if (b) {
			return Msg.success();
		}else {
			return Msg.fail().add("va_msg", "用户名不可用！");
		}
	}
	
	/**
	 * 员工信息保存
	 * @return
	 */
	@RequestMapping(value = "/emp", method = RequestMethod.POST)
	@ResponseBody
	public Msg saveEmp(@Valid Employee employee, BindingResult result) {
		if (result.hasErrors()) {
			Map<String, Object> map = new HashMap<String, Object>();
			List<FieldError> errors = result.getFieldErrors();
			for (FieldError fieldError : errors) {
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.fail().add("errorFields", map);
		} else {
			employeeService.saveEmp(employee);
			return Msg.success();
		}
	}
	/**
	 * 为使@ResponseBody正常工作，需要导入jackson包
	 * @param pn
	 * @return
	 */
	@RequestMapping("/emps")
	@ResponseBody
	public Msg getEmpsWithJason(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		PageHelper.startPage(pn, 5);
		List<Employee> emps = employeeService.getAll();
		PageInfo pageInfo = new PageInfo(emps, 5);
		return Msg.success().add("pageInfo", pageInfo);
	}
	/**
	 * 查询员工数据（分页查询）
	 * @return
	 */
//	@RequestMapping("/emps")
//	public String getEmps(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
//		//引入pageHelper分页插件，调用pagehelper方法
//		PageHelper.startPage(pn, 5);
//		List<Employee> emps = employeeService.getAll();
//		PageInfo page = new PageInfo(emps, 5);
//		model.addAttribute("pageInfo", page);
//		return "list";
//	}
}