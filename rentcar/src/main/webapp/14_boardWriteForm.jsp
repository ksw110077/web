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
	<form id="wirte_form" action="01_main.jsp?center=15_boardWritePro.jsp">
		<input name="title" type="text" placeholder="아이디">
		<input name="conPw" type="password" placeholder="게시물 비밀번호">
		<textarea name="content" placeholder="내용을 입력해주세요"></textarea>
		<input name="cancel" type="text" value="취소">
		<input name="complete" type="text" value="작성">
	</form>
	<script type="text/javascript">
		const form = $("#wirte_form");
		function wirte() {
			const title = $("input[name=title]").val();
			const conPw = $("input[name=conPw]").val();
			const content = $("input[name=content]").val();
 
			if(title == "" || conPw == "" || content == ""){
				alert("필수 내용을 입력해주십시오");
			}
			else{
				form.submit();
			}
		}
		
		$("#wirte_form").keypress(function (e) {
	        if (e.keyCode === 13) {
	        	wirte();
	        }
	    });
	</script>
</body>
</html>