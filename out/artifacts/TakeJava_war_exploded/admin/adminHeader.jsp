<%--
  Created by IntelliJ IDEA.
  User: jda05
  Date: 2022-05-30(030)
  Time: 오전 2:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./adminCss.css?after">
    <title>관리자 헤더 파일</title>
</head>
<body>
<header>
    <div class="head_box">
        <h1>컴퓨터소프트웨어공학과 좌석예약 시스템(관리자용)</h1>
        <button class="logout" onclick="alert('로그아웃 하시겠습니까?'); location.href='logout.jsp';">로그아웃</button>
    </div>
    <nav class="nav_bar">
        <a href="adminSchedule.jsp">시간표 관리</a>
        <div class="dropdown">
            <button class="dropbtn">학생 관리</button>
            <div class="dropdown-content">
                <a href="adminStudentToken.jsp">토큰발생 및 승인</a>
                <a href="adminStudentRegister.jsp">학생등록 관리</a>
            </div>
        </div>
        <a href="adminMain.jsp">실습예약 현황</a>
        <a href="adminNotice.jsp">공지사항</a>
    </nav>
</header>
</body>
</html>