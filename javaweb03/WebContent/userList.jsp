<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql:localhos:3306/mysns","root","0000");
	
// 	Statement stmt = conn.createStatement();
// 	ResultSet rs = stmt.executeQurey("Select id, name From user");

%>