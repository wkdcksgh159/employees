package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import VO.Departments;

public class DepartmentsDao {
	//반환타입 List<> 로 ArrayList<Departments> 출력하는 메소드 생성
	public List<Departments> selectDepartmentsList() {
		//인스턴스 생성
		List<Departments> list = new ArrayList<Departments>();
		//연결, 쿼리정보변수 선언
		Connection conn = null;
		PreparedStatement stmt = null;
		//쿼리를 실행한 값을 반환하는 객체 ResultSet 선언
		ResultSet rs = null;
		//쿼리 내용 입력및 변수에 저장
		String sql = "SELECT dept_no, dept_name FROM departments";
		try {
			//연결, 쿼리정보 입력
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/employees", "root", "java1234");
			stmt = conn.prepareStatement(sql);
			//쿼리 실행 후 반환된 값을 변수 rs에 저장
			rs = stmt.executeQuery();
			//쿼리값들을 VO의 Departments에서 가져온값들로 만들어낸 객체에 저장
			while(rs.next()) {
				Departments departments = new Departments();
				departments.setDeptNo("dept_no");
				departments.setDeptName("dept_name");
				//값들을 저장한 레퍼런스를 list에 추가
				list.add(departments);
			}
		} catch(Exception e) {
			//예외 결과 출력
			e.printStackTrace();
		} finally {
			try {
				//db를 실행한 순서대로 닫기
				rs.close();
				stmt.close();
				conn.close();
			} catch(Exception e) {
				//예외결과 출력
				e.printStackTrace();
			}
		}
		//list값 반환
		return list;
	}
	
	public int selectDepartmentsCount() {
		int count = 0;
		final String sql = "SELECT COUNT(*) cnt FROM departments";
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
