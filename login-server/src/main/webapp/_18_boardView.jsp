<%@page import="board.CommentsDTO"%>
<%@page import="board.CommentsDAO"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 작성</title>
<style>
* {
	margin: 0;
	padding: 0;
}

body {
	padding-top: 10vh;
	margin: auto;
	width: 80vw;
}

.outBox {
	border: 1px solid rgb(136, 136, 136);
	display: inline-block;
}

#titleSpan {
	font-size: 2.2em;
	color: rgb(59, 59, 59);
	width: 100%;
}

#contentSpan {
	height: 70vh;
	width: 100%;
}

button {
	width: 200px;
	height: 30px;
}

.coms {
	display: flex;
}

textarea::placeholder {
	font-size: 1.2em;
	font-weight: bold;
}

table {
	border: none;
}

.likeBtn {
	float: right;
	width: 50px;
}

.smallBtn {
	width: 50px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
	<%
	if (session.getAttribute("log") == null) {
		response.sendRedirect("_05_login.jsp");
	} else {
		String id = (String) session.getAttribute("log");
		request.setCharacterEncoding("UTF-8");
		int code = Integer.parseInt(request.getParameter("code"));

		BoardDAO dao = BoardDAO.getInstance();
		ArrayList<BoardDTO> contents = dao.getBoard();
		BoardDTO content;

		for (int i = 0; i < contents.size(); i++) {
			if (contents.get(i).getCode() == code) {
		content = contents.get(i);
	%>
	<div class="header">
		<span id="titleSpan"><%=content.getTitle()%></span>
	</div>
	<div class="content">
		<span class="outBox" id="contentSpan"><%=content.getContent()%></span>
	</div>
	<br>
	<div class="floor">
		<button onclick="location='_10_boradList.jsp'"
			style="background-color: rgb(179, 179, 179); color: rgb(255, 255, 255); border: 2px solid rgb(0, 0, 0);">목록</button>
		<button
			onclick="location.href='_15_checkPassForm.jsp?code=<%=code%>&revision=1&delete=0'"
			style="background-color: rgb(146, 233, 255); color: rgb(0, 0, 0); border: 2px solid rgb(20, 74, 119);">수정</button>
		<button
			onclick="location.href='_15_checkPassForm.jsp?code=<%=code%>&revision=0&delete=1'"
			style="background-color: white; color: red; border: 2px solid red;">삭제</button>
		<span>좋아요 : <%=content.getLike()%>개
		</span>
		<button class="likeBtn">좋아요</button>
	</div>
	<br>
	<div class="comments">
		<%
		CommentsDAO cdao = CommentsDAO.getInstance();
		ArrayList<CommentsDTO> comments = cdao.getComments();
		int cnt = 0;

		for (int j = 0; j < comments.size(); j++) {
			if (comments.get(j).getParentID() == content.getCode()) {
				cnt++;
			}
		}
		%>
		<span>댓글 (<%=cnt%>개)
		</span>
		<table class="upCom">
			<%
			for (int j = 0; j < comments.size(); j++) {
				if (comments.get(j).getParentID() == content.getCode()) {
					CommentsDTO comment = comments.get(j);
			%>
			<tr class="com<%=comment.getNo()%>">
				<td style="width: 100%"><%=comment.getCommenter()%></td>
				<td><button class="smallBtn" onclick="delComments(<%=comment.getNo()%>,<%= comment.getParentID()%>)">삭제</button></td>
			</tr>
			<tr>
				<td><span style="width: 100%; height: 30px"><%=comment.getComments()%></span></td>
			</tr>
			<%
			}
			}
			%>
		</table>
		<br>
		<form method="post" class="coms" action="commentsPro.jsp">
			<textarea name="inputText" placeholder="댓글을 입력해주세요"
				style="width: 80%; height: 50px; margin-right: 10px; resize: none"></textarea>
			<input name="parentID" type="hidden" value="<%=content.getCode()%>">
			<input name="commenter" type="hidden"
				value="<%=session.getAttribute("log")%>"> <input
				type="button" onclick="reComments(form)" value="댓글 달기"
				style="height: 55px; width: 150px">
		</form>
	</div>
	<br>
	<br>
	<script type="text/javascript">
		function reComments(form) {
			let comments = form.inputText.value;
			if (comments === "") {
				alert("댓글 내용을 입력해주세요");
			} else {
				form.submit();
			}
		}
		
		function delComments(no,parentID){
			location.href ="commentsDelPro.jsp?no=" + no +"&parentID=" +parentID;
			alert(no);
		}
	</script>
	<%
	}
	}
	}
	%>
</body>
</html>