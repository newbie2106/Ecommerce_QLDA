/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tth.repositories;

import com.tth.pojo.User;
import java.util.List;

/**
 *
 * @author tongh
 */
public interface UserRepository {

    User getUserById(int id);

    User getUserByUsername(String username);

    public Boolean authUser(String username, String password);

    public long countUser();

    public List<User> getUsers();

<<<<<<< HEAD

    public void addOrUpdateUser(User u);

    public void addOrUpdateUser(User user);

    
=======
    public boolean addOrUpdateUser(User user);

    public void changePassword(User user);

>>>>>>> origin/hiep
    public void deleteUser(int id);

}
