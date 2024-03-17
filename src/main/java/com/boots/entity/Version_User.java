package com.boots.entity;

import javax.persistence.*;

@Entity
@Table(name = "version_user")
public class Version_User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "version_id")
    private Project_Version project_version;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    public Version_User() {
        super();
    }

    public Version_User(Project_Version projectVersion, User user) {
        this.project_version = projectVersion;
        this.user = user;
    }
}
