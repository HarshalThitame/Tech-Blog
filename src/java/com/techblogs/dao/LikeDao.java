/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.techblogs.dao;

import java.sql.*;
import java.sql.ResultSet;

/**
 *
 * @author harshal
 */
public class LikeDao {

    Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }

    public boolean insertLike(int pid, int uid) {
        boolean f = false;
        try {
            String q = "insert into liked(pid,uid) values(?,?)";
            PreparedStatement ps = con.prepareStatement(q);

            ps.setInt(1, pid);
            ps.setInt(2, uid);
            ps.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public int countLikeOnPost(int pid) {
        int count = 0;
        String q = "select count(*) from liked where pid = ?";

        try {
            PreparedStatement p = this.con.prepareStatement(q);
            p.setInt(1, pid);
            ResultSet set = p.executeQuery();

            if (set.next()) {
                count = set.getInt("count(*)");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public boolean isLikedByUser(int pid, int uid) {

        boolean f = false;

        try {
            PreparedStatement ps = this.con.prepareStatement("select * from liked where pid = ? and uid = ?");
            ps.setInt(1, pid);
            ps.setInt(2, uid);

            ResultSet set = ps.executeQuery();
            if (set.next()) {
                f = true;
            }

        } catch (Exception e) {
        }

        return f;

    }

    public boolean deleteLike(int pid, int uid) {
        boolean f = false;

        try {
            PreparedStatement ps = con.prepareStatement("delete from liked where pid = ? and uid = ?");
            ps.setInt(1, pid);
            ps.setInt(2, uid);

            ps.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

}
