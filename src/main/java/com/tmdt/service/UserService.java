package com.tmdt.service;

import com.tmdt.model.Users;
import com.tmdt.repository.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {
    @Autowired
    UserDAO userDAO;

    public List<Users> findAll() {
        return userDAO.findAll();
    }

    public Users save(Users users) {
        return userDAO.save(users);
    }

    public Users login(String username, String password) {
        return userDAO.findByUser_nameAndUser_password(username, password);
    }

    public Optional<Users> findUserByEmail(String email) {
        return userDAO.findByUser_email(email);
    }

    public Optional<Users> findUserByResetToken(String token) {
        return userDAO.findByReset_token(token);
    }
}
