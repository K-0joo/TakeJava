package com.takejava.DAO;

import com.takejava.connectDb.DbConnection;

import java.sql.*;

import static java.lang.System.out;

public class TokenDAO extends DbConnection {
    private static TokenDAO instance;

    public TokenDAO(){
        super();
        out.println("tokenConnection 생성자");
    }

    public static TokenDAO getInstance(){ // 싱글톤 패턴
        if(instance == null) instance = new TokenDAO();
        return instance;
    }

    public int selectToken(){ // 데이터베이스에서 토큰 가져오기
        Statement stmt = null;
        ResultSet rs = null;
        String sql = "SELECT token FROM token";

        int token=0;

        try(Connection con = getConnection()){
            out.println("[getToken 연결 성공]");

            stmt = con.createStatement();
            rs = stmt.executeQuery(sql);

            while(rs.next()){
                token = rs.getInt("token");
            }
            out.println("token : " + token);

        } catch(Exception ex){
            out.println("오류가 발생했습니다. (발생 오류 : " + ex.getMessage() + ")");
        }

        return token;
    }

    public void newToken(int newtoken){ // 데이터베이스에 새로운 토큰 저장
        PreparedStatement stmt = null;
        String sql = "update token set token = ?";

        try(Connection con = getConnection()){
            out.println("[newToken 연결 성공]");

            stmt = con.prepareStatement(sql);
            stmt.setInt(1, newtoken);

            int result = stmt.executeUpdate();
            if(result > 0){
                out.println("새로운 토큰 발행 성공 : " + newtoken);
            }
            else {
                out.println("토큰 업데이트 실패함");
            }
        } catch(Exception ex){
            out.println("오류가 발생했습니다. (발생 오류 : " + ex.getMessage() + ")");
        } finally {
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

}