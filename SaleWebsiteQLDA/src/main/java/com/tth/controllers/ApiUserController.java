/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tth.controllers;

import com.tth.DTO.UserAdminDTO;
import com.tth.advice.ValidationException;
import com.tth.components.JwtService;
import com.tth.pojo.Role;
import com.tth.pojo.User;
import com.tth.services.RoleService;
import com.tth.services.UserService;
import com.tth.validator.UpdateUserAdminValidator;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
    @Autowired
    private UpdateUserAdminValidator updateUserAdminValidator;
    @Autowired
    private MessageSource messageSource;

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

    @GetMapping(path = "/users/{id}/", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<User> viewUserDetail(@PathVariable(value = "id") int id) {
        return new ResponseEntity<>(this.userService.getUserById(id), HttpStatus.OK);
    }

    @DeleteMapping("/users/{id}/")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteUser(@PathVariable(value = "id") int id) {
        this.userService.deleteUser(id);
    }

    @PostMapping(path = "/register/",
            produces = MediaType.APPLICATION_JSON_VALUE,
            consumes = MediaType.MULTIPART_FORM_DATA_VALUE
    )
    public ResponseEntity registerAccount(@ModelAttribute UserAdminDTO userAdminDTO,
            BindingResult bindingResult, @RequestPart MultipartFile avatar) {
        updateUserAdminValidator.validate(userAdminDTO, bindingResult);
        if (bindingResult.hasErrors()) {
            Map<String, List<String>> errorsRes = new HashMap<>();
            for (FieldError error : bindingResult.getFieldErrors()) {
                String fieldName = error.getField();
                String errorMessage = messageSource.getMessage(error, Locale.getDefault());
                errorsRes.computeIfAbsent(fieldName, k -> new ArrayList<>()).add(errorMessage);
            }
            return new ResponseEntity(errorsRes, HttpStatus.BAD_REQUEST);
        }
        try {
            ModelMapper modelMapper = new ModelMapper();
            modelMapper.getConfiguration().setMatchingStrategy(MatchingStrategies.STRICT);
            User u = modelMapper.map(userAdminDTO, User.class);
            if (this.userService.addOrUpdateUser(u)) {
                return new ResponseEntity("Success", HttpStatus.CREATED);
            }

        } catch (Exception e) {
            return new ResponseEntity<>("Error", HttpStatus.BAD_REQUEST);
        }
        return new ResponseEntity<>("Error", HttpStatus.BAD_REQUEST);
    }

}
