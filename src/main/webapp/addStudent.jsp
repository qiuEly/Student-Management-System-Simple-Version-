<%@ page import="com.example.demo2.Student" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2023/9/2
  Time: 10:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加信息</title>
    <style>
        body{
            background-image: url("https://w.wallhaven.cc/full/1p/wallhaven-1pd1o9.jpg");
            align-items: center;
            display: flex;
            justify-content: center;
        }
        .form-container{

            padding :20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
            width: 300px;
        }
        .form-container h2 {
            text-align: center;
        }
        .form-container form {
            display: flex;
            flex-direction: column;
            align-content: center;
        }
        .form-container input[type = "submit"]{
            background-color: #007BFF;
            padding : 10px;
            border : none;
            border-radius: 4px;
            width : 100%;
            align-items: center;
        }
    </style>
    <script src = "https://cdn.staticfile.org/jquery/3.7.1/jquery.js"></script>
    <script>
        $(document).ready(function() {
            $('#name').blur(function() { // 当用户名输入框失去焦点时执行
                var name = $(this).val(); // 获取用户名输入框的值
                console.log(name);
                $.ajax({
                    url: './sameStudent',
                    type: 'POST', // 使用POST方法传递数据
                    data: {name: name},
                    success: function(data) { // 成功接收到返回数据时执行
                        console.log(data);
                        if (data == "success") { // 用户名可用
                            $('#name-message').text('学生已存在').css('color', 'red');
                        } else { // 用户名已存在
                            $('#name-message').hide();
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
<div class="form-container">
 <form action="${pageContext.request.contextPath}/addStudent" >

     <h2>请输入要添加的学生信息:</h2>


            <label>
                姓名:
                <input type="text" name="name" id = "name">
            </label>
            <span id = "name-message"></span>

            <label>性别:
                <input type="text" name="sex">
            </label>



            <label>年龄:
                <input type="number" name="age">
            </label>



            <label> 成绩:
                <input type="number" name="score" step="0.1">
            </label>

        <input type="submit" value="提交" >

     </form>
</div>
</body>
</html>
