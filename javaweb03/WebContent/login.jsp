<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Date now = new Date();
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	String date = df.format(now);
	
	if(date.endsWith("30")){
		response.sendRedirect("underCheck.jsp"); //~페이지로 이동하는 코드
		return;
	}
	String uid = request.getParameter("id");
	out.print(uid);

%>