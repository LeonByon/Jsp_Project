<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" %>
<jsp:useBean id="dao" class="board.DAO"/>
<jsp:useBean id="vo_com1" class="board.VO_COM"/>
<jsp:setProperty name="vo_com1" property="*" />
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");

	int idx = Integer.parseInt(request.getParameter("idx"));
	String memo = request.getParameter("memo");
	String mem_name = request.getParameter("mem_name");
	int pg = Integer.parseInt(request.getParameter("pg"));

	dao.insertReply(idx,memo,mem_name);
%>
<script>
   self.window.alert("입력한 글을 저장하였습니다.");
   location.href="view.jsp?idx=<%=idx%>&pg=<%=pg%>";
</script>