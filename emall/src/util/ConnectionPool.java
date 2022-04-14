package util;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;

public class ConnectionPool {
	// db 연결해주는 클래스
	private static DataSource _ds = null;
	
	public static Connection get() throws NamingException, SQLException{
		if(_ds == null) {
			_ds = (DataSource)(new InitialContext()).lookup(
					"java:comp/env/jdbc/emall");
		}
		return _ds.getConnection();
	}
}
