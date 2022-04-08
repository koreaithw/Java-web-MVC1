<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 목록 출력</title>
</head>
<body>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


<%@ include file="menu.jsp" %>
<div class = "container bg-warning shadow mx-auto mt-5 p-5 w-75">


<%@ include file="database_connect.inc" %>
<%
			//테이블 데이터 넣는 sql 구문
		String sql = "SELECT * FROM student"; //데이터를 가져오기
		pstmt = conn.prepareStatement(sql); //구문을 담은 sql객체를 pstmt에 넣는다

		rset = pstmt.executeQuery(); //sql객체 실행.
%>


		<table class="table table-success table-striped">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">학번</th>
      <th scope="col">이름</th>
      <th scope="col">성별</th>
      <th scope="col">학년</th>
      <th scope="col">전공</th>
      <th scope="col">주소</th>
    </tr>
  </thead>
<%
	int num=1;
	while(rset.next()){ //데이터가 rset에 있을동안 돌아라..
		String hakbun = rset.getString("hakbun");
		String name = rset.getString("name");
		String gender = rset.getString("gender");
		String year = rset.getString("year");
		String dept = rset.getString("dept");
		String addr = rset.getString("addr");
%>
	

  <tbody>
    <!-- 반복될 구문 -->
    <tr>
      <th scope="row"><%=num %></th>
      <td><%=hakbun %> </td>
	  <td><%=name %> </td>
	  <td><%=gender %> </td>
      <td><%=year %> </td>
	  <td><%=dept %> </td>
	  <td><%=addr %> </td>
    </tr>
    
  </tbody>
<%	
	num++;
	}
%>
</table>

<div class="btn-group">
  <a href="univ_table_list.jsp#" class="btn btn-primary active" aria-current="page">학생목록</a>
  <a href="univ_table_input_form.jsp#" class="btn btn-primary">학생등록	</a>
  <a href="#" class="btn btn-primary">학생삭제	</a>
</div>


<%@ include file="database_close.inc" %>
<%

%>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</div>
</body>
</html>