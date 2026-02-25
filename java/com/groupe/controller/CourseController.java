package com.groupe.controller;

import com.groupe.model.Course;
import com.groupe.service.SchoolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/courses")
public class CourseController {

    @Autowired
    private SchoolService schoolService;

    @GetMapping
    public String listCourses(Model model) {
        model.addAttribute("courses", schoolService.getAllCourses());
        return "courses/list";
    }

    @GetMapping("/new")
    public String showForm(Model model) {
        model.addAttribute("course", new Course());
        model.addAttribute("lecturers", schoolService.getAllLecturers());
        model.addAttribute("departments", schoolService.getAllDepartments());
        return "courses/form";
    }

    @PostMapping("/save")
    public String saveCourse(@ModelAttribute("course") Course course) {
        schoolService.saveCourse(course);
        return "redirect:/courses";
    }

    @GetMapping("/edit/{id}")
    public String editCourse(@PathVariable Long id, Model model) {
        model.addAttribute("course", schoolService.getCourseById(id));
        model.addAttribute("lecturers", schoolService.getAllLecturers());
        model.addAttribute("departments", schoolService.getAllDepartments());
        return "courses/form";
    }

    @GetMapping("/delete/{id}")
    public String deleteCourse(@PathVariable Long id) {
        schoolService.deleteCourse(id);
        return "redirect:/courses";
    }
}
