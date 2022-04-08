<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<b>속성 삭제</b><br>
세션 아이디:<%=session.getAttribute("id") %><br>
세션 네임   :<%=session.getAttribute("name") %><br>

<%
session.removeAttribute("id");
session.removeAttribute("name");
out.print("세션 삭제 완료!<br>");
%>

<b>속성 확인</b><br>
세션 아이디:<%=session.getAttribute("id") %><br>
세션 네임   :<%=session.getAttribute("name") %><br>

<p><a href="session_check.jsp">[세션 확인] </a>
</body>
</html>