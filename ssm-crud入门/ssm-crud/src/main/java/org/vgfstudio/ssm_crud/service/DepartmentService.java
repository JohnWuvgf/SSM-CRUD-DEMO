package org.vgfstudio.ssm_crud.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.vgfstudio.ssm_crud.bean.Department;
import org.vgfstudio.ssm_crud.dao.DepartmentMapper;

import java.util.List;

@Service
public class DepartmentService {
    @Autowired
    DepartmentMapper departmentMapper;

    /**
     * 查询所有department
     * @return
     */
    public List<Department> getAll() {
        return departmentMapper.selectByExample(null);
    }
}
