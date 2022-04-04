<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<b>쿠키 확인</b>
	<%
		Cookie[] cookies = request.getCookies();
	if(cookies !=null){
		for(int i=0;i<cookies.length;i++){
			String name = cookies[i].getName();
			String value = cookies[i].getValue();
			
			out.print("쿠키이름:"+name+"<br>");
			out.print("쿠키   값:"+value+"<br>");
		}
	}else{
		out.print("설정된 쿠키 정보가 없습니다");
	}
	%>
	<p><a href="cookie_create.jsp">[쿠키생성] </a></p>
	<p><a href="cookie_edit.jsp">[쿠키변경] </a></p>
	<p><a href="cookie_delete.jsp">[쿠키삭제]</a> </p>
</body>
</html>