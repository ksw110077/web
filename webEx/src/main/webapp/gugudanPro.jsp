<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>구구단 PRO</h1>
	<table>
	<%
	// post 요청에 대하여 반드시 캐릭터셋을 맞춰줘야 한다.(한글 사용시 깨짐)
	request.setCharacterEncoding("UTF-8");
	int score =0;
	for(int i = 0; i < 5; i++){%>
	<tr>
	<%
	int f = Integer.parseInt(request.getParameter("f" + (i+1)));
	int b = Integer.parseInt(request.getParameter("b" + (i+1)));
	int a = Integer.parseInt(request.getParameter("a" + (i+1)));
	int r = Integer.parseInt(request.getParameter("r" + (i+1)));
	%>
	<td>
	<span>
	<%=(i+1)%>번 문제 : <%=f %> * <%=b %> = <%=a %>　--> 정답: <%=r %>
	<%
	String result="";
	if(a == r){
		result = "O";
		score += 20;
	}
	else {
		result = "X";
	}
	%>
	
	<%=result%>
	
	</span>
	</td>
	</tr>
	<%	
	}
	%>
	<tr>
	<td>총 점 : <%=score %></td>
	</tr>
	</table>
</body>
</html>