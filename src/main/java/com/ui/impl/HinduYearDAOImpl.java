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

import com.ui.dao.HinduYearDAO;
import com.ui.model.HinduYear;

public class HinduYearDAOImpl implements HinduYearDAO {

	@Autowired
	private DataSource dataSource;

	private static final Logger logger = LoggerFactory.getLogger(HinduYearDAOImpl.class);

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public HinduYear addHinduYear(HinduYear hinduYear) {

		logger.info("Inside Add Hindu Year Impl");

		String sql = "INSERT INTO hindu_year (hindu_year, description, status, created_by, ip_address) "
				+ "VALUES (?, ?, ?, ?, ?)";

		try (Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

			ps.setString(1, hinduYear.getHinduYear());
			ps.setString(2, hinduYear.getDescription());
			ps.setString(3, hinduYear.getStatus());
			ps.setInt(4, hinduYear.getCreatedBy());
			ps.setString(5, hinduYear.getIpAddress());

			ps.executeUpdate();
			logger.info("Hindu year added successfully");

			// Retrieve the generated primary key
			try (ResultSet rs = ps.getGeneratedKeys()) {
				if (rs.next()) {
					int generatedId = rs.getInt(1); // Assuming 'id' is the first column
					hinduYear.setHinduYearId(generatedId); // Set the generated ID back to the object if needed
					logger.info("Hindu year added successfully with ID: " + generatedId);
				}
			}
		} catch (SQLException e) {
			logger.error("Error adding hindu year", e);
			throw new RuntimeException("Error adding hindu year", e);
		}
		return hinduYear;
	}

	@Override
	public void updateHinduYear(HinduYear hinduYear) {

		logger.info("Inside Edit Hindu Year Impl");

		String sql = "UPDATE hindu_year SET hindu_year = ?, description = ?, status = ?, created_by = ?, created_date = ?, ip_address = ? "
				+ "WHERE hindu_year_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, hinduYear.getHinduYear());
			ps.setString(2, hinduYear.getDescription());
			ps.setString(3, hinduYear.getStatus());
			ps.setInt(4, hinduYear.getCreatedBy());
			ps.setTimestamp(5, java.sql.Timestamp.valueOf(hinduYear.getCreatedDate()));
			ps.setString(6, hinduYear.getIpAddress());
			ps.setInt(7, hinduYear.getHinduYearId());

			ps.executeUpdate();
			logger.info("Hindu year updated successfully");
		} catch (SQLException e) {
			logger.error("Error updating hindu year", e);
			throw new RuntimeException("Error updating hindu year", e);
		}
	}

	@Override
	public boolean deleteHinduYear(int hinduYearId) {

		logger.info("Inside Delete Hindu Year Impl");

		String sql = "Delete from hindu_year WHERE hindu_year_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, hinduYearId);
			int rowsAffected = ps.executeUpdate();

			if (rowsAffected > 0) {
				logger.info("Hindu year with ID: {} marked as deleted successfully", hinduYearId);
				return true;
			} else {
				logger.warn("No hindu year found with ID: {}", hinduYearId);
				return false;
			}
		} catch (SQLException e) {
			logger.error("Error deleting hindu year with ID: {}", hinduYearId, e);
			throw new RuntimeException("Error deleting hindu year", e);
		}
	}

	@Override
	public HinduYear getHinduYearById(int hinduYearId) {

		logger.info("Inside Get Hindu Year By Id Impl");

		String sql = "SELECT * FROM hindu_year WHERE hindu_year_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, hinduYearId);

			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					return new HinduYear(rs.getInt("hindu_year_id"), rs.getString("hindu_year"),
							rs.getString("description"), rs.getString("status"), rs.getInt("created_by"),
							rs.getTimestamp("created_date").toString(), rs.getString("ip_address"));
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching hindu year by ID", e);
			throw new RuntimeException("Error fetching hindu year by ID", e);
		}

		return null;
	}

	@Override
	public List<HinduYear> getAllHinduYear() {

		logger.info("Fetching all hindu year");

		List<HinduYear> hinduYears = new ArrayList<>();

		String sql = "SELECT * FROM hindu_year";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					HinduYear hinduYear = new HinduYear(rs.getInt("hindu_year_id"), rs.getString("hindu_year"),
							rs.getString("description"), rs.getString("status"), rs.getInt("created_by"),
							rs.getTimestamp("created_date").toString(), rs.getString("ip_address"));
					hinduYears.add(hinduYear);
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching all hindu year", e);
			throw new RuntimeException("Error fetching all hindu year", e);
		}

		return hinduYears;
	}

	@Override
	public List<HinduYear> getAllActiveHinduYear() {

		logger.info("Inside Get All Hindu Year Impl");

		List<HinduYear> hinduYears = new ArrayList<>();

		String status = "y";

		String sql = "SELECT * FROM hindu_year WHERE status = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, status);
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					HinduYear hinduYear = new HinduYear(rs.getInt("hindu_year_id"), rs.getString("hindu_year"),
							rs.getString("description"), rs.getString("status"), rs.getInt("created_by"),
							rs.getTimestamp("created_date").toString(), rs.getString("ip_address"));
					hinduYears.add(hinduYear);
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching hindu year", e);
			throw new RuntimeException("Error fetching hindu year", e);
		}

		return hinduYears;
	}
}
