function chkRequired(form) {
	const id = form.id.value;
	const pw = form.pw.value;
	const pwRe = form.pwRe.value;
	const memberName = form.memberName.value;
	const email = form.eMail.value;
	const checkboxId = $("input[name=checkboxId]").is(':checked');
	const checkChk = $("input[name=checkChk]").is(':checked');

	if (id != "" && pw != "" && pwRe != "" && memberName != "" && pw === pwRe && !checkboxId && checkChk) {
		// 필수 값 채워져 있고, 중복 아니고, 중복체크 완료 됐을때
		if (email != "" && !checkEmail(email)) {
			// 이메일 내용이 있는데 형식이 안맞는 경우
			// 에러 메시지 띄우고 return;
			$("#error_email").css("display", "block");
			return;
		}
		// submit;
		form.submit();
	}
	// 중복, 중복체크
	else {
		// id 입력값 
		if (id === "") { // 입력값이 없을 때
			$("#error_id").css("display", "block");
		}
		else { // 입력값이 있을 때
			$("#error_id").css("display", "none");

			if (!checkChk) { // 중복체크 안한 경우
				$("#error_id3").css("display", "block");
			}
			else { // 중복 체크 한 경우
				$("#error_id3").css("display", "none");
				if (checkboxId) { // true 중복이다
					// 중복일 경우
					$("#error_id2").css("display", "block");
				}
				else {
					// 중복일 아닐 경우
					$("#error_id2").css("display", "none");
				}
			}
		}

		// pw 입력값
		$("#pass_pw").css("display", "none");
		if (pw === "") {
			// pw 값 없을 때
			$("#error_pw").css("display", "block");
		}
		else {
			// pw 값 있을 떄
			$("#error_pw").css("display", "none");
		}

		if (pwRe === "") {
			// pwRe 값 없을 때
			$("#error_pwRe").css("display", "block");
		}
		else {
			// pwRe 값 있을 때
			if (pw != pwRe) {
				$("#error_pwRe").css("display", "block");
			}
			else {
				$("#pass_pw").css("display", "block");
				$("#error_pwRe").css("display", "none");
			}
		}

		// name 입력값
		if (memberName === "") {
			$("#error_name").css("display", "block");
		}
		else {
			$("#error_name").css("display", "none");
		}

		// email 입력값		
		if (!checkEmail(email)) {
			$("#error_email").css("display", "block");
		}
		else {
			$("#error_email").css("display", "none");
		}
	}
}

function resetChkOL() {
	const id = $("input[name=id]").val();
	const checkboxId = $("input[name=checkboxId]").is(':checked');
	const checkChk = $("input[name=checkChk]").is(':checked');

	
	// 아이디 입력 값이 바뀌면 초기화 되는 옵션들
	$("#error_id2").css("display", "none");
	$("#error_id3").css("display", "none");
	$("#pass_id").css("display", "none");

	$("input[name=checkChk]").prop("checked", false); // 중복체크 안됨 상태
	$("input[name=checkboxId]").prop("checked", false); // 중복 아닌 상태

	// id 입력값 
	if (id === "") { // 입력값이 없을 때
		$("#error_id").css("display", "block");
	}
	else { // 입력값이 있을 때
		$("#error_id").css("display", "none");

		if (!checkChk) { // 중복체크 안한 경우
			$("#error_id3").css("display", "block");
		}
		else { // 중복 체크 한 경우
			$("#error_id3").css("display", "none");
			if (checkboxId) { // true 중복이다
				// 중복일 경우
				$("#error_id2").css("display", "block");
			}
			else {
				// 중복일 아닐 경우
				$("#error_id2").css("display", "none");
			}
		}
	}
}

function changePw(form) {
	const pw = form.pw.value;
	const pwRe = form.pwRe.value;
	$("#pass_pw").css("display", "none");
	// pw 입력값
	if (pw === "") {
		// pw 값 없을 때
		$("#error_pw").css("display", "block");
	}
	else {
		// pw 값 있을 떄
		$("#error_pw").css("display", "none");
	}

	if (pwRe === "") {
		// pwRe 값 없을 때
		$("#error_pwRe").css("display", "block");
	}
	else {
		// pwRe 값 있을 때
		if(pw != pwRe){
			$("#error_pwRe").css("display", "block");
		}
		else {
			$("#pass_pw").css("display", "block");
			$("#error_pwRe").css("display", "none");
		}
	}
}

function changeName(form){
	const memberName = form.memberName.value;
	// name 입력값
	if (memberName === "") {
		$("#error_name").css("display", "block");
	}
	else {
		$("#error_name").css("display", "none");
	}	
}
function changeEmail(form){
	$("#error_email").css("display", "none");
	const email = form.eMail.value;
	if (email != "" && !checkEmail(email)) {
		$("#error_email").css("display", "block");
		return;
	}
}

function checkEmail(str) {
	let reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;

	if (!reg_email.test(str)) {
		return false;
	}
	else {
		return true;
	}
}

