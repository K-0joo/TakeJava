<%--
  Created by IntelliJ IDEA.
  User: jda05
  Date: 2022-06-15(015)
  Time: 오후 8:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="TakeJava.ManageUser" %>
<jsp:useBean id="ManageUser" class="TakeJava.ManageUser" scope="page" />

<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    session.invalidate(); // 세션 삭제
    response.sendRedirect("../LogIn/ManageLogIn.jsp"); // 관리자 로그인 페이지로 돌아가기
%>
</body>
</html>
