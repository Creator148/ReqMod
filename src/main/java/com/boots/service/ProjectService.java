package com.boots.service;


import com.boots.entity.*;
import com.boots.repository.ProjectRepository;
import com.boots.repository.StatusRepository;
import com.boots.repository.ProjectVersionRepository;
import com.boots.repository.VersionUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProjectService {
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();

    @Autowired
    private ProjectRepository projectRepository;

    @Autowired
    private ProjectVersionRepository projectVersionRepository;

    @Autowired
    private VersionUserRepository versionUserRepository;
    @Autowired
    private StatusRepository StatusRepository;

    public List<Project> getAllProjects() {
        return projectRepository.findAll();
    }

    public void createProject(String name) {
        Status defaultStatus = StatusRepository.findById(1L).orElseThrow(() -> new RuntimeException("Статус по умолчанию не найден"));
        Project project = new Project(defaultStatus,name, true); // Параметры по умолчанию, замените на необходимые
        projectRepository.save(project);

        // Создание ProjectVersion по умолчанию
        Project_Version projectVersion = new Project_Version(defaultStatus,project, "MVP", true); // Параметры по умолчанию, замените на необходимые
        projectVersionRepository.save(projectVersion);

        // Связь с текущим пользователем
        User currentUser= (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Version_User versionUser = new Version_User(projectVersion, currentUser);
        versionUserRepository.save(versionUser);
    }
    public Project getProjectById(Long projectId) {
        return projectRepository.findById(projectId).orElse(null);
    }

    public List<Project_Version> getProjectVersionsByProject(Project project) {
        return projectVersionRepository.findByProject(project);
    }


}

