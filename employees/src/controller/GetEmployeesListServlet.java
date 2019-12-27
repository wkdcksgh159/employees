package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import VO.Employees;
import model.EmployeesDao;

//url 지정
@WebServlet("/employees/getEmployeesList")
public class GetEmployeesListServlet extends HttpServlet {
	//model 객체 선언
	private EmployeesDao employeesDao;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//limit 지정
		int limit = 10;
		if(request.getParameter("limit") != null) {
			limit = Integer.parseInt(request.getParameter("limit"));
		}
		//limit 체크
		System.out.println("limit : "+limit);
		//인스턴스화
		employeesDao = new EmployeesDao();
		//레퍼런스변수에 저장된 메소드 실행 후 변수에 저장
		List<Employees> list = employeesDao.selectEmployeesListServlet(limit);
		//선택한 요소의 속성값 생성 (속성이름, 속성값)
		request.setAttribute("list", list);
		//전송한 데이터를 그대로 유지하면서 해당페이지로 이동
		request.getRequestDispatcher("/WEB-INF/views/employees/employeesList.jsp").forward(request, response);
	}
}
