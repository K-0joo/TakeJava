<%@ page import="reservation.Reservation" %>
<!-- 넘어오는 데이터를 UTF-8로 받기 위해 가져오는 것 -->
<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<%@ page import="reservation.ReservationDAO" %>
<%@ page import="java.io.PrintWriter" %>

<!-- 현재 페이지에서만 bean이 사용가능하게 해주는 태그 -->
<jsp:useBean id="Reservation" class="reservation.Reservation" scope="page" />

<!-- reservation에서 받아오는 값들 선언 -->
<jsp:setProperty name="Reservation" property="rsvp_stu_id" />
<jsp:setProperty name="Reservation" property="rsvp_class_num" />
<jsp:setProperty name="Reservation" property="rsvp_seat_num" />
<jsp:setProperty name="Reservation" property="rsvp_start_time" />
<jsp:setProperty name="Reservation" property="rsvp_end_time" />
<jsp:setProperty name="Reservation" property="rsvp_extend_time" />
<jsp:setProperty name="Reservation" property="rsvp_reservation_date" />

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<%

    if (Reservation.getRsvp_stu_id() == null || Reservation.getRsvp_class_num() == null || Reservation.getRsvp_seat_num() == null
            || Reservation.getRsvp_start_time() == null || Reservation.getRsvp_end_time() == null || Reservation.getRsvp_extend_time() == null
            || Reservation.getRsvp_reservation_date() == null) {

        //PrintWriter를 이용
        PrintWriter script = response.getWriter();
        script.println("<script>");

        //팝업
        script.println("alert('입력이 안 된 사항이 있습니다.');");

        //다시 돌려보낸다.
        script.println("history.back()");
        script.println("</script>");

        // 입력이 다 되어있으면
    } else {
        //ReservationDAO에서 만들었던 함수를 사용하기 위해 인스턴스 생성
        ReservationDAO reservationDAO = new ReservationDAO();
        //ReservationDAO 있는 reservation함수 내의 각각의 변수들을 다입력 받아서 만들어진 Reservation인스턴스가 reservation함수를 실행하도록 명령으로 넣어준것이다.
//            int result = reservationDAO.reservation(Reservation);
        int result= 1;
        if (result == -1) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('이미 예약된 좌석입니다.');");
            script.println("history.back()");
            script.println("</script>");
            //정상적인 실행이 되었을때.
        } else {
            PrintWriter script2 = response.getWriter();
            script2.println("<script>");
            script2.println("alert('좌석이 예약되었습니다:)');");
            script2.println("</script>");

            session.setAttribute("userID", Reservation.getRsvp_stu_id());
            PrintWriter script = response.getWriter();
            script.println("<script>");
            //팝업창 닫기
            script.println("window.close()");
            script.println("</script>");
        }

    }
%>

</body>
</html>

<%--<%@page import="java.sql.DriverManager"%>--%>

<%--<%@page import="java.sql.PreparedStatement"%>--%>
<%--<%@page import="java.sql.Connection"%>--%>
<%--<%@ page language="java" contentType="text/html; charset=UTF-8"--%>
<%--         pageEncoding="UTF-8"%>--%>
<%--<%--%>
<%--    request.setCharacterEncoding("UTF-8");--%>

<%--    String id = request.getParameter("rsvp_stu_id");--%>
<%--    String pw = request.getParameter("rsvp_class_num");--%>
<%--    String name = request.getParameter("rsvp_seat_num");--%>
<%--    String phone1 = request.getParameter("rsvp_start_time");--%>
<%--    String phone2 = request.getParameter("rsvp_end_time");--%>
<%--    String phone3 = request.getParameter("rsvp_extend_time");--%>
<%--    String gender = request.getParameter("rsvp_reservation_date");--%>

<%--    // 1.변수선언--%>
<%--    String url = "jdbc:mysql://localhost:3306/takejava?serverTimezone=Asia/Seoul";--%>
<%--    String uid = "takejava";--%>
<%--    String upw = "takejava";--%>

<%--    Connection conn = null;--%>
<%--    PreparedStatement pstmt = null;--%>

<%--    String sql = "insert into members values(?, ?, ?, ?, ?, ?, ?)";--%>

<%--    try{--%>
<%--        // 1. 드라이버 로드--%>
<%--        Class.forName("com.mysql.jdbc.Driver");--%>

<%--        // 2. conn 생성--%>
<%--        conn = DriverManager.getConnection(url, uid, upw);--%>

<%--        // 3. pstmt 생성--%>
<%--        pstmt = conn.prepareStatement(sql);--%>
<%--        pstmt.setString(1, rsvp_stu_id);--%>
<%--        pstmt.setString(2, rsvp_class_num);--%>
<%--        pstmt.setString(3, rsvp_seat_num);--%>
<%--        pstmt.setString(4, rsvp_start_time);--%>
<%--        pstmt.setString(5, rsvp_end_time);--%>
<%--        pstmt.setString(6, rsvp_extend_time);--%>
<%--        pstmt.setString(7, rsvp_reservation_date);--%>

<%--        // 4. sql문 실행--%>
<%--        int result = pstmt.executeUpdate();--%>

<%--        if(result == 1){ // 성공--%>
<%--            response.sendRedirect("reservation_succes.jsp");--%>
<%--        } else{ // 실패--%>
<%--            response.sendRedirect("reservation_fail.jsp");--%>
<%--        }--%>

<%--    } catch(Exception e){--%>
<%--        e.printStackTrace();--%>
<%--    } finally{--%>
<%--        try{--%>
<%--            if(conn != null) conn.close();--%>
<%--            if(pstmt != null) pstmt.close();--%>
<%--        } catch(Exception e){--%>
<%--            e.printStackTrace();--%>
<%--        }--%>
<%--    }--%>
<%--%>--%>