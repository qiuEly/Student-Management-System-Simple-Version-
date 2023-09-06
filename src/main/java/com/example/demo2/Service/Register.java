package com.example.demo2.Service;

import com.example.demo2.Dao.UserDao;
import com.example.demo2.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/register")
public class Register extends HttpServlet {

//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        //设置返回类型
//        resp.setContentType("text/html;charset=utf8");
//        resp.setCharacterEncoding("utf8");
//        //获取参数
//        String username = req.getParameter("username");
//        String password = req.getParameter("password");
//        UserDao userDao = new UserDao();
//        System.out.println("hello");
//        try {
//            if(!userDao.getUser(username,password)){
//                resp.getWriter().print(false);
//            } else {
//                userDao.addUser(new User(username,password));
//                resp.sendRedirect("./listStudent");
//                resp.getWriter().print(true);
//            }
//        } catch (Exception e) {
//            throw new RuntimeException(e);
//        }
//
//    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        UserDao userDao = new UserDao();
        try {
            userDao.addUser(new User(username,password));
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        resp.sendRedirect("./listStudent");
    }

}
