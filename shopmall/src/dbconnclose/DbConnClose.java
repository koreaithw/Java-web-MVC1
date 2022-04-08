package dbconnclose;

import java.sql.*;

public class DbConnClose {
	
	public static Connection getConnection() {
		try {
			//JDBC 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		}
		//DB연결
		String url = "jdbc:mysql://localhost:3306/shopmall";
		String id = "root";
		String pw = "0000";

		Connection conn = null;  // 디비 연결 객체
		
		try {
			conn = DriverManager.getConnection(url, id, pw);
		} catch (SQLException sqlerr) {
			System.out.println(sqlerr.getMessage());
		}
		return conn;
	}	
	
	//연결해서 구문 던져서 결과 받아올때.
	public static void resourceClose(ResultSet rset, Statement stmt, Connection conn) {
		try {
		if(rset != null) rset.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
		} catch (SQLException sqlerr) {
			System.out.println(sqlerr.getMessage());
		}
	}
	
//	연결해서 구문 던지기만 할때.
	public static void resourceClose(Statement stmt, Connection conn) {
		try {
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
		} catch (SQLException sqlerr) {
			System.out.println(sqlerr.getMessage());
		}
	}
}
