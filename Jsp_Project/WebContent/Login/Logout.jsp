<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
	String id = (String)session.getAttribute("name");

	if(id!=null) {
	%>
		<script>
			self.window.alert("로그아웃 되었습니다.");
			location.href="./LoginFrom.jsp";
		</script>
	<%
		session.removeAttribute("name");

} else {
	%>
	<script>
		self.window.alert("로그아웃 실패 - 잘못된 접근입니다.");
		location.href="./LoginFrom.jsp";
	</script>
<%
}
%>
</html>