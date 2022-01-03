<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{
	margin: 0;
	padding: 0;
}

body{
	min-width: 1020px;
	max-width: 100vw;
}

.wrap{
	text-align: center;
}

.headerWrap{
	min-width: 1020px;
	width: 100vw;
	height: 50px;
	justify-content: center; /*display: flex; 수평 정렬*/
	align-items : center; /*display: flex; 수직 정렬*/
}

.topBtnTD{
	display: flex;
	width: 150px;
	position: absolute;
}

.joinDiv{
	margin-top: 100px;
	margin-bottom: 100px;
	padding-top: 50px;
	padding-bottom: 50px;
	
	width: 400px;
	height: 400px;
	border: 3px solid;
	border-color: rgb(121, 183, 255);
}

.error{
	display: none; 
	color: red; 
	font-size: 0.8em;
	text-align: left;
	padding-left: 50px;
}

.errorPass{
	display: none; 
	color: green; 
	font-size: 0.8em;
	text-align: left;
	padding-left: 50px;
}

#joinHTag{
	text-align: left;
	padding-left: 50px;
}
.backBoxSpan{
	display: inline-block;
	width: 300px;
	text-align: left;
}



.loginBody{
	margin-left: auto;
	margin-right: auto;
}

.loginHiddenSpace{
	height: calc((100vh - 650px) / 2);
}
.myHiddenSpace{
	height: calc((100vh - - 150px) / 2);
}



</style>
</head>
<body>
<%
/*
MVC

- Model DTO


- View html

- Controller DAO


// view page
1. 01_main.jsp / top center bottom 구성	<jsp:include page="02_top.jsp" />
2. 02_top.jsp / 메뉴바, 로그인 상태, 로그인, 아웃 버튼, 회원가입
	ㄴ1. 로그인, 아웃은 session으로 처리
	ㄴ2. session 값 null 이면 로그아웃
	ㄴ3. top에서 로그인하면 --> plane main 으로
3. 03_ center / 컨텐츠 , 검색
	ㄴ1.
4. 04_bottom / 사이트 설명?
	ㄴ1. 많이 건드릴건 없고 나중에 페이지 연결 위해서 a태그 사용
	
// member page
5. 05_agree
	ㄴ 필수 체크
			
// member join
6. 06_join
	ㄴ DB table member
	ㄴ column
	ㄴ 1. 아이디/ 패스워드/ 패스워드 확인 / 이름 / 연락처/ 이메일 /
	ㄴ DTO -> 그냥 member 클래스
	ㄴ 중복체크 
7. 07_joinPro -> 가입 완료 되면 main으로 로그인 상태 이동

// member login
8. 08_login -> 로그인 위치에 따라서 결과 페이지 다르게
9. 09_loginPro
10. 10_Withdrawal



// 차량 재고 수량************


11. 11_reserve
		ㄴ 예약
		ㄴ 비로그인 상태에서도 가능
		ㄴ 차량 검색 기능을 좌측이니까 위에 
		ㄴ 처음 누르면 전체 중 10개 목록 출력
		
12. 12_checkReserve
		ㄴ 예약확인

13. 13_searchCar
		ㄴ 11_reserve의 하위 컨텐츠 div 따로 두고 
		ㄴ14_carSmall
		ㄴ15_carMiddle
		ㄴ16_carLarge
		ㄴ 카테고리 별로 소형, 중형, 대형

14.


// board page (후기)

// 게시판 확인 처리 log 값 확인해서 동일하면 가능

7. boardList


8. boardWriteForm
9. boardWritePro

10. boradUpdateForm
11. boradUpdatePro

12. boradDeletePro
14. checkPwPro

15. commentsPro
16. commentsUpdatePro
17. commentsDeletePro

18. center - home : 최신 기종 몇개 보여주기 -> 각 상세 페이지 링크
19. center - 예약하기
20. center - 예약확인
21. center - 검색
22. center - 

*/
// session.setAttribute("centerURL" , center);
// 이건 메인 페이지, 예약페이지, 게시판 같은것 일때만
String center = request.getParameter("center");
if(center == null){	
	center = "03_center.jsp";
}

if(center.equals("03_center.jsp") || center.equals("10_myPage.jsp")){
	session.setAttribute("centerURL" , center);
}
%>
	<div class="wrap">
		<div class="header">
			<jsp:include page="02_top.jsp" />
		</div>
		<div class="main">
			<jsp:include page="<%=center %>" />
		</div>
		<div class="footer">
			<jsp:include page="04_bottom.jsp" />
		</div>
	</div>
</body>
</html>