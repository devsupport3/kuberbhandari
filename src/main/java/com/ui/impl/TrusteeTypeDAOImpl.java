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

import com.ui.dao.TrusteeTypeDAO;
import com.ui.model.TrusteeType;

public class TrusteeTypeDAOImpl implements TrusteeTypeDAO {

	@Autowired
	private DataSource dataSource;

	private static final Logger logger = LoggerFactory.getLogger(TrusteeTypeDAOImpl.class);

	// Set the data source
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	// Get all trustee types with status 'y'
	@Override
	public List<TrusteeType> getAllTrusteeTypes() {
		logger.info("Inside Get All Trustee Types Impl");

		List<TrusteeType> trusteeTypes = new ArrayList<>();

		String status = "y"; // Active trustee types
		String sql = "SELECT trustee_type_id, trustee_type_name, status, created_by, created_date, ip_address FROM trustee_type WHERE status = ?";

		Connection conn = null;
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, status);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				TrusteeType trusteeType = new TrusteeType(rs.getInt("trustee_type_id"),
						rs.getString("trustee_type_name"), rs.getString("status"), rs.getInt("created_by"),
						rs.getString("created_date"), rs.getString("ip_address"));
				trusteeTypes.add(trusteeType);
			}

			rs.close();
			ps.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			closeConnection(conn);
		}

		return trusteeTypes;
	}

	// Add a new trustee type
	@Override
	public void addTrusteeType(TrusteeType trusteeType) {
		logger.info("Inside Add Trustee Type Impl");

		String sql = "INSERT INTO trustee_type (trustee_type_name, status, created_by, created_date, ip_address) VALUES (?, ?, ?, ?, ?)";

		Connection conn = null;
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, trusteeType.getTrusteeTypeName());
			ps.setString(2, trusteeType.getStatus());
			ps.setInt(3, trusteeType.getCreatedBy());
			ps.setString(4, trusteeType.getCreatedDate());
			ps.setString(5, trusteeType.getIpAddress());

			ps.executeUpdate();
			logger.info("Trustee type added successfully");
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			closeConnection(conn);
		}
	}

	// Update an existing trustee type
	@Override
	public void editTrusteeType(TrusteeType trusteeType) {
		logger.info("Inside Edit Trustee Type Impl");

		String sql = "UPDATE trustee_type SET trustee_type_name = ?, status = ?, created_by = ?, created_date = ?, ip_address = ? WHERE trustee_type_id = ?";

		Connection conn = null;
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, trusteeType.getTrusteeTypeName());
			ps.setString(2, trusteeType.getStatus());
			ps.setInt(3, trusteeType.getCreatedBy());
			ps.setString(4, trusteeType.getCreatedDate());
			ps.setString(5, trusteeType.getIpAddress());
			ps.setInt(6, trusteeType.getTrusteeTypeId());

			ps.executeUpdate();
			logger.info("Trustee type updated successfully");
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			closeConnection(conn);
		}
	}

	// Delete a trustee type (soft delete by setting status to 'n')
	@Override
	public void deleteTrusteeType(int trusteeTypeId) {
		logger.info("Inside Delete Trustee Type Impl");

		String sql = "UPDATE trustee_type SET status = 'n' WHERE trustee_type_id = ?";

		Connection conn = null;
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, trusteeTypeId);
			ps.executeUpdate();
			logger.info("Trustee type deleted successfully");
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			closeConnection(conn);
		}
	}

	// Utility method to close the connection
	private void closeConnection(Connection conn) {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				logger.error("Error closing connection", e);
			}
		}
	}
}
