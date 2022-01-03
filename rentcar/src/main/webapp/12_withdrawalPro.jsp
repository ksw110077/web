<%@page import="rentCar.Member"%>
<%@page import="rentCar.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String id = (String)session.getAttribute("log");
		String pw = request.getParameter("with_pw");
		RentcarDAO dao = RentcarDAO.getInstance();
		if(id==null){
			response.sendRedirect("01_main.jsp?center=08_login.jsp");
		}
		else {
			Member mem = dao.chkMember(id);
			String tempPw = mem.getPw();
			if(pw.equals(tempPw)){
				dao.delMember(id, pw);
				session.removeAttribute("log");
				%>
				<script type="text/javascript">
					alert("회원 탈퇴 되셨습니다.");
				</script>
				<%
				response.sendRedirect("01_main.jsp?");
			}
			else {
				%>
				<script type="text/javascript">
					alert("비밀번호를 확인하세요");
				</script>
				<%
				response.sendRedirect("01_main.jsp?center=11_withdrawal.jsp");
			}
		}
	%>
	
	<script type="text/javascript">
	</script>

</body>
</html>