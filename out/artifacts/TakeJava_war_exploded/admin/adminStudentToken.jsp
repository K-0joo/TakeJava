<%--
  Created by IntelliJ IDEA.
  User: jda05
  Date: 2022-05-30(030)
  Time: 오전 9:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.takejava.DAO.TokenDAO" %>

<jsp:useBean id="token" class="com.takejava.DTO.TokenDTO"/>
<jsp:setProperty name="token" property="token"/>

<html>
<head>
    <title>토큰 발생 및 승인 페이지</title>
</head>
<body>
<jsp:include page="adminHeader.jsp"/>

<main class="main_page" role="main">
    <div class="title">
        <h2>토큰 발생 및 승인</h2>
    </div>
</main>

<div>
    <%
        TokenDAO dao = TokenDAO.getInstance();
        int token1 = dao.selectToken(); // 데이터베이스에서 가져옴
        token.setToken(token1);
    %>

    <p>현재 등록된 토큰 : ${token.getToken()}</p>

    <form action="tokenProcess.jsp" method="post">
        새로운 토큰 : <input type="text" name="newtoken" placeholder="숫자만 입력해주세요">
        <input type="submit" value="토큰 발행">
    </form>
</div>

<jsp:include page="adminFooter.jsp"/>
</body>
</html>