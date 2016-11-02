<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>삭제</title>
</head>
<body>
	<%!//선언부 -> 필드
	Connection conn = null; //접속
	PreparedStatement pstmt =null; //쿼리 실행
	ResultSet rs = null; //실행결과
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String uid = "jsp_lesson";
	String pass = "1234";
	String sql = "DELETE FROM MEMBER WHERE NUM=?";
	%>
	<%
	try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String num = request.getParameter("num");
	conn = DriverManager.getConnection(url, uid, pass);
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, Integer.parseInt(num));
	int del =pstmt.executeUpdate();
	if(del>0){
		response.sendRedirect("./L01MemberList.jsp");
	}
	}catch(ClassNotFoundException e){e.printStackTrace();
	}catch(SQLException e){e.printStackTrace();
	};
	%>
</body>
</html>