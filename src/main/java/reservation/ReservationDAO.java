package reservation;

import groovy.servlet.AbstractHttpServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;


import javax.servlet.annotation.WebServlet;
import javax.xml.transform.Result;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import java.sql.SQLException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static java.lang.System.out;

public class ReservationDAO {

    private Connection conn;

    public PreparedStatement pstmt;
    private ResultSet rs;

    // MySQL 접속
    // ReservationDAO를 생성자로 만들어 주고, 자동적으로 데이터베이스 연결이 이뤄지게 해주는 코드를 짠다.
    public ReservationDAO() {
        // 예외 처리를 하기 위해서 try-catch 문을 써준다.
        try {
            // dbURL 안에 localhost라는 것은 본인 컴퓨터에 접속을 의미하고 3306 포트에 연결된 BBSdb에 접속할 수 있게 해준다.
            String dbURL = "jdbc:mysql://localhost:3306/takejava?serverTimezone=Asia/Seoul";

            // db에 접속하는 ID를 담는 부분
            String dbID = "takejava";

            // db에 접속하는 PW를 담는 부분
            String dbPassword = "takejava";

            // mysql에 접속할 수 있는 driver를 찾을 수 있게 해주는 코드
            // driver라는 건 mysql에 접속할 수 있도록 매개체 역할을 해주는 라이브러리이다.
            Class.forName("com.mysql.jdbc.Driver");

            // getConnection 함수 내부에 dbURL에 root root로 접속할 수 있게 해주는 데이터를 넣어 완료되면 conn 객체 안에 접속된 정보가 담기게 된다.
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        } catch (Exception e) {
            // 오류의 내용을 내부 콘솔에 띄우기 위한 함수이다.
            e.printStackTrace();
        }
    }

// 이종민 교수님 책
//@WebServlet(name="InsertServlet", urlPatterns = {"Main/reservation.do"})
//public class ReservationDAO extends HttpServlet {
//
//    protected void processRequest(HttpServletRequest request,
//                                  HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html; charset=UTF-8");
//        PrintWriter out = response.getWriter();
//
//        //DB 연결
//        try {
//            final String JdbcDriver = "com.mysql.jdbc.jdbc.Driver";
//            final String JdbcUrl = "jdbc:mysql://localhost:3306/takejava?serverTimezone=Asia/Seoul";
//            final String User = "takejava";
//            final String Password = "takejava";
//
//            try {
//                // JDBC 드라이버 적재
//                Class.forName(JdbcDriver);
//
//                // Connection 객체 생성
//                Connection conn = DriverManager.getConnection(JdbcUrl, User, Password);
//
//                // PreparedStatement 객체 생성
//                String sql = "INSERT INTO reservation_history VALUE(?,?,?,?,?,?,?)";
//                PreparedStatement pstmt = conn.prepareStatement(sql);
//
//                //SQL문 완성
//                request.setCharacterEncoding("UTF-8");
//                String rsvp_stu_id = request.getParameter("rsvp_stu_id"); // 주키(PK)
//                if (!(rsvp_stu_id == null) && !rsvp_stu_id.equals("")) {
//                    int rsvp_class_num = Integer.parseInt(request.getParameter("rsvp_class_num"));
//                    int rsvp_seat_num = Integer.parseInt(request.getParameter("rsvp_seat_num"));
//                    String rsvp_start_time = request.getParameter("rsvp_start_time");
//                    String rsvp_end_time = request.getParameter("rsvp_end_time");
//                    String rsvp_extend_time = request.getParameter("rsvp_extend_time");
//                    String rsvp_reservation_date = request.getParameter("rsvp_reservation_date");
//
//                    pstmt.setInt(1, Integer.parseInt(rsvp_stu_id));
//                    pstmt.setInt(2, Integer.parseInt(String.valueOf(rsvp_class_num)));
//                    pstmt.setInt(3, Integer.parseInt(String.valueOf(rsvp_seat_num)));
//                    pstmt.setInt(4, Integer.parseInt(rsvp_start_time));
//                    pstmt.setInt(5, Integer.parseInt(rsvp_end_time));
//                    pstmt.setInt(6, Integer.parseInt(rsvp_extend_time));
//                    pstmt.setInt(7, Integer.parseInt(rsvp_reservation_date));
//
//                    // 실행 : PreparedStatement.executeUpdate()는
//                    //       INSERT, UPDATE 또는 DELETE 시 사용 가능함.
//                    pstmt.executeUpdate();
//                }
//                // 자원 해제
//                pstmt.close();
//                conn.close();
//
//                response.sendRedirect("915.jsp");
//
//            } catch (ClassNotFoundException e) {
//                e.printStackTrace();
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//        } catch (NumberFormatException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//    }
//}


    // 예약 정보를 받아 넘기기
    public int reservation(Reservation reservation) {
        //SQL안에 값이 차곡차곡 들어갈 수 있는 쿼리를 작성 해 준다.
        // 객체 생성
        String sql = "INSERT INTO reservation_history VALUE(?,?,?,?,?,?,?)";
        try {
            pstmt.setString(1, reservation.getRsvp_stu_id());
            pstmt.setString(2, reservation.getRsvp_class_num());
            pstmt.setString(3, reservation.getRsvp_seat_num());
            pstmt.setString(4, reservation.getRsvp_start_time());
            pstmt.setString(5, reservation.getRsvp_end_time());
            pstmt.setString(6, String.valueOf(0));
            pstmt.setString(7, reservation.getRsvp_reservation_date());
            // 마지막으로 해당 pstmt 실행 결과를 반환해준다.
            return pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        // 데이터 베이스 오류
        return -1;
    }
}