<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<%@ include file="menu.jsp" %>
<div class = "container bg-warning shadow mx-auto mt-5 p-5 w-75">
	<%@ include file="database_connect.inc" %>
	<%
		//디비 검색
			String hakbun = request.getParameter("hakbun");
			//sql 안에서 사용될 구문
			String sql="SELECT * FROM student where hakbun = ?"; //? 자리에 
			pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, hakbun);  //~~~~~~~~~~~~~~~~~~~~~이것이 들어감. jsp는 1부터 시작
			rset = pstmt.executeQuery(); //정보를 주고 넘겨 받은것을 rset에 저장
			//질의 결과 확인
			if (!rset.isBeforeFirst()) { //자바 안의 자바 스크립.... 찾는 학번이 없을경우
				out.print("<script> alert('존재하지 않는 학생입니다.!!');" + "history.back();" + " </script>");
			} else {
				out.print("학생 정보 검색 성공!<br>");

				rset.next(); // 다음 ,즉, 첫번째로 이동.

				String db_hakbun = rset.getString("hakbun");
				String db_name = rset.getString("name");
				if (hakbun.equals(db_hakbun)) {
					session.setAttribute("hakbun", db_hakbun);
					session.setAttribute("name", db_name);
					out.print(session.getAttribute("hakbun") + "(" + session.getAttribute("name") + ") 님 방문을 환영합니다.");
				}
			}
	%>
	<%@ include file="database_close.inc" %>
</div>
	<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>