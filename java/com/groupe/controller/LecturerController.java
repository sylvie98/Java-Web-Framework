package com.groupe.controller;

import com.groupe.model.Lecturer;
import com.groupe.service.SchoolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/lecturers")
public class LecturerController {

    @Autowired
    private SchoolService schoolService;

    @GetMapping
    public String listLecturers(Model model) {
        model.addAttribute("lecturers", schoolService.getAllLecturers());
        return "lecturers/list";
    }

    @GetMapping("/new")
    public String showForm(Model model) {
        model.addAttribute("lecturer", new Lecturer());
        model.addAttribute("departments", schoolService.getAllDepartments());
        return "lecturers/form";
    }

    @PostMapping("/save")
    public String saveLecturer(@ModelAttribute("lecturer") Lecturer lecturer) {
        schoolService.saveLecturer(lecturer);
        return "redirect:/lecturers";
    }

    @GetMapping("/edit/{id}")
    public String editLecturer(@PathVariable Long id, Model model) {
        model.addAttribute("lecturer", schoolService.getLecturerById(id));
        model.addAttribute("departments", schoolService.getAllDepartments());
        return "lecturers/form";
    }

    @GetMapping("/delete/{id}")
    public String deleteLecturer(@PathVariable Long id) {
        schoolService.deleteLecturer(id);
        return "redirect:/lecturers";
    }
}
