package kpu.club.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kpu.club.domain.StudentVO;
import kpu.club.persistence.StudentDAO;

/**
 * Servlet implementation class MemberServlet
 */
@WebServlet("/StudentServlet")
public class StudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StudentServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		
		String cmd = "";
		cmd = request.getParameter("key");
		
		if(cmd.equals("join")) {
			response.sendRedirect("register.html");
		}
		else if(cmd.equals("list")) {
			StudentDAO dao=new StudentDAO();
			ArrayList<StudentVO>studentList=dao.getStudentList();
			request.setAttribute("studentList", studentList);
			RequestDispatcher view=request.getRequestDispatcher("student_list.jsp");
			view.forward(request, response);
		}
		else if(cmd.equals("update")) {
			StudentDAO dao=new StudentDAO();
			StudentVO student=dao.read(request.getParameter("id"));
			request.setAttribute("student",student);
			RequestDispatcher view=request.getRequestDispatcher("update.jsp");
			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		String cmd = "";
		cmd = request.getParameter("key");

		if (cmd.contentEquals("join")) {
			StudentVO studentVO = new StudentVO();

			studentVO.setId(request.getParameter("id"));
			studentVO.setPasswd(request.getParameter("passwd"));
			studentVO.setUsername(request.getParameter("username"));
			studentVO.setSnum(request.getParameter("snum"));
			studentVO.setDepart(request.getParameter("depart"));
			studentVO.setMobile(request.getParameter("mobile"));
			studentVO.setEmail(request.getParameter("email"));

			StudentDAO studentDao = new StudentDAO();
			
			String message="";
			
			if(studentDao.add(studentVO))message="가입 축하합니다";
			else message="가입 실패입니다";

			request.setAttribute("message", message);
			request.setAttribute("student", studentVO);

			RequestDispatcher view = request.getRequestDispatcher("result.jsp");
			view.forward(request, response);
		}
		else if (cmd.contentEquals("update")) {
			StudentVO studentVO = new StudentVO();

			studentVO.setId(request.getParameter("id"));
			studentVO.setPasswd(request.getParameter("passwd"));
			studentVO.setUsername(request.getParameter("username"));
			studentVO.setSnum(request.getParameter("snum"));
			studentVO.setDepart(request.getParameter("depart"));
			studentVO.setMobile(request.getParameter("mobile"));
			studentVO.setEmail(request.getParameter("email"));

			StudentDAO studentDao = new StudentDAO();
			
			String message="";
			
			if(studentDao.update(studentVO))message="수정이 완료되었습니다.";
			else message="수정 실패입니다";

			request.setAttribute("message", message);
			request.setAttribute("student", studentVO);

			RequestDispatcher view = request.getRequestDispatcher("result.jsp");
			view.forward(request, response);
		}
	}
}
