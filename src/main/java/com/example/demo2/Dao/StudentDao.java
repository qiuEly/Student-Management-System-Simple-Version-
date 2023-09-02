package com.example.demo2.Dao;

import com.example.demo2.Student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


//jdbc实现学生管理系统
public class StudentDao {
    private Connection conn;//数据库连接对象
    String sql;
    //用于初始化表数据的方法，已经弃用
    public void build() throws Exception {
        setConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.executeUpdate();
            sql = "insert into students(name,sex,age,score) values('张三','男',18,100),('李四','男',19,99),('王五','女',17,98),('赵六','男',18,97),('田七','女',19,96)";
            ps = conn.prepareStatement(sql);
            int i = ps.executeUpdate();
//            System.out.println("成功插入"+i+"条数据");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    //正向查询学生信息，将学生信息返回到一个List中,方便jsp处理
    public List<Student> queryAllByScore() throws Exception {
        setConnection();
        List<Student> students = new ArrayList<Student>();
        sql = "select * from students order by score";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Student student = new Student();
                student.setName(rs.getString("name"));
                student.setAge(rs.getInt("age"));
//                student.setId(rs.getInt("id"));
                student.setSex(rs.getString("sex"));
                student.setScore(rs.getDouble("score"));
                students.add(student);
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }
    //添加学生信息
    public void add(Student student) throws Exception {
        setConnection();
        sql = "insert into students(name,sex,age,score) values(?,?,?,?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);//使用prepareStatement可以防止sql注入
            ps.setString(1,student.getName());
            ps.setString(2,student.getSex());
            ps.setInt(3,student.getAge());
            ps.setDouble(4,student.getScore());
            ps.executeUpdate();
//            queryAll();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    //删除学生信息
    public void delete(String name) throws Exception {
        setConnection();
        sql = "delete from students where name = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,name);
            ps.executeUpdate();
            System.out.println("成功删除"+name);
//            queryAll();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
   //  更新 学生信息
    public void update(Student student) throws Exception {
        setConnection();
        sql = "update students set  sex = ? , age = ? , score = ? where name = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(4,student.getName());
            ps.setString(1,student.getSex());
            ps.setInt(2,student.getAge());
            ps.setDouble(3,student.getScore());
            ps.executeUpdate();
//            queryAll();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    //倒序查询学生信息
    public List<Student> queryAllByScoreDesc() throws Exception {
        setConnection();
        List<Student> students = new ArrayList<Student>();
        sql = "select * from students order by score desc";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Student student = new Student();
                student.setName(rs.getString("name"));
                student.setAge(rs.getInt("age"));
//                student.setId(rs.getInt("id"));
                student.setSex(rs.getString("sex"));
                student.setScore(rs.getDouble("score"));
                students.add(student);
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }
    //获取连接对象
    public void setConnection() throws Exception {
        conn = DBUtil.getConnection();
    }
    //根据姓名查询学生信息(前端忘记实现)
    public Student get(String name) throws Exception {
        try {
            setConnection();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        Student student = new Student();
        sql = "select * from students where name = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1,name);
        ResultSet rs = ps.executeQuery();
        if (rs.next()){
            student.setName(rs.getString("name"));
            student.setAge(rs.getInt("age"));
            student.setId(rs.getInt("id"));
            student.setSex(rs.getString("sex"));
            student.setScore(rs.getDouble("score"));
        }
        return student;
    }

}
