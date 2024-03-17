package com.boots.controller;

import com.boots.entity.User;
import com.boots.service.ProjectService;
import com.boots.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProjectController {

    @Autowired
    private ProjectService projectService;
    @Autowired
    private UserService UserService;

    @GetMapping("/list-projects")
    public String listProjects(Model model) {
        // Получение информации о текущем пользователе
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = userDetails.getUsername();
        User user = (User) UserService.loadUserByUsername(username);

        model.addAttribute("projects", projectService.getAllProjects());
        model.addAttribute("userInfo", user);
        return "list-projects";
    }

    @PostMapping("/create-project")
    public String createProject(@RequestParam String name, Model model) {
        projectService.createProject(name);
        return "redirect:/list-projects";
    }
}


