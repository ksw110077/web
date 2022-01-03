<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="05_01_agreeFunction.js"></script>
</head>
<body>
<%
	String id = (String)session.getAttribute("log");
	if(id == null){
	%>
	<div class="joinFormDiv">
		<form method="post" action="01_main.jsp?center=06_join.jsp">
			<input type="checkbox" id="check" class="all" onclick="checkAll()"><span>모두동의</span><br><br>
        	<input type="checkbox" id="check" name="required"><span>필수1</span><br>
        	<input type="checkbox" id="check" name="required"><span>필수2</span><br>
        	<input type="checkbox" id="check" name="option"><span>선택1</span><br>
        	<input type="checkbox" id="check" name="option"><span>선택2</span><br>
        	<input type="checkbox" id="check" name="option"><span>선택3</span><br>
        	<input type="button" onclick="checkAgree(form)" value="확인">
		</form>
	</div>
	<%	
	}
	else {
		response.sendRedirect("01_main.jsp");
	}
%>

</body>
</html>