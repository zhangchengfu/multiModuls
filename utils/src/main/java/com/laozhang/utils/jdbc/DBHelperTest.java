package com.laozhang.utils.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

public class DBHelperTest {

	static String sql = null;  
    static DBHelper db1 = null;  
    static ResultSet ret = null;
    
    public static void main(String[] args) {
    	sql = "select id,organization_id,username,password,salt,role_ids,locked from sys_user where locked=0";//SQL语句
    	db1 = new DBHelper(sql);//创建DBHelper对象
    	
    	try {
    		ret = db1.pst.executeQuery();//执行语句，得到结果集 
    		while(ret.next()) {
    			int id = ret.getInt(1);
    			int organId = ret.getInt(2);
    			String username = ret.getString(3);
    			String password = ret.getString(4);
    			String salt = ret.getString(5);
    			int locked = ret.getInt(7);
    			System.out.println("id:" + id + "\t" + "username:" + username + "\t" + "password:" + password + "\n");
    		}
    		ret.close();
    		db1.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
