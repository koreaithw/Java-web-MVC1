<%@page import="java.sql.*"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교수 목록 만들기</title>
</head>
<body>

<%
// JDBC 드라이버 로딩
	Class.forName("com.mysql.jdbc.Driver"); //WEB_INF에 lib에 connector파일이 들어있나 확인하는 구문,
// DB 연결
	String url = "jdbc:mysql://localhost:3306/univ";
	String id = "root";
	String pw = "0000";
	
	Connection conn = null;  //DB 연결객체
	PreparedStatement pstmt = null; //DB에 전달할 SQL 구문객체.
	conn = DriverManager.getConnection(url,id,pw);
//테이블 만들기 SQL 
	String sql = "CREATE TABLE professor("
			+"kyobun int not null,"
			+"name varchar(10),"
			+"major varchar(20),"
			+"primary key(kyobun))";  //학번을 대표로 지정.

pstmt = conn.prepareStatement(sql);  //sql객체를 pstmt에 넣는다
	pstmt.executeUpdate();				//sql객체를 던짐.
	
// DB연결 종료.
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
	
	out.print("DB 연결 문제없음");
%>
</body>
</html>