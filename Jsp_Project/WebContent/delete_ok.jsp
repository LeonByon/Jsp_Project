<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id ="jspproject";
	String pass = "1234";
	String password = null;
	int idx = Integer.parseInt(request.getParameter("idx"));
	String passw = request.getParameter("password");

	try{

		Connection conn = DriverManager.getConnection(url,id,pass);
		Statement stmt = conn.createStatement();

		String sql = "SELECT PASSWORD FROM board WHERE NUM=" + idx;
		ResultSet rs = stmt.executeQuery(sql);

		 if(rs.next()){
				password = rs.getString(1);

   		}
		 if(password.equals(passw)){
			 sql = "delete from board where num=" + idx;
			 stmt.executeUpdate(sql);
%>
	<script language=javascript>
		self.window.alert("해당 글을 삭제하였습니다.");
		location.href="list.jsp";
	</script>
<%
	rs.close();
	stmt.close();
	conn.close();
		 }else{
%>
	<script language = javascript>
		self.window.alert("비밀번호를 틀렸습니다.");
		location.href="javascript:history.back()";
	</script>
<%
		 }
		 }catch(SQLException e){e.printStackTrace();}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>