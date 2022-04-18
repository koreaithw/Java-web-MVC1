<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 작성</title>


</head>
<body>
	<%!//선언문
	String title = "공지사항 작성";%>
	<!-- CSS only -->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
		crossorigin="anonymous">

	<%@ include file="/_header.jsp"%>

	<div class="alert alert-secondary" role="alert">
		<div class="container">
			<h1 class="display-3">
				<%=title%></h1>
		</div>
	</div>


<div class="container" style="padding-top:30px;">
     <form name="newProduct" class="form-horizontal"  action="boardwritedb.jsp" method="post">
       <div class="form-group  row">
          <label class="col-sm-2">제목</label>
              <div class="col-sm-4">
              <input name="btitle" type="text" class="form-control" placeholder="Enter the Title" >
       </div>
   </div>
      <div class="form-group  row" >
         <label class="col-sm-2">작성자</label>
            <div class="col-sm-4">
              <input name="buser" type="text" class="form-control" placeholder="Enter the name" >
      </div>
   </div>
      <div class="container" >
      	 <label class="col-sm-2">내용</label>
         <textarea name="bcontent" type="text" id="myEditor" class="form-control" ></textarea>
      </div>


       <div class="form-group  row">
            <label class="col-sm-2">첨부파일</label>
            <div class="col-sm-4">
               <input name="filename" type="file" class="form-control" >
            </div>
       </div>
   <div class="col-sm-offset-5 col-sm-5">
      <input type="submit" class="btn btn-dark" value="확인 " > 
       <input type="reset" class="btn btn-dark" value="취소" onclick="reset()" >
   </div>
   
     </form>
   </div>

	<%@ include file="/_footer.jsp"%>

	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
		

</body>
</html>