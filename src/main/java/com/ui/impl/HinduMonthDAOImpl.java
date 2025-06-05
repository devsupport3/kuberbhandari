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

import com.ui.dao.HinduMonthDAO;
import com.ui.model.HinduMonth;

public class HinduMonthDAOImpl implements HinduMonthDAO {

	@Autowired
	private DataSource dataSource;

	private static final Logger logger = LoggerFactory.getLogger(HinduMonthDAOImpl.class);

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public HinduMonth addHinduMonth(HinduMonth hinduMonth) {

		logger.info("Inside Add Hindu Month Impl");

		String sql = "INSERT INTO hindu_month (hindu_month_name, hindu_month_name_alias, description, status, created_by, ip_address) "
				+ "VALUES (?, ?, ?, ?, ?, ?)";

		try (Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

			ps.setString(1, hinduMonth.getHinduMonthName());
			ps.setString(2, hinduMonth.getHinduMonthNameAlias());
			ps.setString(3, hinduMonth.getDescription());
			ps.setString(4, hinduMonth.getStatus());
			ps.setInt(5, hinduMonth.getCreatedBy());
			ps.setString(6, hinduMonth.getIpAddress());

			ps.executeUpdate();
			logger.info("Hindu month added successfully");

			// Retrieve the generated primary key
			try (ResultSet rs = ps.getGeneratedKeys()) {
				if (rs.next()) {
					int generatedId = rs.getInt(1); // Assuming 'id' is the first column
					hinduMonth.setHinduMonthId(generatedId); // Set the generated ID back to the object if needed
					logger.info("Hindu month added successfully with ID: " + generatedId);
				}
			}
		} catch (SQLException e) {
			logger.error("Error adding hindu month", e);
			throw new RuntimeException("Error adding hindu month", e);
		}
		return hinduMonth;
	}

	@Override
	public void updateHinduMonth(HinduMonth hinduMonth) {

		logger.info("Inside Edit Hindu Month Impl");

		String sql = "UPDATE hindu_month SET hindu_month_name = ?, hindu_month_name_alias = ?, description = ?, status = ?, created_by = ?, created_date = ?, ip_address = ? "
				+ "WHERE hindu_month_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, hinduMonth.getHinduMonthName());
			ps.setString(2, hinduMonth.getHinduMonthNameAlias());
			ps.setString(3, hinduMonth.getDescription());
			ps.setString(4, hinduMonth.getStatus());
			ps.setInt(5, hinduMonth.getCreatedBy());
			ps.setTimestamp(6, java.sql.Timestamp.valueOf(hinduMonth.getCreatedDate()));
			ps.setString(7, hinduMonth.getIpAddress());
			ps.setInt(8, hinduMonth.getHinduMonthId());

			ps.executeUpdate();
			logger.info("Hindu month updated successfully");
		} catch (SQLException e) {
			logger.error("Error updating hindu month", e);
			throw new RuntimeException("Error updating hindu month", e);
		}
	}

	@Override
	public boolean deleteHinduMonth(int hinduMonthId) {

		logger.info("Inside Delete Hindu Month Impl");

		String sql = "Delete from hindu_month WHERE hindu_month_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, hinduMonthId);
			int rowsAffected = ps.executeUpdate();

			if (rowsAffected > 0) {
				logger.info("Hindu month with ID: {} marked as deleted successfully", hinduMonthId);
				return true;
			} else {
				logger.warn("No hindu month found with ID: {}", hinduMonthId);
				return false;
			}
		} catch (SQLException e) {
			logger.error("Error deleting hindu month with ID: {}", hinduMonthId, e);
			throw new RuntimeException("Error deleting hindu month", e);
		}
	}

	@Override
	public HinduMonth getHinduMonthById(int hinduMonthId) {

		logger.info("Inside Get Hindu Month By Id Impl");

		String sql = "SELECT * FROM hindu_month WHERE hindu_month_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, hinduMonthId);

			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					return new HinduMonth(rs.getInt("hindu_month_id"), rs.getString("hindu_month_name"),
							rs.getString("hindu_month_name_alias"), rs.getString("description"), rs.getString("status"),
							rs.getInt("created_by"), rs.getTimestamp("created_date").toString(),
							rs.getString("ip_address"));
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching hindu month by ID", e);
			throw new RuntimeException("Error fetching hindu month by ID", e);
		}

		return null;
	}

	@Override
	public List<HinduMonth> getAllHinduMonth() {

		logger.info("Fetching all hindu month");

		List<HinduMonth> hinduMonths = new ArrayList<>();

		String sql = "SELECT * FROM hindu_month";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					HinduMonth hinduMonth = new HinduMonth(rs.getInt("hindu_month_id"),
							rs.getString("hindu_month_name"), rs.getString("hindu_month_name_alias"),
							rs.getString("description"), rs.getString("status"), rs.getInt("created_by"),
							rs.getTimestamp("created_date").toString(), rs.getString("ip_address"));
					hinduMonths.add(hinduMonth);
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching all hindu month", e);
			throw new RuntimeException("Error fetching all hindu month", e);
		}

		return hinduMonths;
	}

	@Override
	public List<HinduMonth> getAllActiveHinduMonth() {

		logger.info("Inside Get All Hindu Month Impl");

		List<HinduMonth> hinduMonths = new ArrayList<>();

		String status = "y";

		String sql = "SELECT * FROM hindu_month WHERE status = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, status);
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					HinduMonth hinduMonth = new HinduMonth(rs.getInt("hindu_month_id"),
							rs.getString("hindu_month_name"), rs.getString("hindu_month_name_alias"),
							rs.getString("description"), rs.getString("status"), rs.getInt("created_by"),
							rs.getTimestamp("created_date").toString(), rs.getString("ip_address"));
					hinduMonths.add(hinduMonth);
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching hindu month", e);
			throw new RuntimeException("Error fetching hindu month", e);
		}

		return hinduMonths;
	}
}
