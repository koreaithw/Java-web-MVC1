<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
	static String str = "Hello JSP";
	public static String getString(String str){
		return str;
	}
%>
<%out.print(getString(str));%>
</body>
</html>