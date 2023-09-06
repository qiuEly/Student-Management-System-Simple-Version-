<%@ page import="com.example.demo2.Dao.StudentDao" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.demo2.Student" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2023/9/1
  Time: 22:29
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
              /*display: flex;*/
              justify-content: center;
          }

          h2 {
                text-align: center;
                color: #ffffff;
                font-family: Arial, Helvetica, sans-serif;
                font-size: 30px;
                font-weight: 800;
                padding: 20px;
          }
          .table-container tr {


                font-family: Arial, Helvetica, sans-serif;
                font-size: 20px;
                font-weight: 800;
                padding: 20px;
                text-align: center;

          }



      </style>
  </head>
  <body><h2>学生信息管理系统Web版</h2>
  <table width="800" frame="box" class="table-container">

    <tr>
<%--      <th height="35">序号</th>--%>
      <th>姓名</th>
      <th>性别</th>
      <th>分数</th>
    </tr>
    <%---没有加jdbc注册呀--%>
    <%--出现的问题：需要把对应的数据库驱动jar包放在tomcat的lib目录下    --%>
  <%
    List<Student> students = (List<Student>) request.getAttribute("students");
    for (Student student : students) {
  %>
    <tr>
<%--      <td align="center"><%=student.getId()%></td>--%>
      <td align="center"><%=student.getName()%></td>
      <td align="center"><%=student.getSex()%></td>
      <td align="center"><%=student.getScore()%></td>
<%
    }
%>
    </tr>
    <tr>
        <th> <a href="deleteStudent.jsp">删除某个学生信息</a> </th>
        <th><a href="addStudent.jsp">添加学生信息</a> </th>
        <th><a href="updateStudent.jsp">修改学生信息</a> </th>
        <th><a href="./listDesc">按照成绩降序查看</a> </th>
    </tr>
  </table>
  </body>
</html>
