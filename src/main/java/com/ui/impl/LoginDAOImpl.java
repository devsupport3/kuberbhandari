package com.ui.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.ui.dao.LoginDAO;
import com.ui.model.User;

public class LoginDAOImpl implements LoginDAO {

	@Autowired
	private DataSource dataSource;

	private static final Logger logger = LoggerFactory.getLogger(LoginDAOImpl.class);

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	// Validate user login based on email
	@Override
	public boolean isExistUserEmail(String email) {
		String query = "SELECT COUNT(*) FROM user WHERE email_id = ?";

		boolean emailExists = false;

		try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {

			stmt.setString(1, email);

			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					emailExists = rs.getInt(1) > 0;
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return emailExists;
	}

	/*
	 * @Override public boolean createUser(User user) { String insertQuery =
	 * "INSERT INTO user (first_name, last_name, mobile_no, email_id, password) VALUES (?, ?, ?, ?, ?)"
	 * ;
	 * 
	 * try (Connection conn = dataSource.getConnection(); PreparedStatement ps =
	 * conn.prepareStatement(insertQuery)) {
	 * 
	 * // Set the parameters for the query ps.setString(1, user.getFirstName());
	 * ps.setString(2, user.getLastName()); ps.setString(3, user.getMobileNo());
	 * ps.setString(4, user.getEmailId()); ps.setString(5, user.getPassword());
	 * 
	 * int rowsAffected = ps.executeUpdate(); return rowsAffected > 0; // Return
	 * true if user was successfully inserted, false otherwise } catch (SQLException
	 * e) { e.printStackTrace(); return false; // Return false if an error occurs }
	 * }
	 */
	/*
	 * @Override public String createUser(String firstName, String lastName, String
	 * mobile, String email, String password) { String insertQuery =
	 * "INSERT INTO user (first_name, last_name, mobile_no, email_id, password) VALUES (?, ?, ?, ?, ?)"
	 * ;
	 * 
	 * // Check if email is already registered boolean emailExists =
	 * isExistUserEmail(email); if (emailExists) { return
	 * "Email is already registered."; }
	 * 
	 * try (Connection conn = dataSource.getConnection()) { // Proceed with user
	 * creation try (PreparedStatement insertStmt =
	 * conn.prepareStatement(insertQuery)) { insertStmt.setString(1, firstName);
	 * insertStmt.setString(2, lastName); insertStmt.setString(3, mobile);
	 * insertStmt.setString(4, email); insertStmt.setString(5, password);
	 * 
	 * int rowsAffected = insertStmt.executeUpdate(); if (rowsAffected > 0) { return
	 * "Account created successfully."; } else { return
	 * "Failed to create account. Please try again."; } } catch (SQLException e) {
	 * e.printStackTrace(); return "An error occurred while creating the account: "
	 * + e.getMessage(); } } catch (SQLException e) { e.printStackTrace(); return
	 * "An error occurred while creating the account: " + e.getMessage(); } }
	 */

	@Override
	public boolean isValidUser(String email, String password) {
		String query = "SELECT password FROM user WHERE email_id = ?";

		String storedPassword = null;

		try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {

			stmt.setString(1, email);

			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					storedPassword = rs.getString("password");
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		if (storedPassword != null && storedPassword.equals(password)) {
			return true; // Password matches
		}

		return false; // Invalid password
	}

	// Method to change the user's password
	@Override
	public String changePassword(String email, String currentPassword, String newPassword, String confirmPassword) {
		if (!newPassword.equals(confirmPassword)) {
			return "New password and confirm password do not match.";
		}

		String selectQuery = "SELECT password FROM user WHERE email_id = ?";
		String updateQuery = "UPDATE user SET password = ? WHERE email_id = ?";
		String storedPassword = null;

		try (Connection conn = dataSource.getConnection();
				PreparedStatement selectStmt = conn.prepareStatement(selectQuery)) {

			// Fetch the current password from the database
			selectStmt.setString(1, email);
			try (ResultSet rs = selectStmt.executeQuery()) {
				if (rs.next()) {
					storedPassword = rs.getString("password");
				} else {
					return "Email not found.";
				}
			}

			if (storedPassword != null && storedPassword.equals(currentPassword)) {
				try (PreparedStatement updateStmt = conn.prepareStatement(updateQuery)) {
					updateStmt.setString(1, newPassword);
					updateStmt.setString(2, email);

					int rowsAffected = updateStmt.executeUpdate();
					if (rowsAffected > 0) {
						return "Password updated successfully.";
					} else {
						return "Failed to update the password.";
					}
				}
			} else {
				return "Current password is incorrect.";
			}

		} catch (SQLException e) {
			e.printStackTrace();
			return "An error occurred while processing the password change: " + e.getMessage();
		}
	}

	// Method to reset the password based on email
	@Override
	public boolean resetPassword(String email, String newPassword) {

		boolean emailExists = isExistUserEmail(email);

		// If email exists, proceed to reset the password
		if (emailExists) {
			String updatePasswordQuery = "UPDATE user SET password = ? WHERE email_id = ?";

			try (Connection conn = dataSource.getConnection();
					PreparedStatement stmt = conn.prepareStatement(updatePasswordQuery)) {

				stmt.setString(1, newPassword);
				stmt.setString(2, email);

				int rowsAffected = stmt.executeUpdate();

				// If password was updated successfully
				return rowsAffected > 0;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return false; // If the email doesn't exist
	}

	// Validate user login based on email
	@Override
	public User getUserDetail(String email) {
		String query = "SELECT user_id, role_id, trustee_type_id, first_name, middle_name, last_name, gender_id, description, mobile_no, email_id, image, status, created_by, created_date, ip_address FROM user WHERE email_id = ?";

		User user = null;

		try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {

			stmt.setString(1, email);

			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					user = new User();
					user.setUserId(rs.getInt("user_id"));
					user.setRoleId(rs.getInt("role_id"));
					user.setTrusteeTypeId(rs.getInt("trustee_type_id"));
					user.setFirstName(rs.getString("first_name"));
					user.setMiddleName(rs.getString("middle_name"));
					user.setLastName(rs.getString("last_name"));
					user.setGenderId(rs.getInt("gender_id"));
					user.setDescription(rs.getString("description"));
					user.setMobileNo(rs.getString("mobile_no"));
					user.setEmailId(rs.getString("email_id"));
					user.setImage(rs.getString("image"));
					user.setStatus(rs.getString("status"));
					user.setCreatedBy(rs.getInt("created_by"));
					user.setCreatedDate(rs.getString("created_date"));
					user.setIpAddress(rs.getString("ip_address"));
					// emailExists = rs.getInt(1) > 0;
				}
			}

		} catch (SQLException e) {
			user = null;
			e.printStackTrace();
		}

		return user;
	}

	@Override
	public int getUserRoleIdByEmail(String email) {
		String query = "SELECT role_id FROM user WHERE email_id = ?";
		int roleId = -1; // Default value in case the user is not found or there is an issue

		try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {

			stmt.setString(1, email); // Set the email parameter

			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					roleId = rs.getInt("role_id"); // Get the role_id from the result set
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return roleId; // Return the role_id or -1 if the user was not found
	}

	/***************************************************
	 * Admin
	 *********************************************/

	public boolean isValidAdminUser(String email, String password) {
		String query = "SELECT COUNT(*) FROM user WHERE email_id = ? AND password = ?";

		boolean isValid = false;

		try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {

			stmt.setString(1, email);
			stmt.setString(2, password);

			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					isValid = rs.getInt(1) > 0;
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return isValid;
	}
}
