<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>board</title>
    <style type="text/css">
    	body, table{
    		width: 80vw;
    		margin: auto;
    	}
    </style>
</head>
<body>
    <div>
        <table border="1">
            <tr>
                <td>no</td>
                <td>title</td>
                <td>id</td>
                <td>view</td>
                <td>like</td>
                <td>date</td>
            </tr>
            <%
            BoardDAO  dao = BoardDAO.getInstance();
            ArrayList<BoardDTO> contents = dao.getBoard();
            
            if(contents.size() != 0){
            
            	for(int i=0; i<contents.size(); i++){
            %>
            <tr>
                <td><%=contents.get(i).getCode() %></td>
                <td><a href="_18_boardView.jsp?code=<%=contents.get(i).getCode()%>"><%=contents.get(i).getTitle() %></a></td>
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
    	<button onclick = "location.href='_11_boardWriteForm.jsp'">글쓰기</button>
    </div>
</body>
</html>