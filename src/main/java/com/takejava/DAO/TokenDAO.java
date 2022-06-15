package com.takejava.DAO;

import com.takejava.connectDb.DbConnection;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import static java.lang.System.out;

public class TokenDAO extends DbConnection {
    private static TokenDAO instance;

    public TokenDAO(){
        super();
        out.println("tokenConnection 생성자");
    }

    // 싱글톤 패턴
    public static TokenDAO getInstance(){
        if(instance == null) instance = new TokenDAO();
        return instance;
    }

    public String getToken(){
        Statement stmt = null;
        ResultSet rs = null;
        String sql = "SELECT token FROM token";

        String token = null;

        try(Connection con = getConnection()){
            out.println("[getToken 연결 성공]");

            stmt = con.createStatement();
            rs = stmt.executeQuery(sql);

            while(rs.next()){
                token = rs.getString("token");
            }
            out.println("token : " + token);

        }catch(Exception ex){
            out.println("오류가 발생했습니다. (발생 오류 : " + ex.getMessage() + ")");
        }

        return token;
    }

}