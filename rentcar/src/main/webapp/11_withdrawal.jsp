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
	<div>
		<p>회원 탈퇴</p>
		<span>회원 탈퇴를 위해 암호를 입력해 주세요</span>
		<form id="with_form" method="post" action="12_withdrawalPro.jsp">
			<input type="password" name="with_pw">
			<input type="button" onclick="withdrawal()" value="탈퇴하기">
		</form>
	</div>
	<script type="text/javascript">
		let form = $("#with_form");

		function withdrawal() {
			const pw = $("input[name=with_pw]").val();
			if (pw != "") {
				form.submit();
			} else {
				alert("암호를 입력해주세요")
			}
		}

		$("#login_form").keypress(function(e) {
			if (e.keyCode === 13) {
				withdrawal();
			}
		});
	</script>
</body>
</html>