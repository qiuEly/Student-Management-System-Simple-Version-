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
        <button id = "submit">注册</button>
</form>
</body>
</html>
