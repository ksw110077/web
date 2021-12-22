<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="validate.js"></script>
<title>Insert title here</title>
</head>
<body>
    <h1>수강신청</h1>
    <p>최소 한개 과목 이상 신청해야 합니다.</p>
    <form action="subjectsPro.jsp">
        <ul>
            <li><input type="checkbox" name="subjects" value="java"><span>Java</span></li>
            <li><input type="checkbox" name="subjects" value="jsp"><span>JSP</span></li>
            <li><input type="checkbox" name="subjects" value="html.css"><span>html/css</span></li>
            <li><input type="checkbox" name="subjects" value="js"><span>JS</span></li>
            <li><input type="checkbox" name="subjects" value="spring"><span>Spring</span></li>
        </ul>
        <input type="button" value="인풋버튼" onclick="checkVal(form)">
    </form>
</body>
</html>