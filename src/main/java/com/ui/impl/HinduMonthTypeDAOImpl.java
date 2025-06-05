package com.ui.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.ui.dao.HinduMonthTypeDAO;
import com.ui.model.HinduMonthType;

public class HinduMonthTypeDAOImpl implements HinduMonthTypeDAO {

	@Autowired
	private DataSource dataSource;

	private static final Logger logger = LoggerFactory.getLogger(HinduMonthTypeDAOImpl.class);

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public HinduMonthType addHinduMonthType(HinduMonthType hinduMonthType) {

		logger.info("Inside Add Hindu Month Type Impl");

		String sql = "INSERT INTO hindu_month_type (hindu_month_type, description, status, created_by, ip_address) "
				+ "VALUES (?, ?, ?, ?, ?)";

		try (Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

			ps.setString(1, hinduMonthType.getHinduMonthType());
			ps.setString(2, hinduMonthType.getDescription());
			ps.setString(3, hinduMonthType.getStatus());
			ps.setInt(4, hinduMonthType.getCreatedBy());
			ps.setString(5, hinduMonthType.getIpAddress());

			ps.executeUpdate();
			logger.info("Hindu month type added successfully");

			// Retrieve the generated primary key
			try (ResultSet rs = ps.getGeneratedKeys()) {
				if (rs.next()) {
					int generatedId = rs.getInt(1); // Assuming 'id' is the first column
					hinduMonthType.setHinduMonthTypeId(generatedId); // Set the generated ID back to the object if
																		// needed
					logger.info("Hindu month type added successfully with ID: " + generatedId);
				}
			}
		} catch (SQLException e) {
			logger.error("Error adding hindu month type", e);
			throw new RuntimeException("Error adding hindu month type", e);
		}
		return hinduMonthType;
	}

	@Override
	public void updateHinduMonthType(HinduMonthType hinduMonthType) {

		logger.info("Inside Edit Hindu Month Type Impl");

		String sql = "UPDATE hindu_month_type SET hindu_month_type = ?, description = ?, status = ?, created_by = ?, created_date = ?, ip_address = ? "
				+ "WHERE hindu_month_type_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, hinduMonthType.getHinduMonthType());
			ps.setString(2, hinduMonthType.getDescription());
			ps.setString(3, hinduMonthType.getStatus());
			ps.setInt(4, hinduMonthType.getCreatedBy());
			ps.setTimestamp(5, java.sql.Timestamp.valueOf(hinduMonthType.getCreatedDate()));
			ps.setString(6, hinduMonthType.getIpAddress());
			ps.setInt(7, hinduMonthType.getHinduMonthTypeId());

			ps.executeUpdate();
			logger.info("Hindu month type updated successfully");
		} catch (SQLException e) {
			logger.error("Error updating hindu month type", e);
			throw new RuntimeException("Error updating hindu month type", e);
		}
	}

	@Override
	public boolean deleteHinduMonthType(int hinduMonthTypeId) {

		logger.info("Inside Delete Hindu Month Type Impl");

		String sql = "Delete from hindu_month_type WHERE hindu_month_type_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, hinduMonthTypeId);
			int rowsAffected = ps.executeUpdate();

			if (rowsAffected > 0) {
				logger.info("Hindu month type with ID: {} marked as deleted successfully", hinduMonthTypeId);
				return true;
			} else {
				logger.warn("No hindu month type found with ID: {}", hinduMonthTypeId);
				return false;
			}
		} catch (SQLException e) {
			logger.error("Error deleting hindu month type with ID: {}", hinduMonthTypeId, e);
			throw new RuntimeException("Error deleting hindu month type", e);
		}
	}

	@Override
	public HinduMonthType getHinduMonthTypeById(int hinduMonthTypeId) {

		logger.info("Inside Get Hindu Month Type By Id Impl");

		String sql = "SELECT * FROM hindu_month_type WHERE hindu_month_type_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, hinduMonthTypeId);

			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					return new HinduMonthType(rs.getInt("hindu_month_type_id"), rs.getString("hindu_month_type"),
							rs.getString("description"), rs.getString("status"), rs.getInt("created_by"),
							rs.getTimestamp("created_date").toString(), rs.getString("ip_address"));
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching hindu month type by ID", e);
			throw new RuntimeException("Error fetching hindu month type by ID", e);
		}

		return null;
	}

	@Override
	public List<HinduMonthType> getAllHinduMonthType() {

		logger.info("Fetching all hindu month type");

		List<HinduMonthType> hinduMonthTypes = new ArrayList<>();

		String sql = "SELECT * FROM hindu_month_type";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					HinduMonthType hinduMonthType = new HinduMonthType(rs.getInt("hindu_month_type_id"),
							rs.getString("hindu_month_type"), rs.getString("description"), rs.getString("status"),
							rs.getInt("created_by"), rs.getTimestamp("created_date").toString(),
							rs.getString("ip_address"));
					hinduMonthTypes.add(hinduMonthType);
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching all hindu month type", e);
			throw new RuntimeException("Error fetching all hindu month type", e);
		}

		return hinduMonthTypes;
	}

	@Override
	public List<HinduMonthType> getAllActiveHinduMonthType() {

		logger.info("Inside Get All Hindu Month Type Impl");

		List<HinduMonthType> hinduMonthTypes = new ArrayList<>();

		String status = "y";

		String sql = "SELECT * FROM hindu_month_type WHERE status = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, status);
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					HinduMonthType hinduMonthType = new HinduMonthType(rs.getInt("hindu_month_type_id"),
							rs.getString("hindu_month_type"), rs.getString("description"), rs.getString("status"),
							rs.getInt("created_by"), rs.getTimestamp("created_date").toString(),
							rs.getString("ip_address"));
					hinduMonthTypes.add(hinduMonthType);
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching hindu month type", e);
			throw new RuntimeException("Error fetching hindu month type", e);
		}

		return hinduMonthTypes;
	}
}
