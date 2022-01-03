<%@page import="rentCar.Board"%>
<%@page import="java.util.ArrayList"%>
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
	// 후기를 쓰려면 예약 내역이 있어야 하나?
	String id = (String) session.getAttribute("log");
	if(id == null){
		response.sendRedirect("01_main.jsp?center=08_login.jsp");
	}
	else {
%>
    <div>
        <table border="1" style="border: solid;">
            <tr>
                <td>no</td>
                <td>title</td>
                <td>id</td>
                <td>view</td>
                <td>like</td>
                <td>date</td>
            </tr>
            <%
            RentcarDAO dao = RentcarDAO.getInstance();
            ArrayList<Board> contents = dao.getBoard();
            if(contents.size() != 0){
            
            	for(int i=0; i<contents.size(); i++){
            %>
            <tr>
                <td><%=contents.get(i).getCode() %></td>
                <td><a href="01_main.jsp?center=18_boardView.jsp?code=<%=contents.get(i).getCode()%>"><%=contents.get(i).getTitle() %></a></td>
                <td><%=contents.get(i).getId() %></td>
                <td><%=contents.get(i).getView() %></td>
                <td><%=contents.get(i).getLike() %></td>
                <td width="200px"><%=contents.get(i).getDate()%></td>
            </tr>
            <%
            	}
            }
            %>
        </table>
    </div>
    <br>
    <br>
    <div>
    	<button onclick = "location.href='_14_boardWriteForm.jsp'">글쓰기</button>
    </div>
		<%
	}
%>
</body>
</html>