<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 테이블 만들기</title>
</head>
<body>
<%@ include file="database_connect.inc" %>
<%
//테이블 만들기 SQL 
	String sql = "CREATE TABLE student("
			+"hakbun int not null,"
			+"name varchar(10),"
			+"gender varchar(10),"
			+"year tinyint,"
			+"dept varchar(20),"
			+"addr varchar(50),"
			+"primary key(hakbun))";  //학번을 대표로 지정.

pstmt = conn.prepareStatement(sql);  //sql객체를 pstmt에 넣는다
	pstmt.executeUpdate();				//sql객체를 던짐.
%>
<%@ include file="database_close.inc" %>
</body>
</html>