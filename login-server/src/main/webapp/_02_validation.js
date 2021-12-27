function checkVal  (form){
	const required = form.required;
	let check = required.length;
	let cnt = 0;
	for(let i = 0; i<required.length; i++){
		if(required[i].checked === true){
			cnt ++;
		}
	}
	
	if(cnt === check){
		form.submit();	
	}
	else {
		alert('필수항목이 누락되었습니다!');
	}
}

function checkInfo (form){
	const id = form.id.value;
	const pw = form.pw.value;
	if(id === "" || pw === ""){
		alert('필수 항목을 채워주세요');
	}
	else {		
		form.submit();
	}
}

f/*unction moveLogin(){
	location.href = "http://localhost:8081/login-server/_05_login.jsp";
}*/
function logout(){
	location.href = "http://localhost:8081/login-server/_05_login.jsp";
	session.removeAttribute("log");
}

let change = function(){
	// document.queryselector('#warnning').style.display= 'none'
	$('span#warnning').show();
}