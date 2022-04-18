<%@page import="jdbc.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정페이지</title>
</head>
<body>
<% //id = 로그인한 사람 고유번호 123
	String id = (String) session.getAttribute("uid"); //로그인 한 사람의 id=buser
	if(session.getAttribute("uid")==null){
		response.sendRedirect("/user/login.jsp");
	}
	int bid = 0; //글의 고유번호 28
	if(request.getParameter("bid")!=null){ //28  =bid
		bid = Integer.parseInt(request.getParameter("bid"));
	}
	
%>	

	<%!//선언문
	String title = "해당게시글 수정";%>
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
	
	<%
	// 수정할때 작성자가 다르면.
	
	BoardDTO boards = (new BoardDAO()).getContent(bid);
	UserDTO user = (new UserDAO()).getName(id);
	if(!user.getUname().equals(boards.getBuser())){
		out.print("<script>alert('권한이 없습니다');");
		out.print("location.href='/board/boardlist.jsp'");
		out.print("</script>");
	}
	
	%>



	<div class="container" style="padding-top: 30px;">
		<form action="boardupdate.jsp?bid=<%=bid%>">

			<div class="form-group  row">
				<label class="col-sm-2">제목</label>
				<div class="col-sm-4">
					<input type="text" value="<%=boards.getBtitle()%>" name="btitle"
						class="form-control" placeholder="Enter the Title" maxlength="50 ">
				</div>
			</div>

			<div class="form-group  row">
				<label class="col-sm-2">작성일자</label>
				<div class="col-sm-4">
					<td><%=boards.getBdate()%></td>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">내용</label>
				<div class="col-sm-3">
					<textarea class="form-control" name="bcontent" maxlength="2048"
						style="height: 350px; width: 400px;"><%=boards.getBcontent()%></textarea>
				</div>
			</div>

			<div class="form-group  row">
				<label class="col-sm-2">첨부파일</label>
				<div class="col-sm-4">
					<input name="bimages" type="file" class="form-control">
				</div>
			</div>

			<div class="col-sm-offset-5 col-sm-5">
				<a href="boardlist.jsp" class="btn btn-primary">목록</a>
				<%
					// 로그인이 되어있고, 글의 작성자와 로그인된 네임이 같으면 수정 삭제 보이기.
				if (id != null && boards.getBuser().equals(user.getUname())) {
				%>
				<input type="submit" class="btn btn-primary pull-right" value="글 수정">
				<%
					}
				%>
			</div>
		</form>


	</div>





















	<%@ include file="/_footer.jsp"%>

	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
		
</body>
</html>