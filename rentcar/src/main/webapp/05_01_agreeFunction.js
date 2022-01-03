function checkAll(){
    $('input#check').prop("checked", $('.all').prop("checked"));
}

function checkAgree(form){
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