package com.starofdream.crud.test;

import static org.hamcrest.CoreMatchers.nullValue;

import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.starofdream.crud.bean.Department;
import com.starofdream.crud.bean.Employee;
import com.starofdream.crud.dao.DepartmentMapper;
import com.starofdream.crud.dao.EmployeeMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {
	@Autowired
	DepartmentMapper departmentMapper;
	
	@Autowired
	EmployeeMapper employeemapper;
	
	@Autowired
	SqlSession sqlSession;
	
	@Test
	public void testCRUD() {
		//测试部门插入
//		departmentMapper.insertSelective(new Department(null, "开发部"));
//		departmentMapper.insertSelective(new Department(null, "测试部"));
		//测试员工插入
//		employeemapper.insertSelective(new Employee(null, "Jerry", "M", "Jerry@starofdream.com", 1));
		//测试批量插入
		EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
		for (int i = 0; i < 1000; i++) {
			String uid = UUID.randomUUID().toString().substring(0, 5) + i;
			mapper.insertSelective(new Employee(null, uid, "M", uid + "@starofdream.com", 1));
		}
		System.out.println("批量完成！");
	}
}
