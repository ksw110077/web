<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
h1{color: red;'}
</style>
<title>Insert title here</title>
</head>
<body>
<h1>구구단</h1>
<table border=1 cellpadding=0 cellspacing=2 width=500 >
            <%
                for (int i = 0; i < 10; i++) {
                    %>
            <tr align= center >
                <%  
                    for (int j = 1; j < 10; j++) {
                        %>
                <% 
                        if(i ==0 && j==1){
                            %><td></td>
                <%
                        }else if(i==0){
                            %>
                <td><%= j+ "단" %></td>
                <%
                        } else if(j==1){
                            %>
                <td><%= i %></td>
                <%
                        }else {
                            %>
                <td><%= j+" X "+i+" = "+j*i %></td>
                <% 
                        }%>
                <%
                    }
                    %>
            </tr>
            <%
                }
            %>
        </table>
</body>
</html>