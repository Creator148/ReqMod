package com.boots.repository;

import com.boots.entity.Project_Version;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
@Repository
public interface ProjectVersionRepository extends JpaRepository<Project_Version, Long> {
}
