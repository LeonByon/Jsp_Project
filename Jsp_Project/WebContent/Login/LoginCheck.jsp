<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="dao" class="board.DAO"/>
<jsp:useBean id="member" class="com.jsp.bean.Member"/>
<jsp:setProperty name="member" property="*" />

<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	boolean ch = dao.loginCheck(id, pwd);

	if(ch) {
	%>
		<script>
			self.window.alert("어서오세요.");
			location.href="../list.jsp?name=<%=id%>";
		</script>
	<%
		session.setAttribute("name", id);
} else {
	%>
		<script>
			self.window.alert("아이디 혹은 비밀번호를 틀렸습니다.");
			location.href="javascript:history.back()";
		</script>
	<%
}

%>