<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*,com.jsp.bean.*,java.util.*" %>
<jsp:useBean id="dao" class="board.DAO"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OJDBC로 멤버 리스트 출력</title>
</head>
<body>
	<h3>멤버 리스트</h3>
	<hr>
	<table border="3">
		<tr>
			<td>번호</td>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이름</td>
			<td>이메일</td>
			<td>폰번</td>
			<td>등록시간</td>
			<td>권한</td>
		</tr>
	<%
	ArrayList<Member> alist = dao.getMember();
	int maxNum = dao.max_Mem() + 1;
	for(int i=0;i<alist.size();i++){
		Member member = alist.get(i);
	%>
		<tr>
			<td><%=member.getNum() %></td>
			<td><%=member.getId() %></td>
			<td><%=member.getPwd() %></td>
			<td><%=member.getName() %></td>
			<td><%=member.getEmail() %></td>
			<td><%=member.getPhone() %></td>
			<td><%=member.getIndate() %></td>
			<td><%=member.getAdmin() %></td>
			<td><a href="./L02MemberDelete.jsp?num=<%=member.getNum() %>">삭제</a></td>
			<td><a href="./L05MemberUpdateForm.jsp?num=<%=member.getNum() %>">수정</a></td>
			<!-- L03MemberAddForm.jsp 이용 input tag에 value를 지정 -->
		</tr>
		<%} %>
	</table>
	<p><b><a href="./L03MemberAddForm.jsp?maxNum=<%=maxNum%>">회원가입</a></b></p>

</body>
</html>