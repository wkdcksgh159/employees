package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import VO.Departments;
import model.DepartmentsDao;

//url 지정
@WebServlet("/departments/getDepartmentsList")
public class GetDepartmentsListServlet extends HttpServlet {
	//model 객체 선언
	private DepartmentsDao departmentsdao;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//인스턴스화
		departmentsdao = new DepartmentsDao();
		//레퍼런스변수에 저장된 selectDepartmentsList 메소드 실행 (List<Departments> 타입 / 반환값 list)
		List<Departments> list = departmentsdao.selectDepartmentsList();
		//선택한 요소의 속성값 생성 (속성이름, 속성값)
		request.setAttribute("list", list);
		//전송한 데이터를 그대로 유지하면서 해당페이지로 이동
		request.getRequestDispatcher("/WEB-INF/views/departments/departmentsList.jsp").forward(request, response);;
	}

}
