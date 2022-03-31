<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC 드라이버 로딩</title>
</head>
<body>
<%
//JDBC 드라이버 로딩 테스트
	try{
		Class.forName("com.mysql.jdbc.Driver"); //WEB_INF에 lib에 connector파일이 들어있나 확인하는 구문,
		out.print("JDBC Driver loading 성공!!<br>");
	}catch(ClassNotFoundException e){
		out.print("JDBC Driver loading 실패!!<br>");
	}


// 	Connection conn = DriverManager.getConnection("jdbc:mysql:localhos:3306/mysns","root","0000");
	
%>
</body>
</html>