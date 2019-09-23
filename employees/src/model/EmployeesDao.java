package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import VO.Employees;

public class EmployeesDao {
	//출력하기위한 메소드 생성
	public List<Employees> selectEmployeesListServlet(int limit) {
		//인스턴스 생성
		List<Employees> list = new ArrayList<Employees>();
		//연결, 쿼리정보변수 선언
		Connection conn = null;
		PreparedStatement stmt = null;
		//쿼리를 실행한 값을 반환하는 객체 ResultSet 선언
		ResultSet rs = null;
		//쿼리 내용 입력및 변수에 저장
		String sql = "SELECT emp_no, birth_date, first_name, last_name, gender, hire_date FROM employees LIMIT ?";
			try {
				//연결, 쿼리정보 입력 (try)
				Class.forName("org.mariadb.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/employees", "root", "java1234");
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, limit);
				//쿼리 실행 후 반환된 값을 변수 rs에 저장
				rs = stmt.executeQuery();
				//rs의 쿼리값들을 VO에서 가져온값들로 만들어낸 객체에 저장
				while(rs.next()) {
					Employees employees = new Employees();
					employees.setEmpNo(rs.getInt("emp_no"));
					employees.setBirthDate(rs.getString("birth_date"));
					employees.setFirstName(rs.getString("first_name"));
					employees.setLastName(rs.getString("last_name"));
					employees.setGender(rs.getString("gender"));
					employees.setHireDate(rs.getString("hire_date"));
					//값들을 저장한 레퍼런스를 list에 추가
					list.add(employees);
				}
			} catch(Exception e) {
				//예외 결과 출력 (catch)
				e.printStackTrace();
			} finally {
				try {
					//db를 실행한 순서대로 닫기 (finally try)
					rs.close();
					stmt.close();
					conn.close();
				} catch(Exception e) {
					//예외결과 출력 (catch)
					e.printStackTrace();
				}
			}
		//list값 반환
		return list;
	}
	public int selectEmployeesCount() {
		int count = 0;
		final String sql = "SELECT COUNT(*) cnt FROM employees";
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
	
	public List<Employees> selectEmployeesListOrderBy(String order) {
		List<Employees> list = new ArrayList<Employees>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = null;
		//동적쿼리 매개변수 order에 어떤 단어가 오는지에 따라 쿼리의 내용이 달라짐
		if(order.equals("asc")) {
			//first_name 과 last_name 의 글자를 오름차순으로 출력
			sql = "SELECT emp_no, birth_date, first_name, last_name, gender, hire_date FROM employees ORDER BY first_name ASC, last_name ASC LIMIT 50";
		} else if(order.equals("desc")) {
			//first_name 과 last_name 의 글자를 내림차순으로 출력
			sql = "SELECT emp_no, birth_date, first_name, last_name, gender, hire_date FROM employees ORDER BY first_name DESC, last_name DESC LIMIT 50";
		}
		//실행
		try {
			//db불러오기, 연결주소, 쿼리정보 입력 후 변수에 저장
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/employees", "root", "java1234");
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			//VO의 값을 인스턴스화 시켜서 쿼리의 값을 각각 저장
			while(rs.next()) {
				Employees employees = new Employees();
				employees.setEmpNo(rs.getInt("emp_no"));
				employees.setBirthDate(rs.getString("birth_date"));
				employees.setFirstName(rs.getString("first_name"));
				employees.setLastName(rs.getString("last_name"));
				employees.setGender(rs.getString("gender"));
				employees.setHireDate(rs.getString("hire_date"));
				list.add(employees);
			}
		} catch(Exception e) {
			//예외처리 예외 발생시 예외내용 출력
			e.printStackTrace();
		} finally {
			try {
				//사용한 db닫기
				rs.close();
				stmt.close();
				conn.close();
			} catch(Exception e) {
				//예외처리 예외 발생시 예외내용 출력
				e.printStackTrace();
			}
		}
		//VO에 저장한 값을 저장한 list 값 반환
		return list;
	}
}
