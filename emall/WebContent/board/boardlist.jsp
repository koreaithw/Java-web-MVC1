<%@page import="java.util.Date"%>
<%@page import="jdbc.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style type="text/css">
a, a:hover{
color : #000000;
text-decoration : none;
}
</style>
</head>
<body>

<%
	String id = (String) session.getAttribute("uid");
	if(session.getAttribute("uid")==null){
		response.sendRedirect("/user/login.jsp");
		return;
	}
%>
	<%!//선언문
	String title = "게시판 목록";%>
	<!-- CSS only -->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
		crossorigin="anonymous">
	<%@ include file="/_header.jsp"%>
	

	<div class="alert alert-secondary" role="alert">
		<div class="container">
			<h1 class="display-3">
				<%=title%></h1>
		</div>
	</div>

	<div class="container">
		<div class="row" align="center">
		
			
		
			<div class="container my-3">
				<table class="table">
					<thread>
					<tr class="table-dark">
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>내용</th>
						<th>작성일시</th>
						
					</tr>
					</thread>
					<tbody>


						<%
							ArrayList<BoardDTO> boards = (new BoardDAO()).getList();
						for (BoardDTO board : boards) {
							String img = board.getBimage();
							String imgstr = "";
							
						 	if (img != null) {
						 		imgstr = "<img src='../images/" + img + "' style='width:100%'>";
						 	} 
							
						%>
						<tr>
							<td><%=board.getBid()%></td>
							<td><a href="boardview.jsp?bid=<%=board.getBid()%>"><%=board.getBtitle()%></a></td>
							<td><%=board.getBuser()%></td>
							<td><%=board.getBcontent()%></td>
							<td><%=board.getBdate()%></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
				
			</div>
		
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<a href="../board/boardwrite.jsp"><button class="btn btn-info" type="button">
				글쓰기</button></a>
			</div>
		
		</div>
	</div>
	<hr>

	</div>





	<%@ include file="/_footer.jsp"%>
	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>
