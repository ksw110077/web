<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--

구구단 랜덤 문제 출제 (5개)
form 안에 table 형식으로 문제와 답 입력 칸 제시
사용자가 입력한 답을 -> pro 페이지에서 검증 후 -> 성적표 출력(정오표)

column : no, quiz, input
pro column : no, quiz, answer, dap, O/X -> 점수 (100)

 --%>
	<form method="POST" action="gugudanPro.jsp">
		<table>
			<%
			for (int i = 0; i < 5; i++) {
			%>
			<tr>
				<%
				Random rn = new Random();
				int f = rn.nextInt(8) + 2;
				int b = rn.nextInt(9) + 1;
				String fN = "f" + (i + 1);
				String bN = "b" + (i + 1);
				String aN = "a" + (i +1);
				String rN = "r" +(i+1);
			%>
				<td><span><%=(i+1)%>번 문제</span></td>
				<td><input type="text"  value="<%=f %>" readonly name = "<%=fN %>"></td>
				<td>*</td>
				<td><input type="text"  value="<%=b %>" readonly name = "<%=bN %>"></td>
				<td>=</td>
				<td><input type="text" placeholder="정답을 입력하세요" required name = "<%=aN %>"></td>
				<td><input type="hidden" value=<%=f*b %> name = "<%=rN %>"></td>
			</tr>
			<%
			}
			%>
		</table>
		<input type="submit" value="입력완료">
	</form>

</body>
</html>