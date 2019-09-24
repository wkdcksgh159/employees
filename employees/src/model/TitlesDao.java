package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import db.DBHelper;

public class TitlesDao {
	//테이블 titles의 컬럼 title을 중복값을 제외하고 출력하는 메소드생성
	public List<String> selectTitlesListDistinct() {
		List<String> list = new ArrayList<String>();
		String sql = "SELECT DISTINCT title FROM titles";
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBHelper.getConnection();
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				list.add(rs.getString("title"));
			}
		} catch(Exception e) { //자바의 변수 생명주기는 {}
			e.printStackTrace();
		} finally {
			DBHelper.close(rs, stmt, conn);
		}
		return list;
	}
	
	public int selectTitlesCount() {
		int count = 0;
		final String sql = "SELECT COUNT(*) cnt FROM titles";
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBHelper.getConnection();
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt("cnt");
			}
		} catch(Exception e) { //자바의 변수 생명주기는 {}
			e.printStackTrace();
		} finally {
			DBHelper.close(rs, stmt, conn);
		}
		
		return count;
	}
}
