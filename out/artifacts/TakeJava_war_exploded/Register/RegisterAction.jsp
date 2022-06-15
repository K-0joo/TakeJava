<%@ page import="TakeJava.User" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<%@ page import="TakeJava.UserDAO" %>
<%@page import="TakeJava.TokenDAO" %>

<%@ page import="java.io.PrintWriter" %>
<%@ page import="TakeJava.Token" %>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="User" class="TakeJava.User" scope="page" />
<jsp:useBean id="Token" class="TakeJava.Token" scope="page" />

<jsp:setProperty name="User" property="stu_id" />
<jsp:setProperty name="User" property="stu_pwd" />
<jsp:setProperty name="User" property="stu_name" />
<jsp:setProperty name="User" property="stu_email" />
<jsp:setProperty name="User" property="stu_phone" />
<jsp:setProperty name="Token" property="token" />

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body>
    <%
//        String stu_id = null;
//        if (session.getAttribute("stu_id") != null) {
//            stu_id = (String) session.getAttribute("stu_id");
//        }
//
//        if (stu_id != null) {
//            PrintWriter script = response.getWriter();
//            script.println("<script>");
//            script.println("alert('이미 로그인이 되어있습니다.')");
//            script.println("location.href = 'test.jsp'");
//            script.println("</script>");
//        }

        //입력 안된 부분이 있을 시 회원가입 시에 사용자가 입력을 안한 모든 경우의 수를 입력해서 조건을 걸어주고,
        if (User.getStu_id() == null || User.getStu_pwd() == null || User.getStu_name() == null
                || User.getStu_email() == null || User.getStu_phone() == null || Token.getToken() == 0 )  {

            //PrintWriter를 이용
            PrintWriter script = response.getWriter();
            script.println("<script>");

            //팝업
            script.println("alert('입력이 안 된 사항이 있습니다.');");

            //다시 돌려보낸다.
            script.println("history.back()");
            script.println("</script>");

        } else {

            TokenDAO tokenDAO = new TokenDAO();

            int tokenresult = tokenDAO.token(Token.getToken());

            System.out.println("Log : no empty");
            System.out.println("Log - tokenvaelue : " + tokenresult);

            if(tokenresult == 2){
                System.out.println("Log : token correct");

                PrintWriter script1 = response.getWriter();
                script1.println("<script>");
                script1.println("alert('토큰 일치 성공');");
                script1.println("</script>");

                //UserDAO에서 만들었던 함수를 사용하기 위해서 인스턴스 생성
                UserDAO userDAO = new UserDAO();
                //userDAO에 있는 join 함수 내의 각각의 변수들을 다 입력 받아서 만들어진 user 인스턴스가 join함수를 실행하도록 명령으로 넣어준 것이다.
                int result = userDAO.Register(User);

                //이 경우는 이미 해당아이디가 존재하는 경우밖에 없다. PRIMARY KEY로 userID를 줬기때문에,
                if (result == -3) {
                    PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("alert('이미 존재하는 아이디입니다.');");
                    script.println("history.back()");
                    script.println("</script>");
                    //정상적인 실행이 되었을때.
                } else {
                    PrintWriter script2 = response.getWriter();
                    script2.println("<script>");
                    script2.println("alert('회원가입 성공. 로그인 화면으로 이동합니다.');");
                    script2.println("</script>");

                    session.setAttribute("stu_id", User.getStu_id());
                    PrintWriter script = response.getWriter();
                    script.println("<script>");

                    //메인페이지로 이동.
                    script.println("location.href = '../LogIn/Login.jsp'");
                    script.println("</script>");

                }

            } else if(tokenresult == -4){
                PrintWriter script4 = response.getWriter();
                script4.println("<script>");
                script4.println("alert('오류가 발생했습니다. 다시 시도해주세요.');");
                script4.println("history.back()");
                script4.println("</script>");
            }

        }
    %>

</body>
</html>