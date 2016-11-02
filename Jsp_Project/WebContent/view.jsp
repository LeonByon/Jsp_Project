<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" %>
<jsp:useBean id="dao" class="board.DAO" />
<!DOCTYPE html>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	ArrayList<VO_COM> alist = dao.getCommentList(idx);
	VO vo = dao.getView(idx);
	dao.UpdateHit(idx);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
</head>
<body>
<table>
	<tr>
	<td>
	<table width="413" cellpadding="0" cellspacing="0" border="0">
		<tr style="background: url('img/table_mid.gif') repeat-x; text-align:center;">
			<td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
			<td>내 용</td>
			<td width="5"><img src="img/table_right.gif" width="5" height="30" /></td>
		</tr>
	</table>
	<table width="413">
		<tr>
			<td width="0">&nbsp;</td>
			<td align="center" width="76">글번호</td>
			<td width="319"><%=idx %></td>
			<td width="0">&nbsp;</td>
		</tr>
			<tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
		<tr>
			<td width="0">&nbsp;</td>
			<td align="center" width="76">조회수</td>
			<td width="319"><%=vo.getHit() %></td>
			<td width="0">&nbsp;</td>
		</tr>
			<tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
		<tr>
			<td width="0">&nbsp;</td>
			<td align="center" width="76">이름</td>
			<td width="319"><%=vo.getName()%></td>
			<td width="0">&nbsp;</td>
		</tr>
			<tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
		<tr>
			<td width="0">&nbsp;</td>
			<td align="center" width="76">작성일</td>
			<td width="319"><%=vo.getTime() %></td>
			<td width="0">&nbsp;</td>
		</tr>
			<tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
		<tr>
			<td width="0">&nbsp;</td>
			<td align="center" width="76">제목</td>
			<td width="319"><%=vo.getTitle() %></td>
			<td width="0">&nbsp;</td>
		</tr>
			<tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
				<tr>
					<td width="0">&nbsp;</td>
						<td width="399" colspan="2" height="200"><%=vo.getMemo() %>
				</tr>
			<tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
			<tr height="1" bgcolor="#82B5DF"><td colspan="4" width="407"></td></tr>
			<tr align="center">
				<td width="0">&nbsp;</td>
				<td colspan="2" width="399">
					<input type="button" value="답글" OnClick="window.location='reply.jsp?idx=<%=idx%>&pg=<%=pg %>'">
					<input type="button" value="목록" onclick="window.location='list.jsp?pg=<%=pg%>'">
					<input type="button" value="수정" onclick="window.location='modify.jsp?idx=<%=idx%>&pg=<%=pg %>'">
					<input type="button" value="삭제" onclick="window.location='delete.jsp?idx=<%=idx%>&pg=<%=pg %>'">
				<td width="0">&nbsp;</td>
			</tr>
	</table>

	<table width="413" cellpadding="0" cellspacing="0" border="0">
		<tr style="background: url('img/table_mid.gif') repeat-x; text-align:center;">
			<td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
			<td>댓 글</td>
			<td width="5"><img src="img/table_right.gif" width="5" height="30" /></td>
		</tr>
	</table>
<%	for(int i=0;i<alist.size();i++){
		VO_COM vo_com = alist.get(i);
%>
	<table width="413">
		<tr>
			<td width="0">&nbsp;</td>
			<td align="center" width="76">댓글번호</td>
			<td width="319"><%=vo_com.getNum() %></td>
			<td width="0">&nbsp;</td>
		</tr>
			<tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
		<tr>
			<td width="0">&nbsp;</td>
			<td align="center" width="76">작성자</td>
			<td width="319"><%=vo_com.getMem_name() %></td>
			<td width="0">&nbsp;</td>
		</tr>
			<tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
		<tr>
			<td width="0">&nbsp;</td>
			<td align="center" width="76">작성일</td>
			<td width="319"><%=vo_com.getTime()%></td>
			<td width="0">&nbsp;</td>
		</tr>
			<tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
		<tr>
			<td width="0">&nbsp;</td>
			<td align="center" width="76">내용</td>
			<td width="319"><%=vo_com.getMemo() %></td>
			<td width="0">&nbsp;</td>
		</tr>
			<tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
	</table>
	<table width="413" cellpadding="0" cellspacing="0" border="0">
		<tr style="background: url('img/table_mid.gif') repeat-x; text-align:center;">
			<td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
			<td width="5"><img src="img/table_right.gif" width="5" height="30" /></td>
		</tr>
	</table>
	<%} %>
	<form action="./reply_ok.jsp" method = "post">
		<p>
			<textarea name = "mem_name" rows="1" cols="25"></textarea>
			<textarea name = "memo" rows="2" cols="50"></textarea>
		</p>
		<input type = "hidden" name="pg" value = "<%=pg%>">
		<input type = "hidden" name="idx" value = "<%=idx%>">
		<input type="submit" value ="댓글 작성">
	</form>
	</td>
	</tr>
</table>
</body>
</html>