package util;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;

public class ConnectionPool {
	private static DataSource _ds = null;
	
	public static Connection get() throws NamingException, SQLException{
		if(_ds == null) {
			_ds = (DataSource)(new InitialContext()).lookup(
					"java:comp/env/jdbc/dantalk");
		}
		return _ds.getConnection();
	}
}
