package com.example.demo2.Dao;
import java.sql.*;
//工具类，连接数据库
public class DBUtil {
    static String ip = "localhost";
    static int port = 3306;
    static String database = "t";
    static String encoding = "UTF-8";
    static String username = "root";
    static String password = "1224";
    public static String getUsername() {
        return username;
    }

    public static String getPassword() {
        return password;
    }


    /*静态块在程序初始化的时候就执行*/


    public static Connection getConnection() throws Exception{

        String url = "jdbc:mysql://localhost:3306/t?useUnicode=true&useJDBCCompliantTimezoneShift=true&serverTimezone=UTC";
        return DriverManager.getConnection(url, username, password);
    }

    public static void main(String[] args) throws Exception {
        System.out.println(getConnection());
    }
}
