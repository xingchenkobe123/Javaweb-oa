package com;

import java.sql.*;
public class jdbcmysql {
  public static void main(String args[]) {
    try {
      Class.forName("com.mysql.cj.jdbc.Driver");     //加载MYSQL JDBC驱动程序   
      //Class.forName("org.gjt.mm.mysql.Driver");
     System.out.println("Success loading Mysql Driver!");
    }
    catch (Exception e) {
      System.out.print("Error loading Mysql Driver!");
      e.printStackTrace();
    }
    try {
      Connection connect = DriverManager.getConnection(
          "jdbc:mysql://localhost:3306/oa?useUnicode=true&characterEncoding=utf-8&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","password");
      System.out.println("Success connect Mysql server!");
      Statement stmt = connect.createStatement();
      ResultSet rs = stmt.executeQuery("select * from worker");
                  //user 为你表的名称，可以在MySQL命令行用show tables；显示
while (rs.next()) {
        System.out.println(rs.getString("name"));
      }
    }
    catch (Exception e) {
      System.out.print("get data error!");
      e.printStackTrace();
    }
  }
}


