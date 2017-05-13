package org.sarwar.imcs.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import org.sarwar.imcs.dao.Student;
import org.sarwar.imcs.util.StudentUtil;

@WebServlet("/students")
public class StudentControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private StudentUtil studentUtil;
	@Resource(name = "jdbc/web_student_tracker")
	private DataSource dataSource;

	public StudentControllerServlet() {
	}

	@Override
	public void init() throws ServletException {
		super.init();
		studentUtil = new StudentUtil(dataSource);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String command = request.getParameter("command");
		if (command == null) {
			command = "LIST";
		}
		switch (command) {
		case "LIST":
			listStudents(request, response);
			break;
		case "LOAD":
			try {
				loadStudent(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "DELETE":
			try {
				deleteStudent(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case "SEARCH":
			try {
				searchStudents(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		default:
			listStudents(request, response);
		}
	}

	private void searchStudents(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		String searchName = request.getParameter("search");
		List<Student> students = studentUtil.searchStudents(searchName);
		request.setAttribute("studentList", students);
		request.getRequestDispatcher("/list-students.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String theCommand = request.getParameter("command");
			switch (theCommand) {
			case "ADD":
				addStudent(request, response);
				break;
			case "UPDATE":
				updateStudent(request, response);
				break;
			default:
				listStudents(request, response);
			}

		} catch (Exception exc) {
			throw new ServletException(exc);
		}

	}

	private void deleteStudent(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		String studentId = request.getParameter("studentId");
		studentUtil.deleteStudent(studentId);
		listStudents(request, response);

	}

	private void updateStudent(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("studentId"));
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		Student student = new Student(id, firstName, lastName, email);
		studentUtil.updateStudent(student);
		try {
			listStudents(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void loadStudent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String studentId = request.getParameter("studentId");
		Student student = studentUtil.getStudent(studentId);
		request.setAttribute("STUDENT", student);
		request.getRequestDispatcher("/update-student-form.jsp").forward(request, response);
	}

	private void addStudent(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		Student student = new Student(firstName, lastName, email);
		studentUtil.addStudent(student);
		listStudents(request, response);
	}

	private void listStudents(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Student> students = studentUtil.getStudents();
		request.setAttribute("studentList", students);
		request.setAttribute("viewBackButton", "false");
		System.out.println("tttttt");
		request.getRequestDispatcher("/list-students.jsp").forward(request, response);
	}

}
