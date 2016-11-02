<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!//선언부 -> 필드
	Connection conn = null; //접속
	PreparedStatement pstmt =null; //쿼리 실행
	ResultSet rs = null; //실행결과
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String uid = "jsp_lesson";
	String pass = "1234";
	String sql = "UPDATE MEMBER SET pwd=?,name=?,phone=?,email=?,admin=? where num=?";
	%>
	<%
	try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String num = request.getParameter("num");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String admin = request.getParameter("admin");


	conn = DriverManager.getConnection(url, uid, pass);
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, pwd);
	pstmt.setString(2, name);
	pstmt.setString(3, phone);
	pstmt.setString(4, email);
	pstmt.setString(5, admin);
	pstmt.setInt(6, Integer.parseInt(num));
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