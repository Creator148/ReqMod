package com.boots.repository;

import com.boots.entity.Version_User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface VersionUserRepository extends JpaRepository<Version_User, Long> {
}