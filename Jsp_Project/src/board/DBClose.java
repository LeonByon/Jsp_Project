package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBClose {
	public static void close(Connection con, PreparedStatement pstmt, ResultSet rs){
		try{
			try{
				if(rs!=null){rs.close(); rs=null;}
				}catch(Exception e){e.printStackTrace();}
			try{
				if(pstmt!=null){pstmt.close(); pstmt=null;}
			}catch(Exception e){e.printStackTrace();}
			try{
				if(con!=null){con.close(); con=null;}
			}catch(Exception e){e.printStackTrace();}
		}catch(Exception e){e.printStackTrace();}
	}
	public static void close(Connection con, PreparedStatement pstmt){
		try{
			try{
				if(pstmt!=null){pstmt.close(); pstmt=null;}
			}catch(Exception e){e.printStackTrace();}
			try{
				if(con!=null){con.close(); con=null;}
			}catch(Exception e){e.printStackTrace();}
		}catch(Exception e){e.printStackTrace();}
	}
	public static void close(Connection con, Statement stmt) {
		try {
			try {
				if(stmt!=null) { stmt.close(); stmt=null; }
			}catch(Exception e) {e.printStackTrace();}
		
			try {
				if(con!=null) { con.close(); con=null; }
			}catch(Exception e) {e.printStackTrace();}
		}catch(Exception e) {e.printStackTrace();}
	}
	
	public static void close(Connection con) {
		try {
			try {
				if(con!=null) { con.close(); con=null; }
			}catch(Exception e) {e.printStackTrace();}
		}catch(Exception e) {e.printStackTrace();}
	}
	
	public static void close(PreparedStatement pstmt) {
		try {
			try {
				if(pstmt!=null) { pstmt.close(); pstmt=null; }
			}catch(Exception e) {e.printStackTrace();}
		
		}catch(Exception e) {e.printStackTrace();}
	}
	
	public static void close(Statement stmt) {
		try {
			try {
				if(stmt!=null) { stmt.close(); stmt=null; }
			}catch(Exception e) {e.printStackTrace();}
		
		}catch(Exception e) {e.printStackTrace();}
	}
	
	public static void close(ResultSet rs) {
		try {
			try {
				if(rs!=null) { rs.close(); rs=null; }
			}catch(Exception e) {e.printStackTrace();}

		}catch(Exception e) {e.printStackTrace();}
	}
	
	public static void close(PreparedStatement pstmt, ResultSet rs) {
		try {
			try {
				if(rs!=null) { rs.close(); rs=null; }
			}catch(Exception e) {e.printStackTrace();}
			
			try {
				if(pstmt!=null) { pstmt.close(); pstmt=null; }
			}catch(Exception e) {e.printStackTrace();}

		}catch(Exception e) {e.printStackTrace();}
	} 
}
