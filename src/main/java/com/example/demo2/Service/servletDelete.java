package com.example.demo2.Service;

import com.example.demo2.Dao.StudentDao;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
@WebServlet("/deleteStudent")
public class servletDelete extends HttpServlet {
    protected void service(HttpServletRequest req , HttpServletResponse res) throws IOException {
        String name =  req.getParameter("name");
        try {
            new StudentDao().delete(name);
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
