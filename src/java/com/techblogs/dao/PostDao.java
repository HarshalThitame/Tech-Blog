/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.techblogs.dao;

import com.techblogs.entities.Category;
import com.techblogs.entities.Post;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author harshal
 */
public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> list = new ArrayList<>();

        try {
            String query = "select * from categories";
            Statement st = this.con.createStatement();
            ResultSet set = st.executeQuery(query);

            while (set.next()) {
                int cid = set.getInt("cid");
                String name = set.getString("cname");
                String description = set.getString("description");
                Category c = new Category(cid, name, description);
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean savePost(Post p) {
        boolean f = false;

        try {
            String q = "insert into posts(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(q);
            ps.setString(1, p.getpTitle());
            ps.setString(2, p.getpContent());
            ps.setString(3, p.getpCode());
            ps.setString(4, p.getpPic());
            ps.setInt(5, p.getCatId());
            ps.setInt(6, p.getUserId());

            ps.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public boolean saveCategory(Category c) {
        boolean f = false;

        try {
            String q = "insert into categories(cname,description) values(?,?)";
            PreparedStatement ps = con.prepareStatement(q);
            ps.setString(1, c.getName());
            ps.setString(2, c.getDescription());

            ps.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public boolean deletePost(int id) {
        boolean f = false;

        try {
            String q = "delete from posts where pid = ?";
            PreparedStatement ps = con.prepareStatement(q);
            ps.setInt(1, id);

            ps.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public boolean deleteCategory(int id) {
        boolean f = false;

        try {
            String q = "delete from categories where cid = ?";
            PreparedStatement ps = con.prepareStatement(q);
            ps.setInt(1, id);

            ps.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    //get all post
    public List<Post> getAllPosts() {
        List<Post> list = new ArrayList<>();
        try {
            Thread.sleep(1000);
            PreparedStatement p = con.prepareStatement("select * from posts order by pid desc");
            ResultSet set = p.executeQuery();

            while (set.next()) {
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int catId = set.getInt("catId");
                int userId = set.getInt("userId");

                Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);

                list.add(post);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    //get post by category id
    public List<Post> getPostByCatId(int catId) {
        List<Post> list = new ArrayList<>();

        try {
            Thread.sleep(1000);
            PreparedStatement p = con.prepareStatement("select * from posts where catId = ?");
            p.setInt(1, catId);
            ResultSet set = p.executeQuery();

            while (set.next()) {
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int userId = set.getInt("userId");

                Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);

                list.add(post);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public Post getPostByPostId(int postId) {
        Post post = null;
        String q = "select * from posts where pid = ?";
        try {
            PreparedStatement p = this.con.prepareStatement(q);
            p.setInt(1, postId);
            ResultSet set = p.executeQuery();

            if (set.next()) {
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int userId = set.getInt("userId");
                int cid = set.getInt("catId");

                post = new Post(pid, pTitle, pContent, pCode, pPic, date, cid, userId);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return post;
    }

    public List<Post> getPostByUserID(int id) {
        List<Post> list = null;

        try {
            Thread.sleep(1000);
            PreparedStatement p = con.prepareStatement("select * from posts where userId = ?");
            p.setInt(1, id);
            ResultSet set = p.executeQuery();

            list = new ArrayList<>();
            while (set.next()) {
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int catId = set.getInt("CatId");

                Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, id);

                list.add(post);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

}
