<%--
  Created by IntelliJ IDEA.
  User: tyty4
  Date: 2022-06-15
  Time: 오후 3:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="TakeJava.ResetPw" %>

<!-- 앞서 만들었던 User.DAO의 객체를 사용하기 위해 선언-->
<%@ page import="TakeJava.ResetPwDAO" %>

<!-- 자바 스크립트 문장을 작성하기 위해 사용하는 내부 라이브러리 -->
<%@ page import="java.io.PrintWriter" %>

<!-- 건너오는 모든 데이터를 UTF-8로 받기 위해 가져오는 것 -->
<% request.setCharacterEncoding("UTF-8"); %>

<!-- javaBeans를 사용. scope로 현재 페이지에서만 사용을 선언 -->
<jsp:useBean id="ResetPw" class="TakeJava.ResetPw" scope="page" />

<!-- 로그인 페이지에서 넘겨준 user 정보를 받아서 한명의 사용자에 데이터에 값을 넣어 주는 것 -->
<jsp:setProperty name="ResetPw" property="stu_id" />

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>비밀번호 초기화</title>
</head>

<body>
<%
    // UserDAO 인스턴스 생성
    ResetPwDAO resetPwDAO = new ResetPwDAO();

    // UserDAO에서 만들었던 public int login(userID, userPW)를 넣어주는 것을 변수 result에 담음.
    int result = resetPwDAO.reset(ResetPw.getStu_id());

    // 비밀번호 변경이 성공했을 때

    session.setAttribute("stu_id", ResetPw.getStu_id());

    // 하나의 스크립트 문장을 넣어줄 수 있도록 한다.
    PrintWriter script = response.getWriter();

    // println으로 접근해서 스크립트 문장을 유동적으로 실행 할 수 있게 한다.
    script.println("<script>");
    script.println("alert('비밀번호 변경 성공!');");

    // 메인 페이지로 넘겨주는 선언을 해준다.
    script.println("location.href = '../LogIn/Login.jsp'");

    // 스크립트 태그를 닫아준다.
    script.println("</script>");


    // 데이터베이스 오류
    if(result == -6){
        PrintWriter script2 = response.getWriter();
        script2.println("<script>");
        script2.println("alert('데이터베이스 오류가 발생했습니다.');");
        script2.println("history.back()");
        script2.println("</script>");
    }

%>


</body>

</html>
