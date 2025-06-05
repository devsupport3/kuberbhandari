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

import com.ui.dao.FrequencyDAO;
import com.ui.model.Frequency;

public class FrequencyDAOImpl implements FrequencyDAO {

	@Autowired
	private DataSource dataSource;

	private static final Logger logger = LoggerFactory.getLogger(FrequencyDAOImpl.class);

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public List<Frequency> getAllFrequency() {
		logger.info("Fetching all frequencies");

		List<Frequency> frequencies = new ArrayList<>();
		String sql = "SELECT * FROM frequency";

		try (Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {

			while (rs.next()) {
				Frequency frequency = new Frequency(rs.getInt("frequency_id"), rs.getString("frequency_name"),
						rs.getString("description"), rs.getString("image"), rs.getString("status"),
						rs.getInt("created_by"), rs.getTimestamp("created_date").toString(),
						rs.getString("ip_address"));
				frequencies.add(frequency);
			}

			/* logger.info("Fetched {} frequencies", frequencies.size()); */
		} catch (SQLException e) {
			logger.error("Error fetching all frequencies", e);
			throw new RuntimeException("Error fetching all frequencies", e);
		}

		return frequencies;
	}

	@Override
	public List<Frequency> getAllActiveFrequencies() {
		logger.info("Inside Get All Frequencies Impl");

		List<Frequency> frequencies = new ArrayList<>();
		String status = "y";

		String sql = "SELECT * FROM frequency WHERE status = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, status);
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					Frequency frequency = new Frequency(rs.getInt("frequency_id"), rs.getString("frequency_name"),
							rs.getString("description"), rs.getString("image"), rs.getString("status"),
							rs.getInt("created_by"), rs.getTimestamp("created_date").toString(),
							rs.getString("ip_address"));
					frequencies.add(frequency);
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching frequencies", e);
			throw new RuntimeException("Error fetching frequencies", e);
		}

		return frequencies;
	}

	@Override
	public Frequency addFrequency(Frequency frequency) {
		logger.info("Inside Add Frequency Impl");

		String sql = "INSERT INTO frequency (frequency_name, description, image, status, created_by, ip_address) "
				+ "VALUES (?, ?, ?, ?, ?, ?)";

		try (Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

			ps.setString(1, frequency.getFrequencyName());
			ps.setString(2, frequency.getDescription());
			ps.setString(3, frequency.getImage());
			ps.setString(4, frequency.getStatus());
			ps.setInt(5, frequency.getCreatedBy());
			ps.setString(6, frequency.getIpAddress());

			ps.executeUpdate();
			logger.info("Frequency added successfully");
			// Retrieve the generated primary key
			try (ResultSet rs = ps.getGeneratedKeys()) {
				if (rs.next()) {
					int generatedId = rs.getInt(1); // Assuming 'id' is the first column
					frequency.setFrequencyId(generatedId); // Set the generated ID back to the object if needed
					logger.info("Frequency added successfully with ID: " + generatedId);
				}
			}
		} catch (SQLException e) {
			logger.error("Error adding frequency", e);
			throw new RuntimeException("Error adding frequency", e);
		}
		return frequency;
	}

	@Override
	public void updateFrequency(Frequency frequency) {
		logger.info("Inside Edit Frequency Impl");

		String sql = "UPDATE frequency SET frequency_name = ?, description = ?, image = ?, status = ?, created_by = ?, created_date = ?, ip_address = ? "
				+ "WHERE frequency_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, frequency.getFrequencyName());
			ps.setString(2, frequency.getDescription());
			ps.setString(3, frequency.getImage());
			ps.setString(4, frequency.getStatus());
			ps.setInt(5, frequency.getCreatedBy());
			ps.setTimestamp(6, java.sql.Timestamp.valueOf(frequency.getCreatedDate()));
			ps.setString(7, frequency.getIpAddress());
			ps.setInt(8, frequency.getFrequencyId());

			ps.executeUpdate();
			logger.info("Frequency updated successfully");
		} catch (SQLException e) {
			logger.error("Error updating frequency", e);
			throw new RuntimeException("Error updating frequency", e);
		}
	}

	@Override
	public boolean deleteFrequency(int frequencyId) {
		logger.info("Inside Delete Frequency Impl");

		String sql = "Delete from frequency WHERE frequency_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, frequencyId);
			int rowsAffected = ps.executeUpdate();

			if (rowsAffected > 0) {
				logger.info("Frequency with ID: {} marked as deleted successfully", frequencyId);
				return true;
			} else {
				logger.warn("No frequency found with ID: {}", frequencyId);
				return false;
			}
		} catch (SQLException e) {
			logger.error("Error deleting Frequency with ID: {}", frequencyId, e);
			throw new RuntimeException("Error deleting frequency", e);
		}
	}

	@Override
	public Frequency getFrequencyById(int frequencyId) {
		logger.info("Inside Get Frequency By Id Impl");

		String sql = "SELECT * FROM frequency WHERE frequency_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, frequencyId);

			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					return new Frequency(rs.getInt("frequency_id"), rs.getString("frequency_name"),
							rs.getString("description"), rs.getString("image"), rs.getString("status"),
							rs.getInt("created_by"), rs.getTimestamp("created_date").toString(),
							rs.getString("ip_address"));
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching frequency by ID", e);
			throw new RuntimeException("Error fetching frequency by ID", e);
		}

		return null; // return null if no record found
	}
}
