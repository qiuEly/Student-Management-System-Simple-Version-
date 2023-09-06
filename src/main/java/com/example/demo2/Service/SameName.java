package com.example.demo2.Service;

import com.example.demo2.Dao.UserDao;
import com.mysql.cj.xdevapi.JsonString;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/sameName")
public class SameName extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/plain;charset=utf8");
        resp.setCharacterEncoding("utf8");
        System.out.println("ajax请求来了");
        UserDao userdao = new UserDao();
        String username = req.getParameter("username");
        try {
            if (userdao.getUserByName(username)){
               resp.getWriter().write("success");//返回success
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
