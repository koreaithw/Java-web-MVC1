<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%
		String uid = (String) session.getAttribute("id");
	if(uid==null){
		response.sendRedirect("/user/login.jsp");
		return;
	}
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 보기</title>
</head>
<body>
<%! //선언문
	String title = "상세보기";
%>
 <!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<%@ include file="/_header.jsp" %>

	<div class="alert alert-secondary" role="alert" >
		<div class="container">
			<h1 class="display-3">
				<%=title%></h1>
		</div>
	</div>
	<%
		String pid = request.getParameter("pid");
		
		ProductDTO product = (new ProductDAO()).getDetail(pid);
		
	%>
	<div class="container">
		<div class="row">
			<div class="col-ma-5">
				<img src="" style="width: 100%">
			</div>
			<div class="col-ma-6">
				<h3><%=product.getPname()%></h3>
				<p><%=product.getPdesc()%>
				<p>
					<b>상품가격 : <%=product.getPid()%></b>
				<p>
					<b>상품가격 : <%=product.getPprice()%></b> 
					<!-- class="btn btn-info" 버튼 파란색 -->
					<a href="" class="btn btn-info" role="button">상품 주문</a>
					<!-- class="btn btn-secondary" 버튼 검정색 -->
					<a href="productlist.jsp" class="btn btn-secondary" role="button">상품목록</a>
			</div>
		</div>
	</div>


	<%@ include file="/_footer.jsp" %>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>