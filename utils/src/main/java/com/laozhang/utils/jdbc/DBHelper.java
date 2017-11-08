package com.laozhang.utils.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class DBHelper {

	public static final String url = "jdbc:mysql://127.0.0.1/shiro";  
    public static final String name = "com.mysql.jdbc.Driver";  
    public static final String user = "root";  
    public static final String password = "taobang";  
  
    public Connection conn = null;  
    public PreparedStatement pst = null;  
    
    public DBHelper(String sql) {
    	try {
			Class.forName(name);
			conn = DriverManager.getConnection(url, user, password);
			pst = conn.prepareStatement(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    
    public void close() {
    	try {
    		if (null != pst) {
    			pst.close();
    		}
			if (null != conn) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    
}
