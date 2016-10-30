<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
</head>
<body>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id ="jspproject";
	String pass = "1234";
	int total = 0;
	
	try{
		Connection conn = DriverManager.getConnection(url,id,pass); //DB연결
		Statement stmt = conn.createStatement();//Statement타입의 객체 생성
		String sql = "select count(*) FROM BOARD"; //DB내의 자료 개수를 찾는 SQL문
		ResultSet rs = stmt.executeQuery(sql); //DB실행
		if(rs.next()){ //rs.next() 의 찾는 결과가 있으면 true
			total = rs.getInt(1); //select문의 첫번재 필드 여기선 count(*);
		}
		rs.close();
		out.print("총 게시물 : " + total +"개"); //게시물 수 출력
		String sqlList = "select num, username,title,time,hit from board order by num desc";
		rs = stmt.executeQuery(sqlList); //DB실행
%>
	<table width="100%" cellpadding="0" cellspacing="0" border="0">
		<tr height="5"><td width="5"></td></tr>
	<tr style="background:url('img/table_mid.gif') repeat-x; text-align: center;">
		<td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
		<td width="73">번호</td>
		<td width="379">제목</td>
		<td width="73">작성자</td>
		<td width="164">작성일</td>
		<td width="58">조회수</td>
		<td width="7"><img src="img/table_right.gif" width="5" height="30" /></td>
	</tr>
<% 
		if(total==0){ //total 자료가 없다면
%>
				<tr align="center" bgcolor="#FFFFFF" height="30">
			<td colspan="6">등록된 글이 없습니다.</td>
			</tr>
<%
		}else{ //자료가 1개 이상이면
			while(rs.next()){ //반복문으로 자료를 찾는다.
				int idx = rs.getInt(1); //첫번째 num값을 idx라는 변수에 대입
				String name = rs.getString(2);
				String title = rs.getString(3);
				String time = rs.getString(4);
				int hit = rs.getInt(5);
%>
	<tr height="25" align="center">
		<td>&nbsp;</td>
		<td align="left"><%=idx %></td>
		<td align="left"><a href="view.jsp?idx=<%=idx%>" ><%=title %></td>
		<td align="center"><%=name %></td>
		<td align="center"><%=time %></td>
		<td align="center"><%=hit %></td>
		<td>&nbsp;</td>
	</tr>
		<tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>
<%
			}
		}
		rs.close();
		stmt.close();
		conn.close();
	}catch(SQLException e){e.printStackTrace();}
%>
		
		<tr height="1" bgcolor="#82B5DF"><td colspan="6" width="752"></td></tr>
	</table>
	
	<table width="100%" cellpadding="0" cellspacing="0" border="0">
		<tr><td colspan="4" height="5"></td></tr>
		<tr align="center">
			<td><input type=button value="글쓰기"  OnClick="window.location='write.jsp'"></td>
		</tr>
	</table>
</body>
</html>