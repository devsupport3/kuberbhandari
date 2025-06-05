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

import com.ui.dao.FestivalDAO;
import com.ui.model.Festival;

public class FestivalDAOImpl implements FestivalDAO {

	@Autowired
	private DataSource dataSource;

	private static final Logger logger = LoggerFactory.getLogger(FestivalDAOImpl.class);

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public Festival addFestival(Festival festival) {

		logger.info("Inside Add Festival Impl");

		String sql = "INSERT INTO festival (festival_name, description, status, created_by, ip_address) "
				+ "VALUES (?, ?, ?, ?, ?)";

		try (Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

			ps.setString(1, festival.getFestivalName());
			ps.setString(2, festival.getDescription());
			ps.setString(3, festival.getStatus());
			ps.setInt(4, festival.getCreatedBy());
			ps.setString(5, festival.getIpAddress());

			ps.executeUpdate();
			logger.info("Festival added successfully");
			// Retrieve the generated primary key
			try (ResultSet rs = ps.getGeneratedKeys()) {
				if (rs.next()) {
					int generatedId = rs.getInt(1); // Assuming 'id' is the first column
					festival.setFestivalId(generatedId); // Set the generated ID back to the object if needed
					logger.info("Festival added successfully with ID: " + generatedId);
				}
			}
		} catch (SQLException e) {
			logger.error("Error adding festival", e);
			throw new RuntimeException("Error adding festival", e);
		}
		return festival;
	}

	@Override
	public void updateFestival(Festival festival) {

		logger.info("Inside Edit Festival Impl");

		String sql = "UPDATE festival SET festival_name = ?, description = ?, status = ?, created_by = ?, created_date = ?, ip_address = ? "
				+ "WHERE festival_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, festival.getFestivalName());
			ps.setString(2, festival.getDescription());
			ps.setString(3, festival.getStatus());
			ps.setInt(4, festival.getCreatedBy());
			ps.setTimestamp(5, java.sql.Timestamp.valueOf(festival.getCreatedDate()));
			ps.setString(6, festival.getIpAddress());
			ps.setInt(7, festival.getFestivalId());

			ps.executeUpdate();
			logger.info("Festival updated successfully");
		} catch (SQLException e) {
			logger.error("Error updating festival", e);
			throw new RuntimeException("Error updating festival", e);
		}
	}

	@Override
	public boolean deleteFestival(int festivalId) {

		logger.info("Inside Delete festival Impl");

		String sql = "Delete from festival WHERE festival_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, festivalId);
			int rowsAffected = ps.executeUpdate();

			if (rowsAffected > 0) {
				logger.info("festival with ID: {} marked as deleted successfully", festivalId);
				return true;
			} else {
				logger.warn("No festival found with ID: {}", festivalId);
				return false;
			}
		} catch (SQLException e) {
			logger.error("Error deleting festival with ID: {}", festivalId, e);
			throw new RuntimeException("Error deleting festival", e);
		}
	}

	@Override
	public Festival getFestivalById(int festivalId) {

		logger.info("Inside Get festival By Id Impl");

		String sql = "SELECT * FROM festival WHERE festival_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, festivalId);

			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					return new Festival(rs.getInt("festival_id"), rs.getString("festival_name"),
							rs.getString("description"), rs.getString("status"), rs.getInt("created_by"),
							rs.getTimestamp("created_date").toString(), rs.getString("ip_address"));
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching festival by ID", e);
			throw new RuntimeException("Error fetching festival by ID", e);
		}

		return null;
	}

	@Override
	public List<Festival> getAllFestivals() {

		logger.info("Fetching all Festivals");

		List<Festival> festivals = new ArrayList<>();

		String sql = "SELECT * FROM festival";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					Festival festival = new Festival(rs.getInt("festival_id"), rs.getString("festival_name"),
							rs.getString("description"), rs.getString("status"), rs.getInt("created_by"),
							rs.getTimestamp("created_date").toString(), rs.getString("ip_address"));
					festivals.add(festival);
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching all festivals", e);
			throw new RuntimeException("Error fetching all festivals", e);
		}

		return festivals;
	}

	@Override
	public List<Festival> getAllActiveFestivals() {

		logger.info("Inside Get All Festivals Impl");

		List<Festival> festivals = new ArrayList<>();

		String status = "y";

		String sql = "SELECT * FROM festival WHERE status = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, status);
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					Festival festival = new Festival(rs.getInt("festival_id"), rs.getString("festival_name"),
							rs.getString("description"), rs.getString("status"), rs.getInt("created_by"),
							rs.getTimestamp("created_date").toString(), rs.getString("ip_address"));
					festivals.add(festival);
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching festivals", e);
			throw new RuntimeException("Error fetching festivals", e);
		}

		return festivals;
	}
}
