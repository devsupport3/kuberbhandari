package com.ui.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.ui.dao.UserAddressDAO;
import com.ui.model.UserAddress;

public class UserAddressDAOImpl implements UserAddressDAO {

	@Autowired
	private DataSource dataSource;

	private static final Logger logger = LoggerFactory.getLogger(UserAddressDAOImpl.class);

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	// Add a new user address
	@Override
	public void addUserAddress(UserAddress userAddress) {
		logger.info("Inside Add User Address Impl");

		String sql = "INSERT INTO user_address (user_id, full_name, address1, address2, city_name, state_name, country_id, pincode, status, created_by, ip_address, email_id, mobile_no) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, userAddress.getUserId());
			ps.setString(2, userAddress.getFullName());
			ps.setString(3, userAddress.getAddress1());
			ps.setString(4, userAddress.getAddress2());
			ps.setString(5, userAddress.getCityName());
			ps.setString(6, userAddress.getStateName());
			ps.setInt(7, userAddress.getCountryId());
			ps.setString(8, userAddress.getPincode());
			ps.setString(9, userAddress.getStatus());
			ps.setInt(10, userAddress.getCreatedBy());
			ps.setString(11, userAddress.getIpAddress());
			ps.setString(12, userAddress.getEmailId());
			ps.setString(13, userAddress.getMobileNo());

			ps.executeUpdate();
			logger.info("User address added successfully");
		} catch (SQLException e) {
			logger.error("Error adding user address", e);
			throw new RuntimeException(e);
		}
	}

	// Get user address by ID
	@Override
	public UserAddress getUserAddressById(int userAddressId) {
		logger.info("Inside Get User Address By ID Impl");

		String sql = "SELECT ua.*, c.country_name FROM user_address ua join country c on c.country_id = ua.country_id  WHERE ua.user_address_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, userAddressId);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				return new UserAddress(rs.getInt("user_address_id"), rs.getInt("user_id"), rs.getString("full_name"),
						rs.getString("address1"), rs.getString("address2"), rs.getString("city_name"),
						rs.getString("state_name"), rs.getInt("country_id"), rs.getInt("created_by"),
						rs.getString("created_date"), rs.getString("pincode"), rs.getString("status"),
						rs.getString("ip_address"), rs.getString("mobile_no"), rs.getString("email_id"),
						rs.getString("country_name"));
			}
		} catch (SQLException e) {
			logger.error("Error fetching user address by ID", e);
			throw new RuntimeException(e);
		}

		return null; // Return null if no address is found
	}

	// Update an existing user address
	@Override
	public void updateUserAddress(UserAddress userAddress) {
		logger.info("Inside Update User Address Impl");

		String sql = "UPDATE user_address SET user_id = ?, full_name = ?, address1 = ?, address2 = ?, city_name = ?, state_name = ?, country_id = ?, pincode = ?, status = ?, created_by = ?, created_date = ?, ip_address = ? WHERE user_address_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, userAddress.getUserId());
			ps.setString(2, userAddress.getFullName());
			ps.setString(3, userAddress.getAddress1());
			ps.setString(4, userAddress.getAddress2());
			ps.setString(5, userAddress.getCityName());
			ps.setString(6, userAddress.getStateName());
			ps.setInt(7, userAddress.getCountryId());
			ps.setString(8, userAddress.getPincode());
			ps.setString(9, userAddress.getStatus());
			ps.setInt(10, userAddress.getCreatedBy());
			ps.setString(11, userAddress.getCreatedDate());
			ps.setString(12, userAddress.getIpAddress());
			ps.setInt(13, userAddress.getUserAddressId());

			ps.executeUpdate();
			logger.info("User address updated successfully");
		} catch (SQLException e) {
			logger.error("Error updating user address", e);
			throw new RuntimeException(e);
		}
	}

	// Delete a user address (soft delete by setting status to 'n')
	@Override
	public void deleteUserAddress(int userAddressId) {
		logger.info("Inside Delete User Address Impl");

		String sql = "UPDATE user_address SET status = 'n' WHERE user_address_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, userAddressId);
			ps.executeUpdate();
			logger.info("User address deleted successfully");
		} catch (SQLException e) {
			logger.error("Error deleting user address", e);
			throw new RuntimeException(e);
		}
	}

	// Get all user addresses (active addresses)
	@Override
	public List<UserAddress> getAllUserAddressesByUserId(int userID) {
		logger.info("Inside Get All User Addresses Impl");

		List<UserAddress> userAddressesList = new ArrayList<>();
		String sql = "SELECT ua.*, c.country_name FROM user_address ua join country c on c.country_id = ua.country_id WHERE ua.status = 'y' AND ua.user_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, userID);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				UserAddress userAddress = new UserAddress(rs.getInt("user_address_id"), rs.getInt("user_id"),
						rs.getString("full_name"), rs.getString("address1"), rs.getString("address2"),
						rs.getString("city_name"), rs.getString("state_name"), rs.getInt("country_id"),
						rs.getInt("created_by"), rs.getString("created_date"), rs.getString("pincode"),
						rs.getString("status"), rs.getString("ip_address"), rs.getString("mobile_no"),
						rs.getString("email_id"), rs.getString("country_name"));
				userAddressesList.add(userAddress);
			}
		} catch (SQLException e) {
			logger.error("Error fetching user addresses", e);
			throw new RuntimeException(e);
		}

		return userAddressesList;
	}
}
