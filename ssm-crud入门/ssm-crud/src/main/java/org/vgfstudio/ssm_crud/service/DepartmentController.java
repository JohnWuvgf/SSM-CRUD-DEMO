package org.vgfstudio.ssm_crud.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.vgfstudio.ssm_crud.bean.Department;
import org.vgfstudio.ssm_crud.bean.Msg;

import java.util.List;

@Controller
public class DepartmentController {

    @Autowired
    DepartmentService departmentService;

    @RequestMapping("/depts")
    @ResponseBody
    public Msg getDept() {
        List<Department> departmentList = departmentService.getAll();
        return Msg.success().add("departmentList", departmentList);
    }
}
