package org.vgfstudio.ssm_crud.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.vgfstudio.ssm_crud.bean.Employee;
import org.vgfstudio.ssm_crud.bean.Msg;
import org.vgfstudio.ssm_crud.service.EmployeeService;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class EmployeeController {

    @Autowired
    EmployeeService employeeService;

    /**
     * 查询所有员工
     * @param pn
     * @param
     * @return
     */
    @RequestMapping("/emps")
    @ResponseBody
    public Msg getEmps(@RequestParam(value = "pn", defaultValue = "1")Integer pn) {
        PageHelper.startPage(pn, 5);
        List<Employee> employeeList = employeeService.getAll();
        PageInfo pageInfo = new PageInfo(employeeList, 5);
        return Msg.success().add("pageInfo", pageInfo);
    }

    /**
     * 检验用户名是否存在
     * @param empName
     * @return
     */
    @RequestMapping("/check")
    @ResponseBody
    public Msg checkUser(@RequestParam(value = "empName")String empName) {

        String regx = "(^[a-zA-Z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{2,5})";
        if(!empName.matches(regx)) {
            return Msg.fail().add("va_msg", "用户名必须是3-16位数字和字母的组合或者2-5为中文！");
        }
        boolean isExist = employeeService.getEmployeebyName(empName);
        if(isExist) {
            return Msg.success().add("va_msg", "用户名可用!");
        }else {
            return Msg.fail().add("va_msg", "用户名已经被占用!");
        }

    }

    /**
     * 新增员工
     * @param employee
     * @param result
     * @return
     */
    @RequestMapping(value = "/emp", method= RequestMethod.POST)
    @ResponseBody
    public Msg addUser(@Valid Employee employee, BindingResult result) {
        if(result.hasErrors()) {
            Map<String, Object> map = new HashMap<String, Object>();
            List<FieldError> fieldErrorLis = result.getFieldErrors();
            for(FieldError fieldError : fieldErrorLis) {
                System.out.println("错误的字段名:" +fieldError.getField());
                System.out.println("错误信息:" +fieldError.getDefaultMessage());
                map.put(fieldError.getField(), fieldError.getDefaultMessage());
            }
            return Msg.fail().add("fieldError", map);
        }else {
            employeeService.addEmployee(employee);
            return Msg.success();




        }
    }

    /**
     * 删除单个员工,批量删除
     * @param
     * @return
     */
    @RequestMapping(value="/emp/{ids}", method=RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteEmp(@PathVariable("ids")String ids){
        if (ids.contains("-")) {
            List<Integer> list = new ArrayList<>();
            String[] str_ids = ids.split("-");
            for (String string : str_ids){
                list.add(Integer.parseInt(string));
            }
            employeeService.deleteBatch(list);

        }else {
            Integer id = Integer.parseInt(ids);
            employeeService.deleteEmp(id);
        }
        return Msg.success();

    }

    /**
     * 获取emp信息
     * @param id
     * @return
     */
    @RequestMapping(value="/emp/{id}", method=RequestMethod.GET)
    @ResponseBody
    public Msg getEmp(@PathVariable("id")Integer id){

        Employee employee = employeeService.getEmp(id);
        return Msg.success().add("emp", employee);
    }

    /**
     * 修改员工信息
     * 如果直接发送ajax=put形式的请求，除了路径的数据，封装的数据全部为null
     * @param employee
     * @return
     */
    @RequestMapping(value="/emp/{empId}", method=RequestMethod.PUT)
    @ResponseBody
    public Msg updateEmp(Employee employee) {
        System.out.println(employee.getEmail()+employee.getEmpId());
        employeeService.updateEmp(employee);
        return Msg.success();
    }

}
