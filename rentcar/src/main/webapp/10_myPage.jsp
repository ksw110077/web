<%@page import="rentCar.Member"%>
<%@page import="rentCar.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = (String) session.getAttribute("log");
	RentcarDAO dao = RentcarDAO.getInstance();
	if(id == null){
	%>
	<script type="text/javascript">
		alert("로그인이 필요합니다.");
		location.href= "01_main.jsp?center=08_login.jsp";
	</script>
	
	<%
	}
	else {
		Member member = dao.chkMember(id);
		
		int gen = member.getGender();
		String gender="";
		
		if(gen == 1){
			gender = "남자";
		}
		else if(gen == 2){
			gender = "여자";
		}
		else if(gen == 3){
			gender = "선택안함";
		}
%>
	<div style="min-height: 0px;" class="myHiddenSpace"></div>
	<div style="height: ">
		<br>
		<br>
		<span>---- My Information ----</span>
		<br>
		<br>
		<span>ID :  <%=id %></span>
		<br>
		<br>
		<span>Name :  <%=member.getName() %></span>
		<br>
		<br>
		<span>E-Mail :  <%=member.getEmail()%></span>
		<br>
		<br>
		<span>Gender :  <%=gender %></span>
		<br>
		<br>
		<button onclick="location.href='01_main.jsp?center=11_withdrawal.jsp'">회원 탈퇴</button>
	</div>
	<div style="min-height: 0px;" class="myHiddenSpace"></div>
<%
	}
%>
</body>
</html>