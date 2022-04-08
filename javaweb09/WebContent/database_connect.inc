<%
	
//JDBC 드라이버 로딩
	Class.forName("com.mysql.jdbc.Driver"); //WEB_INF에 lib에 connector파일이 들어있나 확인하는 구문,
//DB 연결
	String url = "jdbc:mysql://localhost:3306/university";
	String id = "root";
	String pw = "0000";
	
	Connection conn = null;  //DB 연결객체
	PreparedStatement pstmt = null; //DB에 전달할 SQL 구문객체.
	ResultSet rset =null; //DB 에서 꺼내올 데이터 들을 담을 객체.
	
	conn = DriverManager.getConnection(url,id,pw);
%>