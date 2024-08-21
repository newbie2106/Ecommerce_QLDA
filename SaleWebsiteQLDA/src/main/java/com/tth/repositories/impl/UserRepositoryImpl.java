/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tth.repositories.impl;

import com.tth.pojo.User;
import com.tth.repositories.UserRepository;
import java.util.Date;
import java.util.List;
import org.hibernate.query.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author tongh
 */
@Repository
@Transactional
public class UserRepositoryImpl implements UserRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Autowired
    private BCryptPasswordEncoder passEncoder;

    @Override
    public User getUserByUsername(String username) {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createQuery("FROM User WHERE username = :username");
        q.setParameter("username", username);

        return (User) q.getSingleResult();
    }

    @Override
    public Boolean authUser(String username, String password) {
        User u = this.getUserByUsername(username);
        return this.passEncoder.matches(password, u.getPassword());

    }

    @Override
    public User getUserById(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        return s.get(User.class, id);
    }

    @Override
    public long countUser() {
        Session s = this.factory.getObject().getCurrentSession();
        Query<Long> p = s.createQuery("SELECT COUNT(u.id) FROM User u", Long.class);
        return p.uniqueResult();
    }

    @Override
    public List<User> getUsers() {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createNamedQuery("User.findAll");

        return q.getResultList();
    }

    @Override
    public void addOrUpdateUser(User user) {
        Session s = this.factory.getObject().getCurrentSession();
        User existedUser = getUserByUsername(user.getUsername());
        if (existedUser.getUsername() != null) {
            if (user.getPassword() == null) {
                user.setPassword(existedUser.getPassword());
            }
            if (user.getAvatar() == null) {
                user.setAvatar(existedUser.getAvatar());
            }
            if (user.getCreatedDate() == null) {
                user.setCreatedDate(existedUser.getCreatedDate());
            }
            if (user.getAddress() == null) {
                user.setAddress(existedUser.getAddress());
            }
            if (user.getPhone() == null) {
                user.setPhone(existedUser.getPhone());
            }
            if (user.getEmail() == null) {
                user.setEmail(existedUser.getEmail());
            }
            s.update(user);
        } else {
            if (user.getAvatar() == null) {
                user.setAvatar("https://res.cloudinary.com/dsbkju7j9/image/upload/v1719163511/bshktjhrrdzspkm7u301.png");
            }
            user.setCreatedDate(new Date());
            s.save(user);
        }

    }

    @Override
    public void deleteUser(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        User u = this.getUserById(id);
        s.delete(u);
    }
}
