package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DepartmentsDao;
import model.DeptEmpDao;
import model.DeptManagerDao;
import model.EmployeesDao;
import model.SalariesDao;
import model.TitlesDao;


@WebServlet("/index")
public class IndexServlet extends HttpServlet {
	//객체 선언
	private DepartmentsDao departmentsDao;
	private DeptEmpDao deptempDao;
	private DeptManagerDao deptmanagerDao;
	private EmployeesDao employeesDao;
	private SalariesDao salariesDao;
	private TitlesDao titlesDao;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/index URL 요청");
		//인스턴스화 (항목의 총 개수를 세는 count 메소드를 변수에 저장)
		departmentsDao = new DepartmentsDao();
		int departmentsRowCount = departmentsDao.selectDepartmentsCount();
		deptempDao = new DeptEmpDao();
		int deptempRowCount = deptempDao.selectDeptEmpCount();
		deptmanagerDao = new DeptManagerDao();
		int deptmanagerRowCount = deptmanagerDao.selectDeptManagerCount();
		employeesDao = new EmployeesDao();
		int employeesRowCount = employeesDao.selectEmployeesCount();
		int maxEmpNo = employeesDao.selectEmpNo("max");
		int minEmpNo = employeesDao.selectEmpNo("min");
		salariesDao = new SalariesDao();
		int salariesRowCount = salariesDao.selectSalariesCount();
		titlesDao = new TitlesDao();
		int titlesRowCount = titlesDao.selectTitlesCount();
		//속성값 입력
		request.setAttribute("departmentsRowCount", departmentsRowCount);
		request.setAttribute("deptempRowCount", deptempRowCount);
		request.setAttribute("deptmanagerRowCount", deptmanagerRowCount);
		request.setAttribute("employeesRowCount", employeesRowCount);
		request.setAttribute("salariesRowCount", salariesRowCount);
		request.setAttribute("titlesRowCount", titlesRowCount);
		request.setAttribute("maxEmpNo", maxEmpNo);
		request.setAttribute("minEmpNo", minEmpNo);
		//해당페이지 이동
		request.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(request, response);
	}
}
