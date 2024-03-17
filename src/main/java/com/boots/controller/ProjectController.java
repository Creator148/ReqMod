package com.boots.controller;

import com.boots.entity.Project;
import com.boots.entity.Project_Version;
import com.boots.entity.User;
import com.boots.service.ProjectService;
import com.boots.service.UserService;
import com.boots.repository.ProjectVersionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

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
    @GetMapping("/project-details/{projectId}")
    public String projectDetails(@PathVariable Long projectId, Model model) {
        Project project = projectService.getProjectById(projectId);

        if (project == null) {
            return "redirect:/list-projects";
        }

        List<Project_Version> projectVersions = projectService.getProjectVersionsByProject(project);

        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = userDetails.getUsername();
        User user = (User) UserService.loadUserByUsername(username);

        model.addAttribute("projects", projectService.getAllProjects());
        model.addAttribute("project", project);
        model.addAttribute("projectVersions", projectVersions);
        model.addAttribute("userInfo", user);

        return "project-details";
    }

    @PostMapping("/create-project")
    public String createProject(@RequestParam String name, Model model) {
        projectService.createProject(name);
        return "redirect:/list-projects";
    }
}


