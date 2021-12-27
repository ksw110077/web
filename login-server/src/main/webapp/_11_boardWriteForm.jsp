<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<style>
  *{
        margin: 0;
        padding: 0;
    }
    form{
        padding-top: 10vh;
        margin: auto;
        width: 80vw;
        height: 80vh;
    }

    .header{
        display: flex;
        height: 30px;
        margin-bottom: 10px;
    }
    .contain{
        width: 80vw;
    }
    
    .floor{
        display: flex;
    }

    #titleID{
        width: 100%;
        margin-right: 5px;
    }
    
    #writtingPw{
        width: 100px;
        text-align: center;
    }

    .btn1, .btn2{
        width: 120px;
        height: 60px;
    }

    .btn1{
        margin-right: 10px;
        font-size: 1.5em;
        color: white;
        background-color: rgb(87, 87, 87);
    }
    .btn2{
        font-size: 1.5em;
        color: white;
        background-color: rgb(14, 91, 179);
    }
    
    #contentID{
        font-size: 1.5em;
        resize: none;
        width: 80vw;
        height: 70vh;
    }
    
    input#titleID::placeholder {
        color: black;
        font-style: italic;
    }
    input#writtingPw::placeholder{
        font-size: 0.9em;
    }
    textarea::placeholder {
        font-size: 1.2em;
        font-weight: bold;
    }
</style>
</head>
<body>
<%
if(session.getAttribute("log") == null){
	response.sendRedirect("_05_login.jsp");
}
%>
    <form method = "post" action="_12_boardWritePro.jsp">
        <div class="header">
            <input name="title" id="titleID"placeholder="제목을 입력하세요">
            <input name="password" type="password" id="writtingPw"placeholder="게시글 비밀번호">
        </div>
        <div class="contain">
            <textarea name="content" id="contentID" wrap="physical" placeholder="내용을 입력하세요"></textarea>
        </div>
        <div class ="floor">
            <input class = "btn1" type="button" onclick="location='_10_boradList.jsp'" value="취소">
            <input class = "btn2" type="button" onclick="checkInfo(form)" value="등록">
        </div>
	</form>
	
	<script>
	function checkInfo (form){
			const title = form.title.value;
			const password = form.password.value;
			const content = form.content.value;
			
			if(title === ""){
				alert("제목을 입력해주세요");
			}
			else if (password === ""){
				alert("게시물 비밀번호를 입력해주세요");
			}
			else if (content === ""){
				alert("게시물 내용을 입력해주세요");
			}
			else {
				form.submit();
			}
		}
	</script>
</body>
</html>