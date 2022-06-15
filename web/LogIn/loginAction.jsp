<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="TakeJava.User" %>

<!-- 앞서 만들었던 User.DAO의 객체를 사용하기 위해 선언-->
<%@ page import="TakeJava.UserDAO" %>

<!-- 자바 스크립트 문장을 작성하기 위해 사용하는 내부 라이브러리 -->
<%@ page import="java.io.PrintWriter" %>

<!-- 건너오는 모든 데이터를 UTF-8로 받기 위해 가져오는 것 -->
<% request.setCharacterEncoding("UTF-8"); %>

<!-- javaBeans를 사용. scope로 현재 페이지에서만 사용을 선언 -->
<jsp:useBean id="User" class="TakeJava.User" scope="page" />

<!-- 로그인 페이지에서 넘겨준 user 정보를 받아서 한명의 사용자에 데이터에 값을 넣어 주는 것 -->
<jsp:setProperty name="User" property="stu_id" />

<!-- loginAction.jsp 안에 넘어온 데이터들이 그대로 담기게 됨. -->
<jsp:setProperty name="User" property="stu_pwd" />

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>로그인</title>
</head>

<body>
    <%
//        String stu_id = null;
//        if(session.getAttribute("stu_id") != null) {
//            stu_id = (String) session.getAttribute("stu_id");
//        }
//        if(stu_id != null) {
//            PrintWriter script = response.getWriter();
//            script.println("<script>");
//            script.println("alert('이미 로그인이 되어 있습니다.')");
//            script.println("location.href = 'test.jsp'");
//            script.println("</script>");
//        }

        // UserDAO 인스턴스 생성
        UserDAO userDAO = new UserDAO();

        // UserDAO에서 만들었던 public int login(userID, userPW)를 넣어주는 것을 변수 result에 담음.
        int result = userDAO.login(User.getStu_id(), User.getStu_pwd());

        // login 함수에서 return 값이 1이라면
        if(result == 1) {
            session.setAttribute("stu_id", User.getStu_id());

            // 하나의 스크립트 문장을 넣어줄 수 있도록 한다.
            PrintWriter script = response.getWriter();

            // println으로 접근해서 스크립트 문장을 유동적으로 실행 할 수 있게 한다.
            script.println("<script>");

            // 메인 페이지로 넘겨주는 선언을 해준다.
            script.println("location.href = 'test.jsp'");

            // 스크립트 태그를 닫아준다.
            script.println("</script>");
        }

        // 비밀번호가 틀렸을 때
        else if(result == 0) {
            PrintWriter script = response.getWriter();
            script.println("<script>");

            // 웹페이지에 팝업을 띄워준다.
            script.println("alert('비밀번호가 틀립니다.');");

            // 이전 페이지로 사용자를 다시 돌려보내는 함수이다.
            script.println("history.back()");
            script.println("</script>");
        }

        // 아이디가 없을때
        else if(result == -1){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('존재하지 않는 아이디입니다.');");
            script.println("history.back()");
            script.println("</script>");
        }

        // db연결이 안될 때
        else if(result == -2){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('데이터베이스 오류가 발생했습니다.');");
            script.println("history.back()");
            script.println("</script>");

        }
    %>


</body>

</html>