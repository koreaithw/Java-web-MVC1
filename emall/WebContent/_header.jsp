<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
@font-face {
    font-family: 'KyoboHandwriting2020A';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2112@1.0/KyoboHandwriting2020A.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
body{
	font-family: 'KyoboHandwriting2020A';
	padding-botton : 70px;
}
</style>

<body>
<%
	String uid = (String)session.getAttribute("uid");
%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark" aria-label="Ninth navbar example">
  <div class="container-fluid">
    
         <a class="navbar-brand" href="#">이 몰</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/product/productlist.jsp">상품목록</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
          		  회원
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <li><a class="dropdown-item" href="/user/login.jsp">로그인</a></li>
            <li><a class="dropdown-item" href="/user/logout.jsp">로그아웃</a></li>
            <li><a class="dropdown-item" href="#">주문목록</a></li>
            <li><a class="dropdown-item" href="/user/useradd.jsp">회원가입</a></li>
            <li><a class="dropdown-item" href="#">회원탈퇴</a></li>
          </ul>
        </li>
       
		<li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
      		   관리
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <li><a class="dropdown-item" href="#">회원관리</a></li>
            <li><a class="dropdown-item" href="#">제품관리</a></li>
            <li><a class="dropdown-item" href="#">판매관리</a></li>
            <li><a class="dropdown-item" href="../board/boardlist.jsp">게시판관리</a></li>
          </ul>
        </li>
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
           		게시판
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <li><a class="dropdown-item" href="#">공지사항</a></li>
            <li><a class="dropdown-item" href="/board/boardwrite.jsp">질문답변</a></li>
            <li><a class="dropdown-item" href="/board/boardlist.jsp">자유게시판</a></li>
          </ul>
        </li>
       <%
    	if(uid==null){//로그인 세션이 없으면
    	%>
         <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/user/login.jsp">로그인</a>
        </li>
         <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/user/useradd.jsp">회원가입</a>
        </li>
        <%}else{//로그인 세션 있으면, 
        %> 
        

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> 마이페이지 </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
							<li><a class="dropdown-item" href="/user/useradd.jsp@">회원
									정보 수정</a></li>
							<li><a class="dropdown-item" href="#">회원 탈퇴</a></li>
							<li><a class="dropdown-item" href="#">내가 쓴글</a></li>
						</ul></li>

		<%
			}
		%>
		</ul>
    </div>
  </div>
</nav>
</body>
    