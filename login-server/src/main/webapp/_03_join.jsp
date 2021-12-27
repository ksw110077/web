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
        h1{
            border: solid 2px green;
        }
        input[type="text"]{
            padding: 10px;
            border: solid 2px green;
        }
        input[type="button"]{
        	cursor: pointer;
            padding: 10px;
            border: none;
            color:  white;
            background-color: green;
        }
        #warnning{
        	display = none;
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script type="text/javascript" src="_02_validation.js"></script>
    <title>join</title>
</head>
<body>
	<%
		if(session.getAttribute("checkId") != null){
			if(Boolean.parseBoolean(session.getAttribute("checkId").toString())){
				System.out.println("false"); %>
				<script>change();</script>
				<%
			}
		}
	%>
    <form method="post" action="_04_joinPro.jsp">
    <h1>JOIN</h1>
    <span>id:&#9;</span><input type="text" name="id"><br>
    <span id = "warnning">&#9;이미 사용중인 아이디입니다. 다른 아이디 입력</span>
    <br>
    <span>pw:&#9;</span><input type="text" name="pw"><br><br>
    <input type="button" onclick="checkInfo(form)" value="join">
    </form>
</body>
</html>