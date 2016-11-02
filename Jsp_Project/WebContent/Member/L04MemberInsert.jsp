<%@page import="java.sql.Statement"%>
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
<title>정보 수정</title>
</head>
<body>
	<jsp:useBean id="mem" class="com.jsp.bean.Member" />
	<jsp:setProperty property="*" name="mem"/>
	<%!//선언부 -> 필드
	Connection conn = null; //접속
	PreparedStatement pstmt =null; //쿼리 실행
	Statement stmt = null;
	ResultSet rs = null; //실행결과
	int maxNum = 0;
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String uid = "jsp_lesson";
	String pass = "1234";
	String sql = "INSERT INTO MEMBER (num,id,pwd,name,phone,email,admin,indate) VALUES (?,?,?,?,?,?,?,current_date)";
	String id_sql = "select id from member where id =?";
	String maxNum_sql = "select max(num) as num from member";
	%>
	<%
	try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
/* 	String num = request.getParameter("num");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String admin = request.getParameter("admin");
 */
	conn = DriverManager.getConnection(url, uid, pass);
	pstmt = conn.prepareStatement(id_sql);
	pstmt.setString(1, mem.getId());
	rs = pstmt.executeQuery();
	if(rs.next()){
%>
		<script>
		alert("존재하는 아이디 입니다.");
		history.go(-1);
		</script>
<%
	}else{
		stmt = conn.createStatement();
		rs = stmt.executeQuery(maxNum_sql);
		if(rs.next()){
			maxNum = rs.getInt("num");
		}
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, maxNum+1);
		pstmt.setString(2, mem.getId());
		pstmt.setString(3, mem.getPwd());
		pstmt.setString(4, mem.getName());
		pstmt.setString(5, mem.getPhone());
		pstmt.setString(6, mem.getEmail());
		pstmt.setString(7, String.valueOf(mem.getAdmin()));
		int del =pstmt.executeUpdate();
		if(del>0){
			response.sendRedirect("./L01MemberList.jsp");
		}else{
			%>
			<script>
				alert("저장실패");
				history.go(-1);
			</script>
			<%
		}
	}
	}catch(Exception e){e.printStackTrace();
	};
	%>
</body>
</html>