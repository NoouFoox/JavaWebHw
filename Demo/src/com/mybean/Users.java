package com.mybean;

import java.sql.*;

public class Users {
	private String username;
	private String password;
	
	public Users() {
		super();
	}
	public Users(String username,String passwprd) {
		super();
		this.username=username;
		this.password=passwprd;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	public boolean loginCheck() {
		Connection conn = null;
		Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/beitzdb?useSSL=true&serverTimezone=GMT&characterEncodding=UTF8","root", "root");
			String sql="select * from users where username=? and password=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			rs=pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}
}
