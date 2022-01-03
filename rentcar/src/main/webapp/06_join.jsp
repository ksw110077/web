<%@page import="java.util.ArrayList"%>
<%@page import="rentCar.Member"%>
<%@page import="rentCar.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="06_01_joinFunction.js"></script>
</head>
<body>
<%
	RentcarDAO dao = RentcarDAO.getInstance();
	ArrayList <Member> memberList = dao.getMember();
	ArrayList <String> ids = new ArrayList<>();
	for(int i = 0 ; i < memberList.size(); i++){
		String id = memberList.get(i).getId();
		ids.add(id);
	}
%>
	<div class="joinDiv">
		<form method="post" action="07_joinPro.jsp">
			<div>
				<h4 id="joinHTag">아이디 (필수)</h4>
				<span class="backBoxSpan">
					<input name ="id" onchange="resetChkOL()" type="text" placeholder="아이디를 입력하세요" style=" outline: none; width: 250px;">
					<input type="button" value="중복확인" onclick="checkOverlapId(form)">
				</span>
					<div style="display: none;">
						<input type="checkbox" name="checkboxId">
						<input type="checkbox" name="checkChk">
						<!-- 기본 false 처리 중복 아니라는 뜻 -->
    				</div>
					<p class="error" id="error_id" >아이디는 꼭 필요해요!</p>
					<p class="error" id="error_id2" >중복된 아이디 입니다.</p>
					<p class="error" id="error_id3" >중복확인 해주세요.</p>
					<p class="errorPass" id="pass_id" >사용가능한 아이디입니다.</p>
			</div>
			
			<div>
				<h4 id="joinHTag">비밀번호 (필수)</h4>
			<span class="backBoxSpan">
				<input name ="pw" onchange="changePw(form)" type="password" placeholder="암호를 입력하세요">
			</span>
					<p class="error" id="error_pw">비밀번호도 만들어주세요!</p>
			</div>
			
			<div>
				<h4 id="joinHTag">비밀번호 재입력 (필수)</h4>
			<span class="backBoxSpan">
				<input name ="pwRe" onchange="changePw(form)" onchange="" type="password" placeholder="암호를 다시 입력하세요">
			</span>
					<p class="error" id="error_pwRe">한번 더 확인 해볼까요?</p>
					<p class="errorPass" id="pass_pw" >좋은 비밀번호네요.</p>
			</div>
			
			<div>
				<h4 id="joinHTag">이름 (필수)</h4>
			<span class="backBoxSpan">
				<input name ="memberName" onchange="changeName(form)" type="text" placeholder="이름을 입력하세요">
			</span>
				<p class="error" id="error_name">회원님의 이름을 알려주세요</p>
			</div>
	
			<div>
				<h4 id="joinHTag">이메일</h4>
			<span class="backBoxSpan">
				<input name ="eMail" onchange="changeEmail(form)" type="text" placeholder="이메일을 입력하세요">
			</span>
				<p class="error" id="error_email">이메일 형식을 지켜주세요</p>
			</div>
			
			<div>
				<h4 id="joinHTag">성별 (필수)</h4>
				<div  align="left" style="padding-left: 50px">
				<select  name="gender">
				<option selected value="1">남자</option>
				<option value="2">여자</option>
				<option value="3">선택안함</option>
				</select>
				</div>
			</div>
			<input type="button" onclick="chkRequired(form)" value="가입하기">
		</form>
		
		<script type="text/javascript">
			function checkOverlapId(form) {
				$("#error_id3").css("display", "none");
				const ids =[];
				<%for(int i = 0; i < ids.size(); i ++){
					String id = ids.get(i);
					%>
						ids.push("<%=id%>");
					<%
				}
				%>
				console.log(ids);
				const id = form.id.value; // form에 입력된 ID 값

				if (id === "") { // 입력된 ID 값이 없으면 return;
					$("#error_id").css("display", "block"); // 아이디 입력 메세지
					$("input[name=checkChk]").prop("checked", false); // 중복체크 안됨
					return;
				}
				else {
					$("#error_id").css("display", "none"); // 아이디 입력 메시지 숨김
					if(ids.includes(id)){
						// id가 중복이면
						$("input[name=checkChk]").prop("checked", false);
						$("input[name=checkboxId]").prop("checked", true);
						$("#error_id2").css("display", "block"); // 아이디 중복 메세지
					}
					else {
						$("input[name=checkChk]").prop("checked", true);
						$("input[name=checkboxId]").prop("checked", false);
						$("#error_id2").css("display", "none"); // 아이디 중복 메세지 숨김
						$("#pass_id").css("display", "block"); // 사용가능 아이디 메세지
					}
				}
			}
		</script>
	</div>
</body>
</html>