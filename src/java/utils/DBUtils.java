/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Nguyen Thi Thuy Dung
 */
public class DBUtils {
    private static final String USER_NAME = "sa";
    private static final String PASSWORD = "12345";
    private static final String DB_NAME = "UserManagement";
    public static Connection getConnection() throws ClassNotFoundException, SQLException{
        Connection con = null;
        String url = "jdbc:sqlserver://localhost:1433;databaseName=" + DB_NAME;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        con = DriverManager.getConnection(url, USER_NAME, PASSWORD);
        return con;
    }
}
