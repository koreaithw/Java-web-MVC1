<%@page import="java.sql.*"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//객체 3개
Connection conn = null; //연결객체
PreparedStatement pstmt = null; //구문객체
ResultSet rset = null;//결과객체

//jdbc 드라이버 로딩
	Class.forName("com.mysql.jdbc.Driver");
//디비연결
	String url = "jdbc:mysql://localhost:3306/university";
	String id = "root";
	String pw = "0000";
	
	conn = DriverManager.getConnection(url, id, pw);
	//디비 검색
	String hakbun = request.getParameter("hakbun");
	String sql = "SELECT * FROM student where hakbun=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, hakbun);

	rset = pstmt.executeQuery(); //결과를 받는것(학생정보)
	// 	rset = pstmt.executeUpdate(); //결과를 sql에 적용하는것
//질의 결과 확인
if(!rset.isBeforeFirst()){ //넘어온 결과가 없으면.
	out.print("<script>alert('존재하지 않는 학생입니다!!');"
	+"history.back()" //history.back()하나 이전의 페이지로 가는 구문
	+"</script>"); 
	
}
out.print("학생정보 검색 성공!<br>");
rset.next(); //다음 즉 첫번쨰로 이동
String db_hakbun = rset.getString("hakbun");
String db_name = rset.getString("name");
if(hakbun.equals(db_hakbun)){
	session.setAttribute("hakbun", db_hakbun);
	session.setAttribute("name", db_name);
	out.print(session.getAttribute("hakbun")+"("+session.getAttribute("name")+") 님 방문 환영합니다.<br>");
}
	
%>
</body>
</html>
