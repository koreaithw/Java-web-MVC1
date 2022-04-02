<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 목록 출력</title>
</head>
<body>
<%
	 request.setCharacterEncoding("utf-8");

// JDBC 드라이버 로딩
	Class.forName("com.mysql.jdbc.Driver"); //WEB_INF에 lib에 connector파일이 들어있나 확인하는 구문,
// DB 연결
	String url = "jdbc:mysql://localhost:3306/univ";
	String id = "root";
	String pw = "0000";
	
	Connection conn = null;  //DB 연결객체
	PreparedStatement pstmt = null; //DB에 전달할 SQL 구문객체.
	ResultSet rset =null; //DB 에서 꺼내올 데이터 들을 담을 객체.
		
	
	conn = DriverManager.getConnection(url,id,pw);
//테이블 데이터 꺼내오는 SQL

	
	String sql = "SELECT * FROM student"; //데이터를 가져오기
	pstmt = conn.prepareStatement(sql);  //sql객체를 pstmt에 넣는다
	
	rset = pstmt.executeQuery();				//sql객체 실행.
%>
<form action="">
<table>
<caption>학생 목록</caption>
<tr>
<th>학번 </th>
<th>이름 </th>
<th>전공 </th>
</tr>
<%
	while(rset.next()){ //데이터가 rset에 있을동안 돌아라..
		String hakbun = rset.getString("hakbun");
		String name = rset.getString("name");
		String dept = rset.getString("dept");
%>
<tr>
	<td><%=hakbun %> </td>
	<td><%=name %> </td>
	<td><%=dept %> </td>
</tr>
	
<%
	}
%>

</table>
</form>

<%
// DB연결 종료.
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
%>
</body>
</html>