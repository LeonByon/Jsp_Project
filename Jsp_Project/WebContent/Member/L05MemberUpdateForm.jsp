<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script> // 자바 스크립트 시작
function writeCheck()
  {
   var form = document.MemberUpdate;

   if( form.pwd.value==null )
   {
    alert( "비밀번호를 적어주세요" );
    form.pwd.focus();
    return;
   }

  if( !form.name.value )
   {
    alert( "이름을 적어주세요" );
    form.name.focus();
    return;
   }

  if( !form.email.value )
   {
    alert( "이메일을 적어주세요" );
    form.email.focus();
    return;
   }

  if( !form.phone.value )
  {
   alert( "전화번호를 적어주세요" );
   form.phone.focus();
   return;
  }

  form.submit();
  }
 </script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보 수정</title>
</head>
<body>
		<%!//선언부 -> 필드
	Connection conn = null; //접속
	PreparedStatement stmt =null; //쿼리 실행
	ResultSet rs = null; //실행결과
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String uid = "jsp_lesson";
	String pass = "1234";
	String sql = "SELECT * FROM MEMBER where num = ?";
	%>
	<h3>멤버 수정</h3>
	<hr>
	<%
	try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String num = request.getParameter("num");
	conn = DriverManager.getConnection(url, uid, pass);
	stmt = conn.prepareStatement(sql);
	stmt.setInt(1, Integer.parseInt(num));
	rs = stmt.executeQuery();
	while(rs.next()){
		int getnum = rs.getInt("num");
		String id = rs.getString("id");
		String pwd = rs.getString("pwd");
		String name = rs.getString("name");
		String email = rs.getString("email");
		String phone = rs.getString("phone");
		String admin = rs.getString("admin");

	%>
	<form name = "MemberUpdate" action="L06MemberUpdate.jsp" method="post">
		<p>
			<label for="uNum">Num : <%=num%></label>
			<input type="hidden" name="num" value ="<%=num%>">
		</p>
		<p>
			<label for="uID">ID : <%=id%></label>
			<input type="hidden" id="uID" name="id" value="<%=id%>">
		</p>
		<p>
			<label for="uPass">Password :</label>
			<input type="password" id="uPass" name="pwd" size="20" value="<%=pwd%>">
		</p>
		<p>
			<label for="uName">이름 :</label>
			<input type="text" id="uName" name="name" size="20" value="<%=name%>">
		</p>
		<p>
			<label for="uEmail">E-mail :</label>
			<input type="email" id="uEmail" name="email" size="20" value="<%=email%>">
		</p>
		<p>
			<label for="uPhone">PhoneNumber :</label>
			<input type="text" id="uPhone" name="phone" size="20" value="<%=phone%>">
		</p>
		<p>
			<label for="uAdmin">관리자 :</label>
			<input type="radio" id="admin" name="admin" value="0" checked="checked">
			<label for="nomal">일반</label>
			<input type="radio" id="nomal" name="admin" value="1">
		</p>
	<%
	}
	}catch(ClassNotFoundException e){e.printStackTrace();
	}catch(SQLException e){e.printStackTrace();
	};
	%>
		<input type="button" value="제출" OnClick="javascript:writeCheck();">
	</form>
</body>
</html>