/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tth.services.impl;

import com.tth.pojo.User;
import com.tth.repositories.UserRepository;
import com.tth.services.UserService;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

/**
 *
 * @author tongh
 */
@Service("UserDetailsService")
public class UserSeviceImpl implements UserService {

    @Autowired
    private UserRepository userRepo;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Override
    public User getUserById(int id) {
        return this.userRepo.getUserById(id);
    }

    @Override
    public User getUserByUsername(String username) {
        return this.userRepo.getUserByUsername(username);
    }

    @Override
    public Boolean authUser(String username, String password) {
        return this.userRepo.authUser(username, password);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User u = this.userRepo.getUserByUsername(username);
        if (u == null) {
            throw new UsernameNotFoundException("Invalid");
        }

        Set<GrantedAuthority> authorities = new HashSet<>();
        authorities.add(new SimpleGrantedAuthority(u.getRoleId().getRoleName()));
        return new org.springframework.security.core.userdetails.User(
                u.getUsername(), u.getPassword(), authorities);
    }

    @Override
    public long countUser() {
        return this.userRepo.countUser();
    }

    @Override
    public List<User> getUsers() {
        return this.userRepo.getUsers();
    }

    @Override
    public void addOrUpdateUser(User u) {
        u.setAvatar("https://res.cloudinary.com/dsbkju7j9/image/upload/v1719163511/bshktjhrrdzspkm7u301.png");
        this.userRepo.addOrUpdateUser(u);
    }

    @Override
    public void deleteUser(int id) {
        this.userRepo.deleteUser(id);
    }

}
