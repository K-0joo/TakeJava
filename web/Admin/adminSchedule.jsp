<%--
  Created by IntelliJ IDEA.
  User: jda05
  Date: 2022-05-30(030)
  Time: 오전 9:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>시간표 관리 페이지</title>
</head>
<body>
<jsp:include page="adminHeader.jsp"/>
<main class="main_page" role="main">
    <div class="title">
        <h2>시간표 관리</h2>
    </div>
</main>
<form action="scheduleProcess.jsp" method="post">
    <p>과목 코드 : <input type="text" name="classid"></p>
    <p>강의실 번호 : <input type="text" name="classnum" placeholder="숫자만 입력해주세요"></p>
    <p>
        년도 : <select name="year">
        <option value="2022">2022</option>
        <option value="2023">2023</option>
        <option value="2024">2024</option>
        <option value="2025">2025</option>
        <option value="2026">2026</option>
        <option value="2027">2027</option>
        <option value="2028">2028</option>
        <option value="2029">2029</option>
        <option value="2030">2030</option>
    </select>
    </p>
    <p>
        학기 선택 : <select name="semester">
        <option value="1학기">1학기</option>
        <option value="2학기">2학기</option>
    </select>
    </p>
    <p>과목명 : <input type="text" name="classname"></p>
    <p>
        수업 시작 시간 : <select name="starttime">
        <option value="9">09:00</option>
        <option value="10">10:00</option>
        <option value="11">11:00</option>
        <option value="12">12:00</option>
        <option value="13">13:00</option>
        <option value="14">14:00</option>
        <option value="15">15:00</option>
        <option value="16">16:00</option>
        <option value="17">17:00</option>
    </select>
    </p>
    <p>
        수업 종료 시간 : <select name="endtime">
        <option value="10">10:00</option>
        <option value="11">11:00</option>
        <option value="12">12:00</option>
        <option value="13">13:00</option>
        <option value="14">14:00</option>
        <option value="15">15:00</option>
        <option value="16">16:00</option>
        <option value="17">17:00</option>
        <option value="18">18:00</option>
    </select>
    </p>
    <p>요일 : <input type="text" name="classid" placeholder="숫자만 입력해주세요"></p>
    <input type="submit" value="시간표 등록">
</form>

<jsp:include page="adminFooter.jsp"/>
</body>
</html>