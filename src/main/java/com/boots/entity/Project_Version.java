package com.boots.entity;

import javax.persistence.*;

@Entity
@Table(name = "project_version")
public class Project_Version {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne
    @JoinColumn(name = "status_id")
    private Status status;

    @ManyToOne
    @JoinColumn(name = "project_id")
    private Project project;
    private String name;
    private Boolean active;

    public Project_Version(Status status, Project project, String name, Boolean active) {
        super();
        this.status = status;
        this.project = project;
        this.name = name;
        this.active = active;
    }

    public Project_Version() {
        super();
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }
}
