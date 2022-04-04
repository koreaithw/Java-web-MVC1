<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include 액션 태그</title>
<body>
<b>include 액션 태그</b>
<br>
<!-- 1부터 10까지 정수의 합 -->
<jsp:include page="inc_sum_for.jsp"/> <!--페이지에 가서 계산하고 출력결과를 가져옴 -->
</body>
</html>