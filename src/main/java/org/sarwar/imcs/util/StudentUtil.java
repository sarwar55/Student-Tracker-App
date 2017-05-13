package org.sarwar.imcs.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.sarwar.imcs.dao.Student;

public class StudentUtil {

	private DataSource dataSource;
	private static final String SQL = "select * from student order by last_name";
	private static final String ADD_SQL = "insert into student " + "(first_name, last_name, email) "
			+ "values (?, ?, ?)";
	private static final String GET_SQL = "select * from student where id=?";
	private static final String UPDATE_SQL = "update student " + "set first_name=?, last_name=?, email=? "
			+ "where id=?";
	private static final String DELETE_SQL = "delete from student where id=?";
	private static final String SEARCH_SQL = "select * from student where lower(first_name) like ? or lower(last_name) like ?";

	public StudentUtil(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public List<Student> getStudents() {
		List<Student> students = new ArrayList<Student>();
		try (Connection connection = dataSource.getConnection();
				Statement statement = connection.createStatement();
				ResultSet resultSet = statement.executeQuery(SQL)) {
			while (resultSet.next()) {
				int id = resultSet.getInt("id");
				String firstName = resultSet.getString("first_name");
				String lastName = resultSet.getString("last_name");
				String email = resultSet.getString("email");
				students.add(new Student(id, firstName, lastName, email));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return students;
	}

	public void addStudent(Student student) {
		try (Connection connection = dataSource.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(ADD_SQL);) {
			preparedStatement.setString(1, student.getFirstName());
			preparedStatement.setString(2, student.getLastName());
			preparedStatement.setString(3, student.getEmail());
			preparedStatement.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public Student getStudent(String studentId) throws Exception {
		Student student = null;
		ResultSet resultSet = null;
		try (Connection connection = dataSource.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(GET_SQL);) {
			preparedStatement.setInt(1, Integer.parseInt(studentId));

			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				String firstName = resultSet.getString("first_name");
				String lastName = resultSet.getString("last_name");
				String email = resultSet.getString("email");

				// use the studentId during construction
				student = new Student(Integer.parseInt(studentId), firstName, lastName, email);
			} else {
				throw new Exception("Could not find student id: " + studentId);
			}
			return student;
		} finally {
			if (resultSet != null)
				resultSet.close();
		}
	}

	public void updateStudent(Student student) {
		try (Connection connection = dataSource.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_SQL);) {
			preparedStatement.setString(1, student.getFirstName());
			preparedStatement.setString(2, student.getLastName());
			preparedStatement.setString(3, student.getEmail());
			preparedStatement.setInt(4, student.getId());
			preparedStatement.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public void deleteStudent(String studentId) throws SQLException {
		try (Connection connection = dataSource.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(DELETE_SQL);) {
			preparedStatement.setInt(1, Integer.parseInt(studentId));
			preparedStatement.execute();
		}

	}

	public List<Student> searchStudents(String searchName) throws SQLException {
		List<Student> students = new ArrayList<>();

		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try (Connection connection = dataSource.getConnection()) {
			if (searchName != null && searchName.trim().length() > 0) {
				preparedStatement = connection.prepareStatement(SEARCH_SQL);
				String searchNameLike = "%" + searchName.toLowerCase() + "%";
				preparedStatement.setString(1, searchNameLike);
				preparedStatement.setString(2, searchNameLike);

			} else {
				String sql = "select * from student order by last_name";
				preparedStatement = connection.prepareStatement(sql);
			}
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				int id = resultSet.getInt("id");
				String firstName = resultSet.getString("first_name");
				String lastName = resultSet.getString("last_name");
				String email = resultSet.getString("email");
				Student tempStudent = new Student(id, firstName, lastName, email);
				students.add(tempStudent);
			}
			return students;
		} finally{
			if(resultSet != null) resultSet.close();
			if(preparedStatement != null) preparedStatement.close();
		}
	}
}
