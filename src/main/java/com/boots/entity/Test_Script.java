package com.boots.entity;

import javax.persistence.*;

@Entity
@Table(name = "test_script")
public class Test_Script {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String description;
    @ManyToOne
    @JoinColumn(name = "status_id")
    private Status status;
    private Boolean active;

    public Test_Script(String description, Status status, Boolean active) {
        this.description = description;
        this.status = status;
        this.active = active;
    }

    public Test_Script() {

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }
}
