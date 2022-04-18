package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.ConnectionPool;

public class BoardDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<BoardDTO> getList()
	throws NamingException, SQLException{
			
		try {
			String sql = "SELECT * FROM board ORDER BY bdate DESC";
			 
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
											rs.getString("bdate"),
											rs.getString("bimage")));
			}
			return boards;
			
		}finally {
			if(rs!=null) rs.close();
			if(conn!=null) conn.close();
			if(pstmt!=null) pstmt.close();
		}
	}
	
	public boolean insert(String btitle, String bcontent, String buser, String bimage) 
			throws NamingException, SQLException{
			
		try {
			String sql = "INSERT INTO board(btitle, bcontent,buser,bimage) VALUES (?,?,?,?)";
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, btitle);
				pstmt.setString(2, bcontent);
				pstmt.setString(3, buser);
				pstmt.setString(4, bimage);
				
			int result = pstmt.executeUpdate(); //성공적으로 반환이되면 0 이상의 수를 반환
			
			return (result>0)? true:false;			
			
		} finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	public BoardDTO getContent(int bid)
	throws NamingException, SQLException{
	
		try {
			String sql = "SELECT * FROM board WHERE bid=? ";
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, bid);
			rs = pstmt.executeQuery();
				// 받은것중에서 하나씩 제거하면서 안의 내용이 있다면 안의 내용을 꺼내와라 
				// DTO 클래스를 객체로 만들어서 받아온 값들을 ArrayList 형태의 뭉텅이로  products에 넣어서 가지고나옴
				rs.next();
				String id = rs.getString(1);
				String btitle = rs.getString(2);
				String bcontent = rs.getString(3);
				String buser = rs.getString(4); 
				String bdate = rs.getString(5);
				String bimage = rs.getString(6);
				
				BoardDTO boards = new BoardDTO(id,btitle,bcontent,buser,bdate,bimage);
				return boards;
				
			}finally {
				if(rs!=null) rs.close();
				if(conn!=null) conn.close();
				if(pstmt!=null) pstmt.close();
			}
	}
	                                                        
	public boolean update(String bid, String btitle, String bcontent, String bimage) 
			throws NamingException, SQLException{
			
		try {
			String sql = "UPDATE board SET btitle = ?, bcontent=?, bimage=? WHERE bid=?";
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, btitle);
				pstmt.setString(2, bcontent);
				pstmt.setString(3, bimage);
				pstmt.setString(4, bid);
				
				
			int result = pstmt.executeUpdate(); //성공적으로 반환이되면 0 이상의 수를 반환
			
			return (result>0)? true:false;			
			
		} finally {
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
		}
	}
	
	
}


