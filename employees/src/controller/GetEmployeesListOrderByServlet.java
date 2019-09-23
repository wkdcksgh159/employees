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


@WebServlet("/employees/getEmployeesListOrderBy")
public class GetEmployeesListOrderByServlet extends HttpServlet {
	//Dao 객체 선언
	private EmployeesDao employeesDao;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//받아온 매개변수 order값 변수에 저장
		String order = request.getParameter("order");
		//객체 인스턴스화 selectEmployeesListOrderBy 메소드 불러오기
		employeesDao = new EmployeesDao();
		List<Employees> list = employeesDao.selectEmployeesListOrderBy(order);
		//속성값 입력
		request.setAttribute("list", list);
		//값을 저장한채 해당페이지 이동
		request.getRequestDispatcher("/WEB-INF/views/employees/employeesListOrderBy.jsp").forward(request, response);
	}
}
