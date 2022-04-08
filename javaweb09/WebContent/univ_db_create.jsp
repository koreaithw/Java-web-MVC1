<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 데이터 베이스 생성</title>
</head>
<body>
<%
	//드라이버 로딩
		Class.forName("com.mysql.jdbc.Driver"); //WEB_INF에 lib에 connector파일이 들어있나 확인하는 구문,
	//2.DB 연결
	String url = "jdbc:mysql://localhost:3306/";
	String id = "root";
	String pw = "0000";
	
	Connection conn = null;			// 연결객체
	PreparedStatement pstmt = null; // 구문객체
	
		conn = DriverManager.getConnection(url,id,pw);
		
		String sql = "CREATE DATABASE university";
		pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate();
		//데이터베이스 연결 종료.
		if(conn != null) conn.close();
%>
</body>
</html>