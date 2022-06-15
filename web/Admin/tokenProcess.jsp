<%@ page import="com.takejava.DAO.TokenDAO" %>

<jsp:useBean id="token" class="com.takejava.DTO.TokenDTO"/>
<jsp:setProperty name="token" property="token"/>

<html>
<head>

</head>
<body>
<%request.setCharacterEncoding("UTF-8");%>
<%
    TokenDAO dao = TokenDAO.getInstance();
    String token1 = dao.newToken();
    token.setToken(token1);
%>

</body>
</html>
