package com.ott.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBConn {
	Connection conn;
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	
	String url = "jdbc:oracle:thin:@localhost:1521";
	String user = "scott";
	String pass = "tiger";	
	
	public DBConn() {
		try {
			//1. 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//System.out.println("-------------->> 드라이버 로딩 성공");
			
			//2. Connection 생성	
			conn = DriverManager.getConnection(url,user,pass);
			//System.out.println("-------------->> Connection 객체 생성");
		}catch(Exception e) {
			e.printStackTrace();
		}		
	}
	
	
	public void getStatement() {
		try {
			stmt = conn.createStatement();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void getPreparedStatement(String sql) {
		try {
			pstmt = conn.prepareStatement(sql);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void close() {
		try {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}













