<%--
  Created by IntelliJ IDEA.
  User: jda05
  Date: 2022-05-30(030)
  Time: 오전 9:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*" %>
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
        final String JdbcDriver = "com.mysql.jdbc.Driver";
        final String JdbcUrl = "jdbc:mysql://localhost:3306/takejava?serverTimezone=Asia/Seoul";
        final String User = "takejava";
        final String Password = "takejava";

        try{
            Class.forName(JdbcDriver);

            Connection conn = DriverManager.getConnection(JdbcUrl, User, Password);
            Statement stmt = conn.createStatement();
            String sql = "SELECT token FROM token";
            ResultSet rs = stmt.executeQuery(sql);
    %>
    <span>현재 등록된 토큰 : </span>
    <%
            while(rs.next()){
                String token = rs.getString("token");
                out.println("<span id=\"currenttoken\">" + token + "</span>");
//            out.println("<input type=\"text\" id=\"currenttoken\" value=\"" + token + "\"/>");
            }

            rs.close();
            stmt.close();
            conn.close();

        } catch(Exception ex){
            out.println("오류가 발생했습니다. (발생 오류 : " + ex.getMessage() + ")");
        }
    %>

    <form action="newToken.jsp" method="post">
        새로운 토큰 : <input type="text" id="newtoken" value="">
        <input type="submit" id="maketoken" value="토큰 발행">
    </form>

</div>


<jsp:include page="adminFooter.jsp"/>
</body>
</html>