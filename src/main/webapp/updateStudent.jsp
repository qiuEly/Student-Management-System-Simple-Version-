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
</head>
<body>
    <form action="${pageContext.request.contextPath}/updateStudent">
        <table>
            <tr>请输入要修改的学生信息:</tr>
            <tr>
                <td>姓名:</td>
                <td><label>
                    <input type="text" name="name">
                </label></td>
            </tr>
            <tr>
                <td>性别:</td>
                <td><label>
                    <input type="text" name="sex">
                </label></td>
            </tr>
            <tr>
                <td>年龄:</td>
                <td><label>
                    <input type="number" name="age">
                </label></td>
            </tr>
            <tr>
                <td>成绩:</td>
                <td><label>
                    <input type="number" name="score">
                </label></td>
            </tr>
            <tr> <td><input type="submit" value="提交" ></td>> </tr>
        </table>
    </form>
</body>
</html>
