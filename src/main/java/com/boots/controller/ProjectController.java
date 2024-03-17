package com.boots.controller;

import com.boots.entity.Status;
import com.boots.repository.StatusRepository;
import com.boots.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.boots.service.StatusService;

@Controller
public class ProjectController {

    @Autowired
    private ProjectService projectService;

    @GetMapping("/list-projects")
    public String listProjects(Model model) {
        model.addAttribute("projects", projectService.getAllProjects());
        return "list-projects";
    }

    @PostMapping("/create-project")
    public String createProject(@RequestParam String name, Model model) {
        projectService.createProject(name);
        return "redirect:/list-projects";
    }
}


