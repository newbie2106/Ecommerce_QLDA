/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tth.controllers;

import com.tth.pojo.User;
import com.tth.repositories.UserRepository;
import com.tth.services.RoleService;
import com.tth.services.UserService;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author tongh
 */
@Controller
@PropertySource("classpath:configs.properties")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private Environment env;

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/users")
    public String createViewUser(Model model) {
        model.addAttribute("user", new User());
        return "users";
    }

    @PostMapping("/users")
    public String createUserAdmin(@ModelAttribute(value = "user") @Valid User u,
            BindingResult rs) {
        if (!rs.hasErrors()) {
            try {
                this.userService.addOrUpdateUser(u);
                return "redirect:/manage-users";
            } catch (Exception ex) {
                System.err.println(ex.getMessage());
            }
        }
        return "users";
    }

    @GetMapping("/users/{username}")
    public String updateViewUser(Model model, @PathVariable(value = "username") String username) {
        model.addAttribute("user", this.userService.getUserByUsername(username));
        return "users";
    }

    @RequestMapping("/manage-users")
    public String BrandManagement(Model model) {

        model.addAttribute("users", this.userService.getUsers());
        int pageSize = Integer.parseInt(this.env.getProperty("PAGE_SIZE"));
        long count = this.userService.countUser();
        model.addAttribute("count", Math.ceil(count * 1.0 / pageSize));
        return "manageUsers";
    }

}
