package TakeJava;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class ResetPwDAO {

    private Connection conn;

    private PreparedStatement pstmt;

    public ResetPwDAO(){
        try{
            String dbURL = "jdbc:mysql://localhost:3306/takejava?serverTimezone=Asia/Seoul";

            String dbID = "takejava";

            String dbPassword = "takejava";

            Class.forName("com.mysql.jdbc.Driver");

            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        } catch (Exception e) {
            // 오류의 내용을 내부 콘솔에 띄우기 위한 함수이다.
            e.printStackTrace();
        }
    }

    public int reset(int stu_id) {
        String SQL = "UPDATE takejava.student SET stu_pwd = '1234' WHERE stu_id = ?";

        try {
            // 로그인 실행 파트
            pstmt = conn.prepareStatement(SQL);

            pstmt.setInt(1, stu_id);

            return pstmt.executeUpdate();

            //return 3;


        } catch (Exception e) {
            e.printStackTrace();
        }

        //db 오류
        return -6;
    }

}
