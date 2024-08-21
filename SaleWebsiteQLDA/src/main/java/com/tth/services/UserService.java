/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tth.services;

import com.tth.pojo.User;
import java.util.List;
import org.springframework.security.core.userdetails.UserDetailsService;

/**
 *
 * @author tongh
 */
public interface UserService extends UserDetailsService {

    User getUserById(int id);

    User getUserByUsername(String username);

    public Boolean authUser(String username, String password);

    public long countUser();

    public List<User> getUsers();

    public void addOrUpdateUser(User u);

    public void deleteUser(int id);

}
