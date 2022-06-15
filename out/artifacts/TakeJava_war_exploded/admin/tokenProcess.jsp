<%@ page import="com.takejava.DAO.TokenDAO" %>

<jsp:useBean id="token" class="com.takejava.DTO.TokenDTO"/>

<html>
<head>

</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    int newtoken = Integer.parseInt(request.getParameter("newtoken")); // 새로운 토큰 값을 가져옴

    TokenDAO dao = TokenDAO.getInstance();
    dao.newToken(newtoken); // 데이터베이스에 업데이트
    token.setToken(newtoken); // 새로운 토큰 저장

    // 다시 페이지로 돌아가기
    //pageContext.forward("adminStudentToken.jsp");
    response.sendRedirect("adminStudentToken.jsp");
%>

</body>
</html>
