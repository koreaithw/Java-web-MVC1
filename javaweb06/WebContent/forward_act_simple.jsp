<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<b>forward 단일 파라미터</b>
<%
	request.setCharacterEncoding("utf-8");
	String msg = "forward 단일 파라미터";

%>

<jsp:forward page="inc_act_simple.jsp">
	<jsp:param value="p1값" name="para1"/>
	<jsp:param value="p2값" name="para2"/>
	<jsp:param value="p3값" name="para3"/>
</jsp:forward>
<p>forward 단일 파라미터 </p>
메세지 출력 : <%=msg %>
</body>
</html>