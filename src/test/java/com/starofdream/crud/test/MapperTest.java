package com.starofdream.crud.test;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;

import com.starofdream.crud.bean.Department;
import com.starofdream.crud.dao.DepartmentMapper;

@ContextConfiguration
public class MapperTest {
	@Autowired
	DepartmentMapper departmentMapper;
	@Test
	public void testCRUD() {
		departmentMapper.insertSelective(new Department(null, "开发部"));
		departmentMapper.insertSelective(new Department(null, "测试部"));
	}
}
