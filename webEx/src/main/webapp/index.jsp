<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- jsp 주석 --%>
<%-- JSP : Java Server Page --%>
<%-- html 문서 안에 Java 언어가 포함되는 형식 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	hello world

	<% // 스크립틀릿 : 자바문장이 작성되는 구간을 태그로 표시 
			int num = 10;
		// 표현식 : 자바변수를 가져와주는 것
	%>

<h1><%=num %></h1>

<%
// 모든 자바 문장을 작성할 수 있고 (html문서 안에서 자바의 제어문 사용이 가능하다)
// . 조건문 if, if-else, switch-case
// . 반복문 while, do-while, for
// . 보조제어문 break, continue

// 구구단 출력하기
// . 2~9단까지
// . 브라우저 안에 출력
// . 표로 그리기

// [xx단]
// 2x1 =2...
%>

<table border="1">
<%for(int i = 2; i < 10; i++){%>
	<th colspan="9"><%=i %>단</th>
	<tr>
	<%for(int j = 1; j < 10; j++){%>
		<td><h3><%=i %> X <%=j %> = <%=i*j %></h3></td>
	<%}%>
	</tr>
<%}
%>
</table>

</body>
</html>