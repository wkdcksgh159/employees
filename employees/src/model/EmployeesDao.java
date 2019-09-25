package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import VO.Employees;
import db.DBHelper;

public class EmployeesDao {
	//마지막페이지 구하는 메소드 생성
	public int selectLastPage(int rowPerPage) {
		EmployeesDao employeesDao = new EmployeesDao();
		//selectEmployeesCount 메소드에서 항목의 총 개수를 가져옴
		int rowCount = employeesDao.selectEmployeesCount();
		int lastPage = 0;
		//총 개수/페이지당보여줄개수의 나머지가 0이면 나눈값을 그대로 사용
		if(rowCount%rowPerPage == 0) {
			lastPage = rowCount/rowPerPage;
		//총 개수/페이지당보여줄개수의 나머지가 0이 아니면 페이지는 마지막페이지인데
		//보여줄항목이 남아있을수 있으므로 한페이지를 추가해서 짤리는걸 방지
		} else {
			lastPage = rowCount/rowPerPage + 1;
		}
		return lastPage;
	}
	//사원목록 페이지(10명씩) 출력하는 메소드 생성
	public List<Employees> selectEmployeesListByPage(int currentPage, int rowPerPage){
		List<Employees> list = new ArrayList<Employees>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		//employees의 모든 컬럼을 LIMIT에 입력된 값 사이만큼 출력
		String sql = "SELECT * FROM employees LIMIT ?, ?";
		
		try {
			conn = DBHelper.getConnection();
			stmt = conn.prepareStatement(sql);
			//페이지의시작을 구하는 공식 (현재페이지-1) * 한페이지당보여줄개수
			int startPage = (currentPage-1) * rowPerPage;
			stmt.setInt(1, startPage);
			System.out.println("startPage : "+startPage);
			stmt.setInt(2, rowPerPage);
			rs = stmt.executeQuery();
			//불러온 컬럼값들을 VO에 저장하고 list에 입력
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
			e.printStackTrace();
		} finally {
			DBHelper.close(rs, stmt, conn);
		}
		return list;
	}
	
	//사원번호를 기준으로 해당범위의 사람을 찾는 메소드 생성
	public int selectEmpNo(String str) {
		int empNo = 0;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = null;
		//동적쿼리 str에 어떤값이 입력되냐에 따라 쿼리내용이 달라짐
		if(str.equals("max")) {
			//str에 입력된 값이 max 일시 emp_no의 최대값 불러옴
			sql = "SELECT MAX(emp_no) FROM employees";
		} else if(str.equals("min")) {
			//str에 입력된 값이 min 일시 emp_no의 최소값 불러옴
			sql = "SELECT MIN(emp_no) FROM employees";
		}
		//실행
		try {
			//db불러오기, 연결주소, 쿼리정보 입력 후 변수에 저장
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/employees", "root", "java1234");
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			if(rs.next()) {
				empNo = rs.getInt(1);
			}
		} catch(Exception e) {
			//예외처리 예외 발생시 예외내용 출력
			e.printStackTrace();
		} finally {
			DBHelper.close(rs, stmt, conn);
		}
		return empNo;
	}

	public List<Employees> selectEmployeesListBetween(int begin, int end){
		List<Employees> list = new ArrayList<Employees>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		//쿼리 emp_no를 기준으로 begin과 end사이의 값을 모두출력
		String sql = "SELECT emp_no, birth_date, first_name, last_name, gender, hire_date FROM employees WHERE emp_no BETWEEN ? AND ?";
		try {
			conn = DBHelper.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, begin);
			stmt.setInt(2, end);
			rs = stmt.executeQuery();
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
			e.printStackTrace();
		} finally {
			DBHelper.close(rs, stmt, conn);
		}
		return list;
	}
	
	//사원의 성별 분포를 출력하기위한 메소드 생성
	public List<Map<String, Object>> selectEmployeesCountGroupByGender() {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		//쿼리 gender와 gender의 총 개수를 불러옴
		String sql = "SELECT gender, count(gender) cnt FROM employees GROUP BY gender";
		try {
			conn = DBHelper.getConnection();
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			//list에 저장된 값들을 출력하기위해 반복문 사용
			while(rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("gender", rs.getString("gender"));
				map.put("cnt", rs.getInt("cnt"));
				list.add(map);
			}
		//예외처리
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBHelper.close(rs, stmt, conn);
		}
		return list;
	}
	//목록을 출력하기위한 메소드 생성
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
