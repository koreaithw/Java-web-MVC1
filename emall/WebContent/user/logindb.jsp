<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String uid = request.getParameter("uid");
	String upw = request.getParameter("upw");
	
	UserDAO dao = new UserDAO();
	int res = dao.login(uid, upw);

	if(res==1){ //실패 케이스 1( 아이디가 아예 없음.)
		out.print("<script>alert('존재하지 않는 아이디 입니다.');");
		out.print("location.href='useradd.jsp'");
		out.print("</script>");
	}else if(res==2){
		out.print("<script>alert('비밀번호가 틀립니다.');");
		out.print("location.href='login.jsp'");
		out.print("</script>");   //비번이 틀린 케이스 이므로 다시
	}else{
		session.setAttribute("uid",	uid);
		response.sendRedirect("/product/productlist.jsp");
	}
%>