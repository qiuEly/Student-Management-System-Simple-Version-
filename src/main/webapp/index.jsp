<%@ page import="java.sql.Connection" %>
<%@ page import="com.example.demo2.Dao.DBUtil" %>
<%@ page import="com.example.demo2.Student" %>
<%@ page import="com.example.demo2.Dao.UserDao" %><%--
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
    <style>
      body{
            background-image: url("https://w.wallhaven.cc/full/1p/wallhaven-1pd1o9.jpg");
            align-items: center;
          display: flex;
          justify-content: center;
      }
      .login-container {

          padding :20px;
          border-radius: 8px;
          box-shadow: 0 4px 8px rgba(0,0,0,0.2);
          width: 300px;
      }
      .login-container h2 {
            text-align: center;
      }
      .login-container form {
            display: flex;
            flex-direction: column;
            align-content: center;
      }
      .login-container input[type = "submit"]{
          background-color: #007BFF;
          padding : 10px;
          border : none;
          border-radius: 4px;
          width : 100%;
      }
    </style>
    <script src = "https://cdn.staticfile.org/jquery/3.7.1/jquery.js"></script>
    <script>
        $(document).ready(function() {
            $('#username').blur(function() { // 当用户名输入框失去焦点时执行
                var username = $(this).val(); // 获取用户名输入框的值
                console.log(username);
                $.ajax({
                    url: './sameName',
                    type: 'POST', // 使用POST方法传递数据
                    data: {username: username},
                    success: function(data) { // 成功接收到返回数据时执行
                        console.log(data);
                        if (data != "success") {
                            $('#username-message').text('用户名不存在').css('color', 'red');
                        } else {
                            $('#username-message').hide();
                        }
                    },
                    error: function() { // 接收返回数据失败时执行
                        alert('Ajax请求失败，请重试！');
                    }
                });
            });
        });
    </script>
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

<%--尝试cookie登录--%>
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
<div class = "login-container">
    <h1 align="center">学生信息管理系统Web版</h1>
    <h2>用户登录</h2>
    <form action="./index.jsp" method="post" align="center">
        <label for="username">用户名</label><input type="text" name="username" id="username" value="<%=name%>" required/>
        <span id = "username-message"></span>
        <label for="password">密码</label><input type="password" name="password" id="password" value="<%=pass%>" required/>
        <input type="submit" value="submit"/>

        <p id = 'register'>
            还没有账号?
        <a href = "./register.jsp" id = 'reg'>注册</a>
        </p>
    </form>
</div>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    if (username != null && password != null) {
//        new DBUtil();
//        设置cookie
        UserDao userdao = new UserDao();
        try {
            if (userdao.getUser(username, password) ){
                session.setAttribute("username", username);
                Cookie userw = new Cookie("username", username);
                Cookie passw = new Cookie("password", password);
                userw.setMaxAge(60 * 60 * 24 * 7);
                passw.setMaxAge(60 * 60 * 24 * 7);
                response.addCookie(passw);
                response.addCookie(userw);
                response.sendRedirect("./listStudent");
            } else {
                out.println("用户名或密码错误");
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
%>
</body>
</html>
