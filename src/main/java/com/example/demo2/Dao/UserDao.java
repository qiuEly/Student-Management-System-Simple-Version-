package com.example.demo2.Dao;

import com.example.demo2.User;

import java.sql.*;

public class UserDao {
    Connection conn = null;
    String sql = null;

    public void setConnection() throws Exception {
        conn = DBUtil.getConnection();
    }
    //查询用户是否存在
    public boolean getUser (String username ,String pwd) throws Exception {
        setConnection();
        PreparedStatement ps = null;
        sql = "select * from users where username = ? and password = ?";
        ps = conn.prepareStatement(sql);
        ps.setString(1,username);
        ps.setString(2,pwd);
        ResultSet rs = ps.executeQuery();
        return rs.next();
    }
    //注册用户
    public void addUser(User user) throws Exception {
        setConnection();
        sql = "insert into users(username,password) values(?,?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1,user.getUsername());
        ps.setString(2,user.getPassword());
        ps.executeUpdate();
    }

    //检验名字是否重复
    public boolean getUserByName (String username) throws Exception {
        setConnection();
        sql = "select * from users where username = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1,username);
        ResultSet rs = ps.executeQuery();
        return rs.next();
    }
    public static void main(String[] args) {
        User user = new User("admin","123456");
        UserDao userDao = new UserDao();
        try {
            userDao.addUser(user);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
