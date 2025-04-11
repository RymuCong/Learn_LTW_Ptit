package com.ptit.demo.dal;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBContext {
    /*USE BELOW METHOD FOR YOUR DATABASE CONNECTION FOR BOTH SINGLE AND MULTILPE
SQL SERVER INSTANCE(s)*/
    /*DO NOT EDIT THE BELOW METHOD, YOU MUST USE ONLY THIS ONE FOR YOUR DATABASE
CONNECTION*/
    public Connection getConnection() throws Exception {
        String url = "jdbc:sqlserver://"+serverName+":"+portNumber +";databaseName="+dbName+";encrypt=true;trustServerCertificate=true";
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url, userID, password);
    }
    private final String serverName = "localhost";
    private final String dbName = "Trading2024";
    private final String portNumber = "1433";
    private final String userID = "sa";
    private final String password = "123";
}
