package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.ConnectionPool;

public class InformDAO {
	public ArrayList<BoardDTO> getList()
			throws NamingException, SQLException{
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				try {
					String sql = "SELECT * FROM board";
					
					conn = ConnectionPool.get();
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();  // db에서 뭉텅이로 긁어옴
					
					ArrayList<BoardDTO> boards = new ArrayList<BoardDTO>();
					// 받은것중에서 하나씩 제거하면서 안의 내용이 있다면 안의 내용을 꺼내와라 
					// DTO 클래스를 객체로 만들어서 받아온 값들을 ArrayList 형태의 뭉텅이로  products에 넣어서 가지고나옴
					while(rs.next()) {
						boards.add(new BoardDTO(rs.getString("bid"),
													rs.getString("btitle"),
													rs.getString("bcontent"),
													rs.getString("buser"),
													rs.getString("bdate")));
					}
					return boards;
					
				}finally {
					if(rs!=null) rs.close();
					if(conn!=null) conn.close();
					if(pstmt!=null) pstmt.close();
				}
			}
}
