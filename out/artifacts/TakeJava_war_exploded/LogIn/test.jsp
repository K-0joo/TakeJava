<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 교수님 소스 -->
<%@page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>컴퓨터</title>
</head>

<body>
<%
    final String JdbcDriver = "com.mysql.cj.jdbc.Driver";
    final String JdbcUrl = "jdbc:mysql://localhost:3306/security?serverTimezone=Asia/Seoul";
    final String User = "root";
    final String Password = "1030";

    try{
        //1. JDBC 드라이버 적재
        Class.forName(JdbcDriver);

        //2. Connection 객체 생성
        Connection conn = DriverManager.getConnection(JdbcUrl, User, Password);

        //3. Statement 객체 생성
        Statement stmt = conn.createStatement();

        //4. SQL 질의(query) 실행
        String sql = "SELECT  * FROM admin";
        ResultSet rs = stmt.executeQuery(sql);

        //5. SQL 질의 결과 활용
        // 테이블 헤더

%>

<table border="1">
    <thead>
    <tr>
        <th>
            아이디
        </th>
        <th>
            이름
        </th>
        <th>
            비번
        </th>
        <th>
            역할
        </th>
    </tr>
    </thead>

    <tbody>
    <%
        while(rs.next()){
            // 테이블 몸체
            out.println("<tr>");
            out.println("<td>" + rs.getString("admin_id") + "</td>");
            out.println("<td>" + rs.getString("admin_name") + "</td>");
            out.println("<td>" + rs.getString("admin_pwd") + "</td>");
            out.println("<td>" + rs.getString("admin_position") + "</td>");
            out.println("</tr>");
        }
        // 6. 자원 해제
        rs.close();
        stmt.close();
        conn.close();

    %>
    </tbody>
</table>
<%

    }catch(Exception ex){
        out.println("오류가 발생했습니다. (발생 오류: " +ex.getMessage() + ")");
    }

%>
</body>
</html>