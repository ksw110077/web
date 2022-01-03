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
	<div style="min-height: 0px;" class="loginHiddenSpace"></div>
	<div class="loginBody" style="width: 500px; height: 500px; border: 1px solid;">
		<form id="login_form" method="post" action="09_loginPro.jsp">
				<p>아이디</p> <input type="text" name="login_id">
				<p>비밀번호</p> <input type="password" name="login_pw">
				<input type="button" onclick="Login(form)" value="로그인">
		</form>
	</div>
	<div style="min-height: 0px;" class="loginHiddenSpace"></div>
	<script type="text/javascript">
		let form = $("#login_form");
		
		function Login() {
			const id = $("input[name=login_id]").val();
			const pw = $("input[name=login_pw]").val();
			if(id != "" && pw != ""){
				form.submit();
			}
			else {
				alert("정보를 입력해주세요")
			}
		}
		
		$("#login_form").keypress(function (e) {
	        if (e.keyCode === 13) {
	            Login();
	        }
	    });
	</script>
</body>
</html>