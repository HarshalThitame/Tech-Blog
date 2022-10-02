/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.techblogs.dao;

import com.techblogs.entities.Admin;
import com.techblogs.entities.Post;
import com.techblogs.entities.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author harshal
 */
public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    //method to insert user to database
    public boolean saveUser(User user) {
        boolean f = false;
        try {
            String query = "insert into user(name,email,password,gender,about) values(?,?,?,?,?)";

            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getGender());
            ps.setString(5, user.getAbout());

            ps.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public Admin getAdminByEmailAndPassword(String email, String password) {
        Admin admin = null;
        try {
            String query = "select * from admin where aEmail = ? and aPassword = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet set = ps.executeQuery();
            if (set.next()) {
                admin = new Admin();
                admin.setaEmail(set.getString("aEmail"));
                admin.setaId(set.getInt("aId"));
                admin.setaPassword(set.getString("aPassword"));
                admin.setaName(set.getString("aName"));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return admin;
    }
    //get user br useremail and password

    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;

        try {
            String query = "select * from user where email = ? and password = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet set = ps.executeQuery();

            if (set.next()) {
                user = new User();

                String name = set.getString("name");
                user.setName(name);

                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDateTime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean updateUser(User user) {
        boolean f = false;
        try {
            String query = "update user set name = ?,email=?,password=?,gender=?,about=?,profile=? where id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getGender());
            ps.setString(5, user.getAbout());
            ps.setString(6, user.getProfile());
            ps.setInt(7, user.getId());

            ps.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public User getUserByUserId(int userId) {
        User user = null;
        try {
            String q = "select * from user where id = ?";
            PreparedStatement ps = con.prepareStatement(q);
            ps.setInt(1, userId);

            ResultSet set = ps.executeQuery();

            if (set.next()) {
                user = new User();

                String name = set.getString("name");
                user.setName(name);

                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDateTime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    //get all Users
    public List<User> getAllUsers() {
        List<User> list = new ArrayList<>();
        try {
            Thread.sleep(1000);
            PreparedStatement p = con.prepareStatement("select * from user");
            ResultSet set = p.executeQuery();

            while (set.next()) {
                int id = set.getInt("id");
                String name = set.getString("name");
                String email = set.getString("email");
                String password = set.getString("password");
                String gender = set.getString("gender");
                Timestamp date = set.getTimestamp("rdate");
                String about = set.getString("about");

                User user = new User(id, name, email, password, gender, date, about);
                list.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    
     public boolean deleteUser(int id)
    {
        boolean f = false;
        
        try {
            String q = "delete from user where id = ?";
            PreparedStatement ps = con.prepareStatement(q);
            ps.setInt(1, id);
            
            ps.executeUpdate();
            f = true;
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        
        return f;
    }
}
