<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        span{
            white-space: pre;
        }
    </style>
    <title>join</title>
</head>
<body>
    <h1>JOIN</h1>
    <!-- submit 하면 joinPro 페이지로 이동 -->
    <!-- http://localhost:8081/webEx/joinPro.jsp?  -->
    
    <!-- GET -->
    <!-- 프로토콜://호스트:port/path?파라미터명1=값1&파라미터명2=값2... -->
    <!-- 프로토콜://호스트:port/path??id=qwer&pw=1234 -->
    
    <!-- POST -->
    <!-- 메소드를 POST 방식으로 하면 전달하는 파라미터를 숨겨서 전달 가능 -->
    <!-- http://localhost:8081/webEx/joinPro.jsp -->
    
    
    <form method="POST" action="joinPro.jsp">
        <span>id:&#9;</span><input type="text" name="id"><br><br>
        <span>pw:&#9;</span><input type="text" name="pw"><br><br>
        <input type="submit">
    </form>
</body>
</html>