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

@WebServlet("/listStudent")
public class ListServlet extends HttpServlet {
    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        List<Student> students= null;
        try {
            students = new StudentDao().queryAllByScore();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        req.setAttribute("students",students);
        req.getRequestDispatcher("/listStudent.jsp").forward(req,res);
    }
}
