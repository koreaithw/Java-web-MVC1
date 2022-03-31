<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터 베이스 연결</title>
</head>
<body>

<%
//데이터 베이스 연결 테스트
//1.드라이버 로드
	try{
		Class.forName("com.mysql.jdbc.Driver"); //WEB_INF에 lib에 connector파일이 들어있나 확인하는 구문,
		out.print("JDBC Driver loading 성공!! by 13김현엽<br>");
	}catch(ClassNotFoundException e){
		out.print("JDBC Driver loading 실패!!<br>");
	}
//2.DB 연결
	String url = "jdbc:mysql://localhost:3306/";
	String id = "root";
	String pw = "0000";
	Connection conn = null;
	try{
		conn = DriverManager.getConnection(url,id,pw);
		out.print("SQL DB 연결 성공 by 13김현엽<br>");
	}catch(SQLException sqlerr){
		out.print("SQL DB 연결 실패<br>");		
	}finally{
		//데이터베이스 연결 종료.
		if(conn != null){
			try{
				conn.close();
				out.print("SQL 서버 연결 종료<br>");
			}catch(Exception conerr){
				conerr.printStackTrace();
			}
		}
	}
	
%>
</body>
</html>