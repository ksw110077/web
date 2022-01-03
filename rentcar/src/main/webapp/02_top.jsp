<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 세션 로그인 처리	
	String id = (String)session.getAttribute("log");
	// 로그아웃 상태
	if(id == null){
		id = "GUEST";
	}
%>
	<div class="headerWrap" style="display: flex;  background-color: rgb(170, 210, 255);">
		<span style="width: 150px; text-align: center;"><a class="topMenu" href="#">1번 메뉴</a></span>
		<span style="width: 150px; text-align: center;"><a class="topMenu" href="#">2번 메뉴</a></span>
		<span style="width: 150px; text-align: center;"><a class="topMenu" href="#">3번 메뉴</a></span>
		<span style="width: 150px; text-align: center;"><a class="topMenu" href="#">4번 메뉴</a></span>
		<span style="width: 150px; text-align: center;"><a class="topMenu" href="01_main.jsp?center=10_myPage.jsp">마이페이지</a></span>
		<div cla>
			<table>
				<tr>
					<td width="120px">
					<span><%=id %>님</span>
					</td>
					<td class="topBtnTD">
					<%
						if(id.equals("GUEST")){
					%>
							<button style="margin-right: 5px; width: 75px;" onclick="location.href='01_main.jsp?center=08_login.jsp'">로그인</button>
							<button style="width: 75px;"onclick="location.href='01_main.jsp?center=05_agree.jsp'">회원가입</button>
					<%
						}
						else {
					%>
							<button onclick="logout()">로그아웃</button>							
					<%
						}
					%>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<script type="text/javascript">
		function logout() {
			<%
			// session.removeAttribute("log");
			// session 값이 자꾸 초기화 돼서 한참을 고생했는데
			// jsp에서 서버단과 뷰단이 분리가 되어 있는데
			// 서버단 <% % > 안의 내용은 무조건 실행된다는 내용을 찾았고
			// 그 때문에 Attribute가 삭제되면서 초기화가 된 것이었다.
			// 때문에 jsp를 분리해서 java서버단으로 실행되는게 아닌
			// script에서 링크방식으로 따로 실행되게끔 분리해서 해결했다.
 			// 간단한 부분인데 너무 많은 시간을 써서 잊어버리지 않게
 			// 기록해둔다.
 			%>
			location.href="09_01_logout.jsp";
		}
	</script>
</body>
</html>