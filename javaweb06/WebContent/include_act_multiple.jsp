<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include  액션태그 multiple</title>
</head>
<body>
<b>include 다중파라미터</b><br>


<jsp:include page="inc_act_multiple.jsp">
	<jsp:param name="para1" value="p1 값" />
	<jsp:param name="para1" value="p1 값2" />
	<jsp:param name="para1" value="p1 값3" />
	<jsp:param name="para2" value="p2 값" />
	<jsp:param name="para3" value="p3 값" />
</jsp:include>

</body>
</html>