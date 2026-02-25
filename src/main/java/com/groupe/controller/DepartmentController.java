package com.groupe.controller;

import com.groupe.model.Department;
import com.groupe.service.SchoolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/departments")
public class DepartmentController {

    @Autowired
    private SchoolService schoolService;

    @GetMapping
    public String listDepartments(Model model) {
        model.addAttribute("departments", schoolService.getAllDepartments());
        return "departments/list";
    }

    @GetMapping("/new")
    public String showForm(Model model) {
        model.addAttribute("department", new Department());
        return "departments/form";
    }

    @PostMapping("/save")
    public String saveDepartment(@ModelAttribute("department") Department department) {
        schoolService.saveDepartment(department);
        return "redirect:/departments";
    }

    @GetMapping("/edit/{id}")
    public String editDepartment(@PathVariable Long id, Model model) {
        model.addAttribute("department", schoolService.getDepartmentById(id));
        return "departments/form";
    }

    @GetMapping("/delete/{id}")
    public String deleteDepartment(@PathVariable Long id) {
        schoolService.deleteDepartment(id);
        return "redirect:/departments";
    }
}
