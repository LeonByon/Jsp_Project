<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="dao" class="board.DAO" />
    <jsp:useBean id="vo" class="board.VO" />
    <jsp:setProperty name="vo" property="*" />
<!DOCTYPE html>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	boolean ch = dao.checkPassword(vo, idx);
	if(ch){
		dao.delete(idx);
%>
	<script>
		self.window.alert("해당 글을 삭제하였습니다.");
		location.href="list.jsp?pg=<%=pg%>";
	</script>
<%
		 }else{
%>
	<script>
		self.window.alert("비밀번호를 틀렸습니다.");
		location.href="javascript:history.back()";
	</script>
<%
		 }
%>