<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

session.invalidate(); //세션을 끊어서 로그아웃함.
response.sendRedirect("/user/login.jsp"); 







%>