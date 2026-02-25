package com.groupe.controller;

import com.groupe.model.Student;
import com.groupe.service.SchoolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/students")
public class StudentController {

    @Autowired
    private SchoolService schoolService;

    @GetMapping
    public String listStudents(Model model) {
        model.addAttribute("students", schoolService.getAllStudents());
        return "students/list";
    }

    @GetMapping("/new")
    public String showForm(Model model) {
        model.addAttribute("student", new Student());
        model.addAttribute("departments", schoolService.getAllDepartments());
        return "students/form";
    }

    @PostMapping("/save")
    public String saveStudent(@ModelAttribute("student") Student student) {
        schoolService.saveStudent(student);
        return "redirect:/students";
    }

    @GetMapping("/edit/{id}")
    public String editStudent(@PathVariable Long id, Model model) {
        model.addAttribute("student", schoolService.getStudentById(id));
        model.addAttribute("departments", schoolService.getAllDepartments());
        return "students/form";
    }

    @GetMapping("/delete/{id}")
    public String deleteStudent(@PathVariable Long id) {
        schoolService.deleteStudent(id);
        return "redirect:/students";
    }

    @GetMapping("/{id}/enrollments")
    public String viewEnrollments(@PathVariable Long id, Model model) {
        model.addAttribute("student", schoolService.getStudentById(id));
        model.addAttribute("enrollments", schoolService.getStudentEnrollmentHistory(id));
        model.addAttribute("courses", schoolService.getAllCourses());
        return "students/enrollments";
    }

    @PostMapping("/{id}/enroll")
    public String enroll(@PathVariable Long id, @RequestParam Long courseId, 
                         @RequestParam String semester, @RequestParam String academicYear) {
        schoolService.enrollStudent(id, courseId, semester, academicYear);
        return "redirect:/students/" + id + "/enrollments";
    }

    @GetMapping("/{id}/drop/{courseId}")
    public String drop(@PathVariable Long id, @PathVariable Long courseId) {
        schoolService.dropCourse(id, courseId);
        return "redirect:/students/" + id + "/enrollments";
    }
}
