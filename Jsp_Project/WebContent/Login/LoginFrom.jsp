<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파라미터 전달</title>
</head>
<body>
	<h1>로그인</h1>
	<form action="LoginCheck.jsp" method="post">
		<p>
			<label>아이디 : </label>
			<input type="text" name="id" value="">
		</p>
		<p>
			<label>비빌번호 : </label>
			<input type="password" name="pwd" value="">
		</p>
		<button type="submit">제출</button>
	</form>
</body>
</html>