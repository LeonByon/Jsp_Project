<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script> // 자바 스크립트 시작
function writeCheck()
  {
   var form = document.MemberAdd;

   if( !form.id.value )
   {
    alert( "아이디를 적어주세요" );
    form.id.focus();
    return;
   }

   if( !form.pwd.value )
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
<title>회원가입 Form</title>
</head>
<body>
	<h1>회원 가입</h1>
	<%!//선언부 -> 필드
	Connection conn = null; //접속
	Statement stmt =null; //쿼리 실행
	ResultSet rs = null; //실행결과
	ResultSet rs2 = null;
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String uid = "jsp_lesson";
	String pass = "1234";
	String sql = "SELECT * FROM MEMBER";
	String sql2 = "select max(num) AS maxNum from MEMBER";
	%>
	<%
	try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, uid, pass);
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);
	while(rs.next()){
		int num = rs.getInt("num");
		String id = rs.getString("id");
		String pwd = rs.getString("pwd");
		String name = rs.getString("name");
		String email = rs.getString("email");
		String phone = rs.getString("phone");
		String indate = rs.getString("indate");
		String admin = rs.getString("admin");
	}
	}catch(ClassNotFoundException e){e.printStackTrace();
	}catch(SQLException e){e.printStackTrace();
	};
	%>
	<form name="MemberAdd" action="L04MemberInsert.jsp" method="post">
		<p>
			<label for="uNum">Num : <%=request.getParameter("maxNum")%></label>
			<input type="hidden" value="<%=request.getParameter("maxNum")%>" name="num" >
			<!-- max(num)+1 을 hidden 값으로 주기 -->
		</p>
		<p>
			<label for="uID">ID :</label>
			<input type="text" id="uID" name="id" value="">
		</p>
		<p>
			<label for="uPass">Password :</label>
			<input type="password" id="uPass" name="pwd" size="20" value="">
		</p>
		<p>
			<label for="uName">이름 :</label>
			<input type="text" id="uName" name="name" size="20" value="">
		</p>
		<p>
			<label for="uEmail">E-mail :</label>
			<input type="email" id="uEmail" name="email" size="20" value="">
		</p>
		<p>
			<label for="uPhone">PhoneNumber :</label>
			<input type="text" id="uPhone" name="phone" size="20" value="">
		</p>
		<p>
			<label for="uAdmin">관리자 :</label>
			<input type="radio" id="admin" name="admin" value="0" checked="checked">
			<label for="nomal">일반</label>
			<input type="radio" id="nomal" name="admin" value="1">
		</p>
		<input type="button" value="제출" OnClick="javascript:writeCheck();">
	</form>
</body>
</html>