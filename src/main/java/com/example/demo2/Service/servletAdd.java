package com.example.demo2.Service;

import com.example.demo2.Dao.StudentDao;
import com.example.demo2.Student;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/addStudent")
public class servletAdd extends HttpServlet {
    protected void service(HttpServletRequest req , HttpServletResponse res) throws IOException {

        Student student = new Student();
        System.out.println(req.toString());
        String name = req.getParameter("name");/*获取name*/
        int age =Integer.parseInt( req.getParameter("age"));//获取age
        String sex = req.getParameter("sex");
        double score = Double.parseDouble(req.getParameter("score"));

        //存入Student对象

        student.setName(name);
        student.setScore(score);
        student.setSex(sex);
        student.setAge(age);
        try {
            new StudentDao().add(student);
            //返回查询页面
            /*重定向到listStudent主页面*/
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        try {
            res.sendRedirect("./listStudent");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
