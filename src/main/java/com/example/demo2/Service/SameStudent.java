package com.example.demo2.Service;

import com.example.demo2.Dao.StudentDao;
import com.example.demo2.Dao.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;

import java.io.IOException;

@WebServlet("/sameStudent")
public class SameStudent extends HttpServlet {
    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        res.setContentType("text/plain;charset=utf8");
        res.setCharacterEncoding("utf8");
        System.out.println("ajax请求来了");
        StudentDao studentdao = new StudentDao();

        String name = req.getParameter("name");
        try {
            if (studentdao.get(name)){
                res.getWriter().write("success");//返回success
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
