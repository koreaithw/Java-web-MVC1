<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	 request.setCharacterEncoding("utf-8");
// JDBC 드라이버 로딩
	Class.forName("com.mysql.jdbc.Driver"); //WEB_INF에 lib에 connector파일이 들어있나 확인하는 구문,
// DB 연결
	String url = "jdbc:mysql://localhost:3306/emall";
	String id = "root";
	String pw = "0000";
	
	Connection conn = null;  //DB 연결객체
	PreparedStatement pstmt = null; //DB에 전달할 SQL 구문객체.
	conn = DriverManager.getConnection(url,id,pw);
//테이블 데이터 삽입 SQL

	//univ_table_input.html에서 입력한것을 받야하한다.
	String btitle = request.getParameter("btitle");
	String buser = request.getParameter("buser");
	String bcontent = request.getParameter("bcontent");
	
	String sql = "INSERT INTO board VALUES(bid,?,?,?,now())";
	
	pstmt = conn.prepareStatement(sql);  //sql객체를 pstmt에 넣는다
		pstmt .setString(1, btitle);  //sql구문의 ? 자리에 넣을값 지정
		pstmt .setString(2, bcontent);  //sql구문의 ? 자리에 넣을값 지정
		pstmt .setString(3, buser);  //sql구문의 ? 자리에 넣을값 지정
		
	pstmt.executeUpdate();				//sql객체 실행.
	
// DB연결 종료.
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
		
	response.sendRedirect("../board/boardlist.jsp"); //페이지 이동 구문
%>