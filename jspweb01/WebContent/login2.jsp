<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% //자바 영역.
request.setCharacterEncoding("utf-8");
String uid = request.getParameter("id");
String res = "<h3>User ID:"+uid+"</h3>";
out.print(res);

%>
</body>
</html>