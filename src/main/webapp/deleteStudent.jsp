<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2023/9/2
  Time: 11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form  action="${pageContext.request.contextPath}/deleteStudent">
        <label>请输入要删除的学生信息:</label>
        <label>
            <input type="text" name = "name"/>
        </label>
    </form>

</body>
</html>
