package com.boots.entity;

import javax.persistence.*;

@Entity
@Table(name = "req_type")
public class Req_Type {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;

    public Req_Type(String name) {
        this.name = name;
    }

    public Req_Type() {

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
