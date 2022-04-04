<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<b>forward 액션태그</b>
<%
	String msg = "forward 액션태그 테스트";
%>
<!-- 1부터 10까지 정수합 -->
<jsp:forward page="inc_sum_for.jsp"/>; <!-- 이 사이트를 가서 돌아오지 않음  -->
<p>forward 액션태그 </p>
메세지 출력 : <%=msg %>
</body>
</html>