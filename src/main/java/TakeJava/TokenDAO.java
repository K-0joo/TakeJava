package TakeJava;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class TokenDAO {
    // Database 접근 객체로 사용할 conn을 선언해준다.
    private Connection conn;

    // 정보를 담을 수 있는 객체를 선언한다.
    private PreparedStatement pstmt;
    private ResultSet rs;

    // MySQL 접속
    public TokenDAO(){
        // 예외 처리를 하기 위해서 try-catch 문을 써준다.
        try {
            // dbURL 안에 localhost라는 것은 본인 컴퓨터에 접속을 의미하고 3306 포트에 연결된 db에 접속할 수 있게 해준다.
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

    // 토큰 받아 실행하기
    public int token(int token){
        String SQL = "SELECT * FROM takejava.token WHERE token = ?";
        // String SQL = "SELECT token FROM takejava.token WHERE token = ?";

        try{
            // pstmt에 어떠한 정해진 sql 문장을 데이터베이스에 삽입하는 형식으로 인스턴스를 가져온다.
            pstmt = conn.prepareStatement(SQL);

            // 쿼리 중 userID = ?에 해당하는 부분에 입력받은 값을 넣어주는 것. setString으로 한번 거침.
            pstmt.setInt(1, token);

            // 실행한 결과를 rs에 담아준다.
            rs = pstmt.executeQuery();


            // 토큰 확인 파트
            if(rs.next()){
                // 만약 rs에 들어있는 값과 db 내부의 token이 일치하면 성공
                //rs.getString(1).equals(stu_pwd)
                if(rs.getInt(1) == token) {
                    // 토큰 일치
                    return 2;
                }
            }

        } catch (Exception e) { // 그 외의 예상 불가 예외는 catch로 잡아줌.
            e.printStackTrace();
        }
        // 오류
        return -4;
    }

}
