package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import db.DBHelper;

public class SalariesDao {
	//salary(연봉)의 통계를 보여주는 메소드 생성
	public Map<String, Long> selectSalariesStatistics(){
		Map<String, Long> map = new HashMap<String, Long>();
		//salary(연봉)의 count(개수), sum(합), avg(평균), max(최대값), min(최소값), std(표준편차) 값 지정
		String sql = "SELECT count(salary), sum(salary), avg(salary), max(salary), min(salary), std(salary) FROM salaries";
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		//실행
		try {
			//연결정보, 쿼리정보 입력
			conn = DBHelper.getConnection();
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			//map에 각 키값과 밸류값 입력
			if(rs.next()) {
				map.put("count", rs.getLong("count(salary)"));
				map.put("sum", rs.getLong("sum(salary)"));
				map.put("avg", rs.getLong("avg(salary)"));
				map.put("max", rs.getLong("max(salary)"));
				map.put("min", rs.getLong("min(salary)"));
				map.put("std", rs.getLong("std(salary)"));
			}
		//예외처리
		} catch(Exception e) {
			e.printStackTrace();
		//db 닫기와 예외처리 메소드 불러오기
		} finally {
			DBHelper.close(rs, stmt, conn);
		}
		//리턴값 map
		return map;
	}
	public int selectSalariesCount() {
		int count = 0;
		final String sql = "SELECT COUNT(*) cnt FROM salaries";
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/employees", "root", "java1234");
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt("cnt");
			}
		} catch(Exception e) { //자바의 변수 생명주기는 {}
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				stmt.close();
				conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return count;
	}
}
