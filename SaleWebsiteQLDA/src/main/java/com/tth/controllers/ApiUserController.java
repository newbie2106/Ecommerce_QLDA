/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tth.controllers;

import com.tth.components.JwtService;
import com.tth.pojo.Role;
import com.tth.pojo.User;
import com.tth.services.RoleService;
import com.tth.services.UserService;
import java.security.Principal;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author tongh
 */
@RestController
@RequestMapping("/api")
@CrossOrigin
public class ApiUserController {

    @Autowired
    private UserService userService;
    @Autowired
    private JwtService jwtService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private BCryptPasswordEncoder passswordEncoder;

    @PostMapping("/login/")
    public ResponseEntity<String> login(@RequestBody User user) {
        if (this.userService.authUser(user.getUsername(), user.getPassword()) == true) {
            String token = this.jwtService.generateTokenLogin(user.getUsername());
            return new ResponseEntity<>(token, HttpStatus.OK);
        }
        return new ResponseEntity<>("error" + user.getUsername(), HttpStatus.BAD_REQUEST);
    }

    @GetMapping(path = "/current-user/", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<User> getCurrentUser(Principal p) {
        User u = this.userService.getUserByUsername(p.getName());
        return new ResponseEntity<>(u, HttpStatus.OK);
    }

    @DeleteMapping("/users/{id}/")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteUser(@PathVariable(value = "id") int id) {
        this.userService.deleteUser(id);
    }

@PostMapping(path = "/users/", consumes = {
        MediaType.APPLICATION_JSON_VALUE,
        MediaType.MULTIPART_FORM_DATA_VALUE
    })
    @ResponseStatus(HttpStatus.CREATED)
    @CrossOrigin
    public void create(@RequestParam Map<String, String> params, @RequestPart MultipartFile[] file) {
        User u = new User();
        Role role = this.roleService.getRoleById(Integer.parseInt(params.get("role")));
        u.setFirstName(params.get("firstName"));
        u.setLastName(params.get("lastName"));
        u.setUsername(params.get("username"));
        u.setEmail(params.get("email"));
        u.setPhone(params.get("phone"));
        String password = params.get("password");
       
        u.setRoleId(role);
        if (file.length > 0) {
            u.setFile(file[0]);
        }

        this.userService.addOrUpdateUser(u);
    }
	

    
}
