package TakeJava;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ManageUserDAO {
    // Database 접근 객체로 사용할 conn을 선언해준다.
    private static Connection conn;

    // 정보를 담을 수 있는 객체를 선언한다.
    private PreparedStatement pstmt;
    private ResultSet rs;


    // MySQL 접속
    // UserDAO를 생성자로 만들어 주고, 자동적으로 데이터베이스 연결이 이뤄지게 해주는 코드를 짠다.
    public ManageUserDAO(){
        // 예외 처리를 하기 위해서 try-catch 문을 써준다.
        try {
            // dbURL 안에 localhost라는 것은 본인 컴퓨터에 접속을 의미하고 3306 포트에 연결된 BBSdb에 접속할 수 있게 해준다.
            String dbURL = "jdbc:mysql://localhost:3306/security?serverTimezone=Asia/Seoul";

            // db에 접속하는 ID를 담는 부분
            String dbID = "root";

            // db에 접속하는 PW를 담는 부분
            String dbPassword = "1030";

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

    // 로그인 입력받아 실행하기
    public int login(String admin_id, String admin_pwd){
        // 입력받은 userID와 userPassword가 일치하는지 확인을 하기 위해 db 내에서 userID 값에 대한 PW를 조회하는 쿼리를 넣어줌.
        // 해킹방지를 위해 중간에 ?를 넣어준다.
        String SQL = "SELECT admin_pwd FROM admin WHERE admin_id = ?";
        // try-catch문으로 예외처리를 해준다.
        try{
            // pstmt에 어떠한 정해진 sql 문장을 데이터베이스에 사입하는 형식으로 이스턴스를 가져온다.
            pstmt = conn.prepareStatement(SQL);

            // 쿼리 중 userID = ?에 해당하는 부분에 입력받은 userID를 넣어주는 것. setString으로 한번 거침.
            pstmt.setString(1, admin_id);

            // 실행한 결과를 rs에 담아준다.
            rs = pstmt.executeQuery();

            // 로그인 실행 파트
            if(rs.next()){
                // 만약 rs에 들어있는 값과 db 내부의 userPW가 일치하면 login 성공
                if(rs.getString(1).equals(admin_pwd)) {
                    //로그인 성공
                    return 1;
                }
            } else{
                // 비밀번호 미 일치시 실행
                return 0;
            }

            // 아이디가 없을 때
            return -1;

        } catch (Exception e) { // 그 외의 예상 불가 예외는 catch로 잡아줌.
            e.printStackTrace();
        }

        // 데이터베이스 오류
        return -2;
    }

    public boolean isSeminar(int classNum) {
        String sql ="SELECT * FROM seminar where seminar_class_num =? and Date_Format(now(),'%Y-%m-%d')=date_format(CONCAT(cast(seminar_year as char),'-',cast(seminar_month as char),'-',cast(seminar_day as char),'-'),'%Y-%m-%d') and seminar_start_time<Date_Format(now(),'%H:%i:%s') and seminar_end_time > Date_Format(now(),'%H:%i:%s');";
        try{
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, classNum);

            ResultSet resultSet = pstmt.executeQuery();
            if (resultSet.next()) {
             return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            //종료 ~
        }
        return false;

    }

    public boolean seminarReservationStatus(SeminarForm seminar) {
        String SQL ="select * from seminar where seminar_year = ? and seminar_month = ? and seminar_day=? and seminar_class_num =?  and seminar_start_time<Date_Format(?,'%H:%i:%s') and seminar_end_time > Date_Format(?,'%H:%i:%s');";
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, seminar.getYear());
            pstmt.setInt(2, seminar.getMonth());
            pstmt.setInt(3, seminar.getDay());
            pstmt.setInt(4, seminar.getClassNum());
            pstmt.setString(5, seminar.getStart());
            pstmt.setString(6,seminar.getEnd());
            ResultSet resultSet = pstmt.executeQuery();
            if (resultSet.next()) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            //종료 ~
        }
        return false;
    }

    public int insertSeminar(SeminarForm seminar) {
        String SQL ="insert into seminar values(?,?,?,?,?,?,?);";
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, seminar.getProfName());
            pstmt.setInt(2, seminar.getYear());
            pstmt.setInt(3, seminar.getMonth());
            pstmt.setInt(4, seminar.getDay());
            pstmt.setInt(5, seminar.getClassNum());
            pstmt.setString(6, seminar.getStart());
            pstmt.setString(7,seminar.getEnd());
            int i = pstmt.executeUpdate();
            return i;
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            //종료 ~
        }
        return 0;
    }
    public List<Seat> seatStatus(int classNum){

       // String SQL = "Select * from seats s left join reservation_history r on s.seat_num = r.rsvp_seat_num and s.seat_class_num = r.rsvp_class_num  left join student st on st.stu_id = r.rsvp_stu_id  where s.seat_class_num=? and r. rsvp_reservation_date=Date_Format(now(),'%Y-%m-%d') and r.rsvp_end_time >=Date_Format(now(),'%H:%i:%s') or (s.seat_class_num=? and s.seat_state='n');";
        String SQL ="Select * from seats s left join reservation_history r on s.seat_num = r.rsvp_seat_num and s.seat_class_num = r.rsvp_class_num  left join student st on st.stu_id = r.rsvp_stu_id  where s.seat_class_num=? and r. rsvp_reservation_date=Date_Format(now(),'%Y-%m-%d') and r.rsvp_end_time >=Date_Format(now(),'%H:%i:%s') or (s.seat_class_num=? and r.rsvp_extend_time >=Date_Format(now(),'%H:%i:%s')) or (s.seat_class_num=? and s.seat_state='n');";


        List<Seat> seatList =new ArrayList<>();
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, classNum);
            pstmt.setInt(2, classNum);
            pstmt.setInt(3, classNum);

            ResultSet resultSet = pstmt.executeQuery();
            while (resultSet.next()) {
                Seat seat = new Seat();
                seat.setSeatStatus(resultSet.getString("seat_state").equals("y"));
                seat.setEndTime(resultSet.getString("rsvp_end_time"));
                seat.setExtendTime(resultSet.getString("rsvp_extend_time"));
                seat.setSetNumber(resultSet.getInt("seat_num"));
                seat.setStartTime(resultSet.getString("rsvp_start_time"));
                seat.setPhoneNumber(resultSet.getInt("stu_phone"));
                seat.setUsername(resultSet.getString("stu_name"));
                seat.setEmail(resultSet.getString("stu_email"));
                seatList.add(seat);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            //종료 ~
        }
        return seatList;

    }




}
