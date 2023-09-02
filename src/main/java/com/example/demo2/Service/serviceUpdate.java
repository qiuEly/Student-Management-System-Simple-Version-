package com.example.demo2.Service;

import com.example.demo2.Dao.StudentDao;
import com.example.demo2.Student;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/updateStudent")
public class serviceUpdate  extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Student student = new Student();
//        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        double score = Double.parseDouble(req.getParameter("score"));
        int age = Integer.parseInt(req.getParameter("age"));
        String sex = req.getParameter("sex");
        //存到student对象中
//        student.setId(id);
        student.setName(name);
        student.setScore(score);
        student.setSex(sex);
        student.setAge(age);
        try {
            new StudentDao().update(student);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        try {
            resp.sendRedirect("./listStudent");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
