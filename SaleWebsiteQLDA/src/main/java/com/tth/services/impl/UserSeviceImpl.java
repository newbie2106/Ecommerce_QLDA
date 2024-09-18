/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tth.services.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.tth.DTO.UserAdminDTO;
import com.tth.advice.ValidationException;
import com.tth.pojo.Role;
import com.tth.pojo.User;
import com.tth.repositories.UserRepository;
import com.tth.services.RoleService;
import com.tth.services.UserService;
import com.tth.validator.UserAdminValidator;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.modelmapper.ModelMapper;
import org.modelmapper.PropertyMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.validation.BeanPropertyBindingResult;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.multipart.MultipartFile;

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
    @Autowired
    private RoleService roleService;
    @Autowired
    private UserAdminValidator userAdminvalidator;
    @Autowired
    private Cloudinary cloudinary;

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
    public boolean addOrUpdateUser(User u) {
        if (!u.getFile().isEmpty()) {
            try {
                Map res = this.cloudinary.uploader().upload(u.getFile().getBytes(), ObjectUtils.asMap("resource_type", "auto"));
                u.setAvatar(res.get("secure_url").toString());
            } catch (IOException ex) {
                Logger.getLogger(ProductServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        u.setPassword(this.passwordEncoder.encode(u.getPassword()));
        return this.userRepo.addOrUpdateUser(u);
    }

    @Override
    public boolean addOrUpdateUserClient(Map<String, String> params, MultipartFile file) {
        User user = new User();
        String username = params.get("username");
        String password = params.get("password");
        String firstName = params.get("firstName");
        String lastName = params.get("lastName");
        String email = params.get("email");
        String phone = params.get("phone");
        String address = params.get("address");

        user.setUsername(username);
        user.setPassword(this.passwordEncoder.encode(password));
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setPhone(phone);
        user.setAddress(address);
        Role r = this.roleService.getRoleById(2);
        user.setRoleId(r);
//        BindingResult rs = new BeanPropertyBindingResult(user, "user") {
//        };

        if (!file.isEmpty()) {
            try {
                Map res = this.cloudinary.uploader().upload(file.getBytes(), ObjectUtils.asMap("resource_type", "auto"));
                user.setAvatar(res.get("secure_url").toString());
            } catch (IOException ex) {
                Logger.getLogger(ProductServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return this.userRepo.addOrUpdateUserClient(user);
    }

    @Override
    public void deleteUser(int id) {
        this.userRepo.deleteUser(id);
    }

    @Override
    public UserAdminDTO getUserAdminDTOByUsername(String username) {
        User u = this.getUserByUsername(username);
        UserAdminDTO userAdminDTO = new UserAdminDTO();

        userAdminDTO.setFirstName(u.getFirstName());
        userAdminDTO.setLastName(u.getLastName());
        userAdminDTO.setUsername(u.getUsername());
        userAdminDTO.setPassword(u.getPassword());
        userAdminDTO.setAddress(u.getAddress());
        userAdminDTO.setEmail(u.getEmail());
        userAdminDTO.setPhone(u.getPhone());
        userAdminDTO.setAvatar(u.getAvatar());

        return userAdminDTO;
    }

    @Override
    public void changePassword(User user) {
        user.setPassword(this.passwordEncoder.encode(user.getPassword()));
        this.userRepo.changePassword(user);
    }

}
