<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--

구구단 랜덤 문제 출제 (5개)
form 안에 table 형식으로 문제와 답 입력 칸 제시
사용자가 입력한 답을 -> pro 페이지에서 검증 후 -> 성적표 출력(정오표)

column : no, quiz, input
pro column : no, quiz, answer, dap, O/X -> 점수 (100)

 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	Random random = new Random();
	%>
	<form method="get" action="gugudanPro_정답.jsp">
		<table border="solid 1px" style="border-collapse: collapse;">
			<tr>
				<td>no</td>
				<td>quiz</td>
				<td>input</td>
			</tr>

			<%for(int i =0; i < 5; i++){
        		int x = random.nextInt(8) + 2;
        		int y = random.nextInt(10) + 1;
        		String quiz = String.format("%d X %d =", x, y);
        	%>
			<tr>
				<td><%=i+1 %></td>
				<td>
					<%=quiz%>
					<input type="hidden" name="<%="quiz"+(i+1)%>" value="<%=quiz %>">
				</td>
				<td>
					<input type="number"  name="<%="answer"+ (i+1) %>"  required>
					<input type="hidden" name="<%="dap"+ (i+1) %>" value ="<%=x*y%>">
				</td>
			</tr>
			<%} %>
		</table>
		<input type="submit">
		<!-- http://localhost:8081/webEx/gugudanPro_%EC%A0%95%EB%8B%B5.jsp?answer1=1&dap1=42&answer2=2&dap2=42&answer3=3&dap3=36&answer4=4&dap4=42&answer5=5&dap5=56 -->
	</form>
</body>
</html>