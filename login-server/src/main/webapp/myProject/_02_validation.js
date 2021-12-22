const joinChk = function(form) {
	let passChk = true;
	const id = $(form.id_input).val();
	const pw = $(form.password).val();
	const pwRe = $(form.passwordRe).val();
	const name = $(form.user_name).val();
	const year = $(form.year).val();
	const month = $(form.month).val();
	const date = $(form.date).val();
	const gender = $(form.gender).val();
	const eMail = $(form.eMail).val();
	const conNum = $(form.conNum).val();
	const number = $(form.number).val();
	const accNum = $(form.accNum).val();
	const nowY = new Date().getFullYear;
	const nowM = new Date().getMonth + 1;
	const nowD = new Date().getDate;

	$('.error').css("display", "none");
	// 서밋 때 경고 창
	// ㄴ 얘는 폼 값 받아서 벨류로 치환
	// 키프레스 시에 경고창
	// ㄴ 얘는 그냥 input value 값
	// 2배 ? 
	// 그냥 이 함수 써도 될 듯 이벤트 마다 form 넘기는거
	// 리소스 좀 잡아먹을 것 같음
	// 함수 통합?
	// 정규표현식을 통한 대소문자 구분 

	const type1 = /[^0-9a-zA-Z_-]/g;
	const type2 = /[ㄱ-ㅎ가-힣]/g;

	if (id === "") {
		$('#error_id').css("display", "block");
		$('#error_id').html("필수 정보입니다.");
		passChk = false;
	}
	else {
		if (type1.test(id) || id.length < 5 || id.length > 20){
			$('#error_id').css("display", "block");
			$('#error_id').html("5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
			passChk = false;
		}
	}

	if (pw === "") {
		$('#error_pw').css("display", "block");
		$('#error_pw').html("필수 정보입니다.");
		passChk = false;
	} else {
		
		if (type2.test(pw) || pw.length < 8) {
			$('#error_pw').css("display", "block");
			$('#error_pw').html("8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
			passChk = false;
		}
	}

	if (pwRe === "") {
		$('#error_pwRe').css("display", "block");
		$('#error_pwRe').html("필수 정보입니다.");
		passChk = false;
	}
	if (name === "") {
		$('#error_name').css("display", "block");
		$('#error_name').html("필수 정보입니다.");
		passChk = false;
	}

	if (year === "" || year.length != 4) {
		$('#error_birth').css("display", "block");
		$('#error_birth').html("태어난 년도 4자리를 정확하게 입력하세요.");
		passChk = false;
	}
	else {
		if (month === "월") {
			$('#error_birth').css("display", "block");
			$('#error_birth').html("태어난 월을 선택하세요.");
			passChk = false;
		}
		else {
			if (date === "") {
				$('#error_birth').css("display", "block");
				$('#error_birth').html("태어난 일(날짜) 2자리를 정확하게 입력하세요.");
				passChk = false;
			}
			else {
				if (parseInt(date < 0) || parseInt(date > 31)) {
					$('#error_birth').css("display", "block");
					$('#error_birth').html("태어난 일(날짜) 2자리를 정확하게 입력하세요.");
					passChk = false;
				}
			}
		}
	}

	if (gender === "성별") {
		$('#error_gender').css("display", "block");
		$('#error_gender').html("필수 정보입니다.");
		passChk = false;
	}
	if (number === "") {
		$('#error_number').css("display", "block");
		$('#error_number').html("필수 정보입니다.");
		passChk = false;
	}

	if (pw != pwRe) {
		$('#error_pwRe').css("display", "block");
		$('#error_pwRe').html("비밀번호가 일치하지 않습니다.");
		passChk = false;
	}

	if (passChk) {
		form.submit();
	}


	// console.log("id = " + id);
	// console.log("pw = " + pw);
	// console.log("pwRe = " + pwRe);
	// console.log("name = " + name);
	// console.log("year = " + year);
	// console.log("month = " + month);
	// console.log("date = " + date);
	// console.log("gender = " + gender);
	// console.log("eMail = " + eMail);
	// console.log("conNum = " + conNum);
	// console.log("number = " + number);
	// console.log("accNum = " + accNum);
}

const agreeChk = function(form) {
	let chk = true;
	for (let i = 0; i < form.required.length; i++) {
		if (form.required[i].checked === false) {
			chk = false;
		}
	}

	if (!chk) {
		const error = document.querySelector(".error");
		error.style.display = "block";
	}
	else {
		form.submit();
	}
}

const allChk = function(target) {
	// console.log(target.checked); // 체크된 이후 값 받음
	if (target.checked) { // 전체 체크
		const children = document.querySelectorAll('.child');
		for (let i = 0; i < children.length; i++) {
			children[i].checked = true;
		}
	}
	else {
		const children = document.querySelectorAll('.child');
		for (let i = 0; i < children.length; i++) {
			children[i].checked = false;
		}
	}
}