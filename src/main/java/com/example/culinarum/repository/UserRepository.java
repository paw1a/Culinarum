package com.example.culinarum.repository;

import com.example.culinarum.entity.Role;
import com.example.culinarum.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByEmail(String email);
    List<User> findByRole(Role role);
}
