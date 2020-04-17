package org.vgfstudio.ssm_crud.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.vgfstudio.ssm_crud.bean.Department;
import org.vgfstudio.ssm_crud.bean.Employee;
import org.vgfstudio.ssm_crud.bean.EmployeeExample;
import org.vgfstudio.ssm_crud.dao.DepartmentMapper;
import org.vgfstudio.ssm_crud.dao.EmployeeMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {
    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    EmployeeMapper employeeMapper;
    @Test
    public void selectTest() {
        Department department = departmentMapper.selectByPrimaryKey(1);
        System.out.println(department.getDeptName());
    }
    @Test
    public void select2Test() {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpNameEqualTo("发发");
        long nums = employeeMapper.countByExample(example);
        System.out.println(nums);
    }
    @Test
    public void select3Test() {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmailEqualTo("nm@zuoluwo.com");
        long nums = employeeMapper.countByExample(example);
        System.out.println(nums);
    }
    @Test
    public void insertTest() {
        Employee employee = new Employee();
        employee.setEmpName("张三");
        employee.setEmail("zs@zuoluwo.com");
        employee.setdId(1);
        employee.setGender("M");
        System.out.println(employeeMapper.insert(employee));
    }
}
