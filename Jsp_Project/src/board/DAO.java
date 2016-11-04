package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import com.jsp.bean.*;

public class DAO {
	DBConnect dbconnect = null;
	String sql="";
	public DAO(){
		dbconnect = new DBConnect();
	}

	public int count(){
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int cnt = 0;

		try{
			sql = "SELECT COUNT(*) FROM BOARD";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if(rs.next()){
				cnt=rs.getInt(1);
			}
		}catch(Exception e){e.printStackTrace();
		}finally{
			DBClose.close(con,pstmt,rs);
		}
		return cnt;
	}

	public String pasing(String data){
		try{
			data = new String(data.getBytes("8859_1"), "UTF-8");
		}catch (Exception e){e.printStackTrace();}
		return data;
	}

	public ArrayList<VO> getMemberList() {
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<VO> alist = new ArrayList<VO>();

		try{
			sql = "select num, username, title, time, hit from BOARD";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while(rs.next()){
				VO vo = new VO();
				boolean dayNew = false;
				vo.setNum(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setTitle(rs.getString(3));

				Date date = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String year =(String)sdf.format(date);
				String yea = rs.getString(4).substring(0,10);

				if(year.equals(yea)){
					dayNew = true;
				}
				vo.setTime(yea);
				vo.setHit(rs.getInt(5));
				vo.setIndent(rs.getInt(6));
				vo.setDayNew(dayNew);
				alist.add(vo);
			}
		}catch(Exception e){e.printStackTrace();
		}finally{
			DBClose.close(con,pstmt,rs);
		}
		return alist;
	}

	public ArrayList<VO_COM> getCommentList(int idx) {
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<VO_COM> alist = new ArrayList<VO_COM>();

		try{
			sql = "select num,board_num,mem_name,memo,indate from COMMENTS where board_num="+idx+"ORDER BY COMMENTS.NUM";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while(rs.next()){
				VO_COM vo_com = new VO_COM();
				boolean dayNew = false;
				vo_com.setNum(rs.getInt(1));
				vo_com.setBoard_num(rs.getInt(2));
				vo_com.setMem_name(rs.getString(3));
				vo_com.setMemo(pasing(rs.getString(4)));

				Date date = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String year =(String)sdf.format(date);
				String yea = rs.getString(5).substring(0,10);

				if(year.equals(yea)){
					dayNew = true;
				}
				vo_com.setTime(yea);
				alist.add(vo_com);
			}
		}catch(Exception e){e.printStackTrace();
		}finally{
			DBClose.close(con,pstmt,rs);
		}
		return alist;
	}

	public ArrayList<Member> getMember() {
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<Member> alist = new ArrayList<Member>();

		try{
			sql = "select num,id,pwd,name,email,phone,indate,admin from MEMBER";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while(rs.next()){
				Member member = new Member();
				boolean dayNew = false;
				String ad = "";
				member.setNum(rs.getInt(1));
				member.setName(rs.getString(2));
				member.setPwd(rs.getString(3));
				member.setName(rs.getString(4));
				member.setEmail(rs.getString(5));
				member.setPhone(rs.getString(6));
				String indate = rs.getString(7);
				String admin = rs.getString(8);
				if(admin.equals("0")){
					ad = "관리자";
				}else{
					ad = "일반";
				}
				member.setAdmin(ad);


				Date date = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String year =(String)sdf.format(date);
				String yea = indate.substring(0,10);

				if(year.equals(yea)){
					dayNew = true;
				}
				member.setIndate(yea);
				alist.add(member);
			}
		}catch(Exception e){e.printStackTrace();
		}finally{
			DBClose.close(con,pstmt,rs);
		}
		return alist;
	}

	public int getMax(){
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int max = 0;

		try{
			sql = "select max(num) from BOARD";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if(rs.next()){
				max = rs.getInt(1);
			}
		}catch(Exception e){e.printStackTrace();
		}finally{
			DBClose.close(con,pstmt,rs);
		}
		return max;
	}

	public void insertWrite(VO vo, int max){
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;

		try{
			sql="insert into BOARD(username,password,title,memo) values(?,?,?,?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, pasing(vo.getName()));
			pstmt.setString(2, pasing(vo.getPassword()));
			pstmt.setString(3, pasing(vo.getTitle()));
			pstmt.setString(4, pasing(vo.getMemo()));
			pstmt.execute();
		}catch(Exception e){e.printStackTrace();
		}finally{
			DBClose.close(con,pstmt);
		}
	}

	public VO getView(int idx){
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs  = null;
		VO vo = null;

		try{
			sql="select username,title,memo,time,hit,password from BOARD WHERE NUM=?";
			pstmt= con.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();

			if(rs.next()){
				vo = new VO();
				vo.setName(rs.getString(1));
				vo.setTitle(rs.getString(2));
				vo.setMemo(rs.getString(3));
				vo.setTime(rs.getString(4));
				vo.setHit(rs.getInt(5)+1);
				vo.setPassword(rs.getString(6));
			}
		}catch(Exception e){e.printStackTrace();
		}finally{
			DBClose.close(con,pstmt,rs);
		}
		return vo;
	}

	public VO_COM getView_COM(int idx){
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs  = null;
		VO_COM vo_com = null;

		try{
			sql="select num,board_num,mem_name,memo,indate from COMMENTS WHERE board_num=?";
			pstmt= con.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();

			if(rs.next()){
				vo_com = new VO_COM();
				vo_com.setNum(rs.getInt(1));
				vo_com.setBoard_num(rs.getInt(2));
				vo_com.setMem_name(rs.getString(3));
				vo_com.setMemo(rs.getString(4));
				vo_com.setTime(rs.getString(5));
			}
		}catch(Exception e){e.printStackTrace();
		}finally{
			DBClose.close(con,pstmt,rs);
		}
		return vo_com;
	}

	public void UpdateHit(int idx) {
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;

		try {
			sql = "UPDATE BOARD SET HIT=HIT+1 where NUM=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();

		}catch(Exception e) {

		}finally {
			DBClose.close(con,pstmt);
		}
	}

	public boolean checkPassword(VO vo, int idx) {
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean ch = false;

		try {
			sql = "SELECT NUM FROM BOARD where NUM=? and PASSWORD=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.setString(2, vo.getPassword());
			rs = pstmt.executeQuery();

			if(rs.next()) {
				ch = true;
			} else {
				ch = false;
			}

		}catch(Exception e) {

		}finally {
			DBClose.close(con,pstmt,rs);
		}
		return ch;
	}

	public void delete(int idx) {
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;

		try {
			sql = "DELETE FROM BOARD WHERE NUM=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();

			sql = "delete from COMMENTS where board_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		}catch(Exception e) {

		}finally {
			DBClose.close(con,pstmt);
		}
	}

	public void modify(VO vo, int idx) {
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;

		try {
			sql = "UPDATE BOARD SET TITLE=?, MEMO=? where NUM=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pasing(vo.getTitle()));
			pstmt.setString(2, pasing(vo.getMemo()));
			pstmt.setInt(3, idx);
			pstmt.executeUpdate();

		}catch(Exception e) {

		}finally {
			DBClose.close(con,pstmt);
		}
	}

	public void insertReply(int idx, String memo, String mem_name) {
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;

		try {
			sql = "INSERT INTO COMMENTS(board_num, mem_name, memo, indate) "+
					"VALUES(?,?,?,sysdate)";
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, idx);
			pstmt.setString(2, mem_name);
			pstmt.setString(3, memo);

			pstmt.execute();
		}catch(Exception e) {

		}finally {
			DBClose.close(con,pstmt);
		}
	}

	public int max_Mem(){
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int max = 0;

		try{
			sql = "select max(num) from MEMBER";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if(rs.next()){
				max = rs.getInt(1);
			}
		}catch(Exception e){e.printStackTrace();
		}finally{
			DBClose.close(con,pstmt,rs);
		}
		return max;
	}

	public boolean loginCheck(String id, String pwd){
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean ch = false;
		try{
			sql = "SELECT ID FROM MEMBER where ID=? and PWD=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				ch = true;
			} else {
				ch = false;
			}
		}catch(Exception e){e.printStackTrace();
		}finally{
			DBClose.close(con,pstmt,rs);
		}
		return ch;
	}
}
