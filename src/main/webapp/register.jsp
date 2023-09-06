<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2023/9/6
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        body{
            background-image: url("https://w.wallhaven.cc/full/1p/wallhaven-1pd1o9.jpg");
            align-items: center;
            display: flex;
            justify-content: center;
        }
        .register-container {

            padding :20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
            width: 300px;
        }
        .register-container h2 {
            text-align: center;
        }
        .register-container form {
            display: flex;
            flex-direction: column;
            align-content: center;
        }
        .register-container input[type = "submit"]{
            background-color: #007BFF;
            padding : 10px;
            border : none;
            border-radius: 4px;
            width : 100%;
        }
    </style>
    <title>Register界面</title>
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
                        if (data == "success") { // 用户名可用
                            $('#username-message').text('用户名存在').css('color', 'red');
                        } else { // 用户名已存在
                            $('#username-message').text('用户名可用').css('color', 'green');
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
<div class = "register-container">
    <h2>注册</h2>
    <form action="./register">
        <label id = "lableName">
                  用户名：
             <input type="text" name = "username" id = "username">
       </label>
             <span id = "username-message"></span>
       <label>
                密码：
             <input type="password" name = "password" id = "password">
       </label>
        <input type="submit" value = "注册">
    </form>
    </div>
</body>
</html>
