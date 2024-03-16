package com.boots.entity;

import javax.persistence.*;

@Entity
@Table(name = "req")
public class Req {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne
    @JoinColumn(name = "test_script_id")
    private Test_Script testScript;
    @ManyToOne
    @JoinColumn(name = "type_id")
    private Req_Type reqType;
    @ManyToOne
    @JoinColumn(name = "status_id")
    private Status status;
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;
    @OneToOne
    @JoinColumn(name = "comment_id")
    private Comment comment;
    @ManyToOne
    @JoinColumn(name = "version_id")
    private Project_Version project_version;

    private String title;
    private String description;
    private Boolean active;

    public Req(Test_Script testScript, Req_Type reqType, Status status, User user, Comment comment, Project_Version project_version, String title, String description, Boolean active) {
        this.testScript = testScript;
        this.reqType = reqType;
        this.status = status;
        this.user = user;
        this.comment = comment;
        this.project_version = project_version;
        this.title = title;
        this.description = description;
        this.active = active;
    }

    public Req() {
        super();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Test_Script getTestScript() {
        return testScript;
    }

    public void setTestScript(Test_Script testScript) {
        this.testScript = testScript;
    }

    public Req_Type getReqType() {
        return reqType;
    }

    public void setReqType(Req_Type reqType) {
        this.reqType = reqType;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Comment getComment() {
        return comment;
    }

    public void setComment(Comment comment) {
        this.comment = comment;
    }

    public Project_Version getProject_version() {
        return project_version;
    }

    public void setProject_version(Project_Version project_version) {
        this.project_version = project_version;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }
}
