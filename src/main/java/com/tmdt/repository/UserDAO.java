package com.tmdt.repository;

import com.tmdt.model.Users;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserDAO extends JpaRepository<Users, String> {

    @Query("select u from Users u where u.user_name = ?1 and  u.user_password = ?2")
    Users findByUser_nameAndUser_password(String user_name, String user_password);
    @Query("select u from Users u where u.user_email =?1")
    Optional<Users> findByUser_email(String user_email);
    @Query("select u from Users u where u.reset_token =?1")
    Optional<Users> findByReset_token(String reset_token);
}
