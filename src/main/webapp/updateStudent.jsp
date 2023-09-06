<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2023/9/2
  Time: 18:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
</head>
<body>
<div class="form-container">
    <form action="${pageContext.request.contextPath}/addStudent" >

        <h2>请输入要添加的学生信息:</h2>


        <label>
            姓名:
            <input type="text" name="name">
        </label>

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
