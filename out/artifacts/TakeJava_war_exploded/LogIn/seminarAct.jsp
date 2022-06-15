<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="TakeJava.ManageUser" %>


<%--<!-- 앞서 만들었던 User.DAO의 객체를 사용하기 위해 선언-->--%>
<%--<%@ page import="TakeJava.ManageUserDAO" %>--%>

<!-- 자바 스크립트 문장을 작성하기 위해 사용하는 내부 라이브러리 -->
<%@ page import="java.io.PrintWriter" %>
<%@ page import="TakeJava.ManageUserDAO" %>
<%@ page import="TakeJava.SeminarForm" %>

<!-- 건너오는 모든 데이터를 UTF-8로 받기 위해 가져오는 것 -->
<% request.setCharacterEncoding("UTF-8"); %>

<!-- javaBeans를 사용. scope로 현재 페이지에서만 사용을 선언 -->
<jsp:useBean id="user" class="TakeJava.ManageUser" scope="page" />

<!-- 로그인 페이지에서 넘겨준 user 정보를 받아서 한명의 사용자에 데이터에 값을 넣어 주는 것 -->
<jsp:setProperty name="user" property="admin_id" />

<!-- loginAction.jsp 안에 넘어온 데이터들이 그대로 담기게 됨. -->
<jsp:setProperty name="user" property="admin_pwd" />

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>로그인</title>
</head>

<body>


<%
    String admin_id = null;
    if(session.getAttribute("admin_id") != null) {
        admin_id = (String) session.getAttribute("admin_id");
    }



    int classNum = Integer.parseInt(request.getParameter("class"));
    String date = request.getParameter("date");
    String startTime = request.getParameter("startTime");
    String endTime = request.getParameter("endTime");
    SeminarForm seminarForm =new SeminarForm();
    seminarForm.setClassNum(classNum);
    seminarForm.setProfName(admin_id);
    String[] split = date.split("-");
    seminarForm.setYear(Integer.parseInt(split[0]));
    seminarForm.setMonth(Integer.parseInt(split[1]));
    seminarForm.setDay(Integer.parseInt(split[2]));
    seminarForm.setEnd(endTime+":00");
    seminarForm.setStart(startTime+":00");

    System.out.println("classNum = " + classNum);
    System.out.println("date = " + date);
    System.out.println("startTime = " + startTime);
    System.out.println("endTime = " + endTime);


    // UserDAO 인스턴스 생성
    ManageUserDAO manageUserDAO = new ManageUserDAO();
    // UserDAO에서 만들었던 public int login(userID, userPW)를 넣어주는 것을 변수 result에 담음.
    boolean result = manageUserDAO.seminarReservationStatus(seminarForm);
    if (result) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('이미예약이 있습니다.');");
        script.println("history.back()");
        script.println("</script>");
    } else {
        int i = manageUserDAO.insertSeminar(seminarForm);
        if (i==1) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('성공');");
            script.println("location.href = 'professorPage.jsp'");
            script.println("</script>");
        } else {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('실패');");
            script.println("history.back()");
            script.println("</script>");
        }

    }



%>


</body>

</html>