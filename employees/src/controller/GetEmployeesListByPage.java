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


@WebServlet("/employees/getEmployeesListByPage")
public class GetEmployeesListByPage extends HttpServlet {
	private EmployeesDao employeesDao;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//페이지당 보여줄 개수 지정
		int rowPerPage = 10;
		//현재페이지 변수 선언 (시작은 1)
		int currentPage = 1;
		//동적변수 받아온 문자열 currentPage 값을 숫자열로 변환하여 변수 currentPage에 저장
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		//변하는 currentPage 체크
		System.out.println(currentPage);
		//EmployeesDao메소드를 가리키는 인스턴스 생성
		employeesDao = new EmployeesDao();
		//employeesDao의 selectEmployeesListByPage메소드를 참조타입 List 반환값 list로 생성
		List<Employees> list = employeesDao.selectEmployeesListByPage(currentPage, rowPerPage);
		//lastPage값 지정하기위해 selectLastPage메소드를 가져옴
		int lastPage = employeesDao.selectLastPage(rowPerPage);
		//view에서 사용할 list, currentPage, lastPage 값 보내기
		request.setAttribute("list", list);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("lastPage", lastPage);
		request.getRequestDispatcher("/WEB-INF/views/employees/employeesListByPage.jsp").forward(request, response);
	}
}
