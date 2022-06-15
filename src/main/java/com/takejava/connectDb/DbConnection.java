package com.takejava.connectDb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DbConnection {    // 데이터베이스에 연결하기 위한 정보
    private static final String JdbcDriver = "com.mysql.jdbc.Driver"; // 1. JDBC Driver Class
    private static final String JdbcUrl = "jdbc:mysql://localhost:3306/takejava?serverTimezone=Asia/Seoul";
    private static final String User = "takejava"; // 데이터베이스 ID
    private static final String Password = "takejava"; // 데이터베이스 PW

    public DbConnection()  {
        try {
            Class.forName(JdbcDriver); // JDBC 드라이버 로딩
        } catch (ClassNotFoundException ex) {
            System.out.println(ex.getException());
            Logger.getLogger(DbConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Connection getConnection() throws SQLException {
        return DriverManager.getConnection(JdbcUrl, User, Password);
    }
}
