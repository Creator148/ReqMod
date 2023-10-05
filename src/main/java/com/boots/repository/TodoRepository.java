package com.boots.repository;

import com.boots.entity.Todo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;


public interface TodoRepository extends JpaRepository < Todo, Long > {
    List < Todo > findByUserName(String user);
}
