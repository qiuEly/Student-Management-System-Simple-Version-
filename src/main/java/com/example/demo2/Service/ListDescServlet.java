package com.example.demo2.Service;

import com.example.demo2.Dao.StudentDao;
import com.example.demo2.Student;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;

import java.io.IOException;
import java.util.List;

@WebServlet("/listDesc")
public class ListDescServlet extends HttpServlet {
    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        List<Student> students= null;
        try {
            students = new StudentDao().queryAllByScoreDesc();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        req.setAttribute("students",students);
        req.getRequestDispatcher("/listDesc.jsp").forward(req,res);
    }
}
