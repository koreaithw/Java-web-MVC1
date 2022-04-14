package jdbc;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.ConnectionPool;

public class ProductDAO {
	
	public ArrayList<ProductDTO> getList()
	throws NamingException, SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM product";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();  // db에서 뭉텅이로 긁어옴
			
			ArrayList<ProductDTO> products = new ArrayList<ProductDTO>();
			// 받은것중에서 하나씩 제거하면서 안의 내용이 있다면 안의 내용을 꺼내와라 
			// DTO 클래스를 객체로 만들어서 받아온 값들을 ArrayList 형태의 뭉텅이로  products에 넣어서 가지고나옴
			while(rs.next()) {
				products.add(new ProductDTO(rs.getString("pid"),
											rs.getString("pname"),
											rs.getString("pprice"),
											rs.getString("pdesc"),
											rs.getString("pmanu"),
											rs.getString("pcate"),
											rs.getString("pcondi")));
			}
			return products;
			
		}finally {
			if(rs!=null) rs.close();
			if(conn!=null) conn.close();
			if(pstmt!=null) pstmt.close();
		}
	}
	
	
	public ProductDTO getDetail(String pid) 
	throws NamingException, SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT * FROM product WHERE pid=?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			// 위의 WHERE 절에서 ? 에 값을 넣어주기 위해서
				pstmt.setString(1, pid);
			rs = pstmt.executeQuery();  // db에서 뭉텅이로 긁어옴
			
			rs.next();
			
			String id = rs.getString(1);
			String pname = rs.getString(2);
			String pprice = rs.getString(3);
			String pdesc = rs.getString(4);
			String pmanu = rs.getString(5);
			String pcate = rs.getString(6);
			String pcondi = rs.getString(7);
			
			ProductDTO product = new ProductDTO(pid, pname, pprice, pdesc, pmanu, pcate, pcondi);
			return product;
		}finally {
			if(rs!=null) rs.close();
			if(conn!=null) conn.close();
			if(pstmt!=null) pstmt.close();
		}
	}
		

}
