<%@ page import="java.sql.Connection" %>
<%@ page import="com.example.demo2.Dao.DBUtil" %>
<%@ page import="com.example.demo2.Student" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2023/9/2
  Time: 10:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生信息管理系统Web版</title>
</head>
<body>
<%--   <table>--%>
<%--        <tr>--%>
<%--            <h1 align="center">学生信息管理系统Web版</h1>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <th> <a href="./listStudent">查看所有学生(按照成绩升序)</a>--%>

<%--        </tr>--%>
<%--    </table>--%>
<h1 align="center">学生信息管理系统Web版</h1>
<%
    String pass = null;
    String name = null;
    Cookie[] cookies = request.getCookies();
if (cookies != null) {
        for (Cookie cookie : cookies) {
            if ("username".equals(cookie.getName())) {
                name = cookie.getValue();
            } else if ("password".equals(cookie.getName()))
                pass = cookie.getValue();
        }
    }
%>
<form action="./index.jsp" method="post" align="center">
    <label for="username">用户名</label><input type="text" name="username" id="username" value="<%=name%>"/>
    <label for="password">密码</label><input type="password" name="password" id="password" value="<%=pass%>"/>
    <input type="submit" value="submit"/>
</form>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    if (username != null && password != null) {
        new DBUtil();
        if (username.equals(DBUtil.getUsername()) && password.equals(DBUtil.getPassword())) {
            session.setAttribute("username", username);
            Cookie userw = new Cookie("username",username);
            Cookie passw = new Cookie("password",password);
            userw.setMaxAge(60*60*24*7);
            passw.setMaxAge(60*60*24*7);
            response.addCookie(passw);
            response.addCookie(userw);
            response.sendRedirect("./listStudent");
        } else {
            out.println("用户名或密码错误");

        }
    }
%>
</body>
</html>
