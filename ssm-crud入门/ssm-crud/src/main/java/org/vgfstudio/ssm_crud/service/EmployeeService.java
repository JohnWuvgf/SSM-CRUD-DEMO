package org.vgfstudio.ssm_crud.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.vgfstudio.ssm_crud.bean.Employee;
import org.vgfstudio.ssm_crud.bean.EmployeeExample;
import org.vgfstudio.ssm_crud.dao.EmployeeMapper;

import java.util.List;

@Service
public class EmployeeService {

    @Autowired
    EmployeeMapper employeeMapper;

    /**
     * 返回所有员工
     * @return
     */
    public List<Employee> getAll() {
        return employeeMapper.selectByExampleWithDept(null);

    }

    /**
     * 查询是否存在改名称的员工
     * @param empName
     * @return
     */
    public boolean getEmployeebyName(String empName) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria =  example.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        long countNum =  employeeMapper.countByExample(example);
        if(countNum==0){
            return true;
        }else {
            return false;
        }
    }

    public String  addEmployee(Employee employee) {
        int result = employeeMapper.insert(employee);
//        System.out.println(result);
//        if(result == -2147482646){
//            return "success";
//        }else {
//            return "fail";
//        }
        return "success";
    }

    /**
     * 珊瑚单个员工,批量删除
     * @param id
     */
    public void deleteEmp(Integer id) {
        employeeMapper.deleteByPrimaryKey(id);
    }

    public void deleteBatch(List<Integer> ids) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpIdIn(ids);
//        delete form tbl_emp where emp_id in ();
        employeeMapper.deleteByExample(example);
    }

    /**
     * a按照id查询员工
     * @param id
     * @return
     */
    public Employee getEmp(Integer id) {

        Employee employee =  employeeMapper.selectByPrimaryKey(id);

        return employee;
    }

    /**
     * 更新员工信息
     *
     * @param employee
     */
    public void updateEmp(Employee employee) {
        // TODO Auto-generated method stub
        employeeMapper.updateByPrimaryKeySelective(employee);
    }
}
