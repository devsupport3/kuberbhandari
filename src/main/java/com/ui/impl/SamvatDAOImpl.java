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

import com.ui.dao.SamvatDAO;
import com.ui.model.Samvat;

public class SamvatDAOImpl implements SamvatDAO {

	@Autowired
	private DataSource dataSource;

	private static final Logger logger = LoggerFactory.getLogger(SamvatDAOImpl.class);

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public Samvat addSamvat(Samvat samvat) {

		logger.info("Inside Add Samvat Impl");

		String sql = "INSERT INTO samvat (samvat_name, description, status, created_by, ip_address) "
				+ "VALUES (?, ?, ?, ?, ?)";

		try (Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

			ps.setString(1, samvat.getSamvatName());
			ps.setString(2, samvat.getDescription());
			ps.setString(3, samvat.getStatus());
			ps.setInt(4, samvat.getCreatedBy());
			ps.setString(5, samvat.getIpAddress());

			ps.executeUpdate();

			logger.info("Samvat added successfully");

			// Retrieve the generated primary key
			try (ResultSet rs = ps.getGeneratedKeys()) {
				if (rs.next()) {
					int generatedId = rs.getInt(1); // Assuming 'id' is the first column
					samvat.setSamvatId(generatedId); // Set the generated ID back to the object if needed
					logger.info("Samvat added successfully with ID: " + generatedId);
				}
			}
		} catch (SQLException e) {
			logger.error("Error adding samvat", e);
			throw new RuntimeException("Error adding samvat", e);
		}
		return samvat;
	}

	@Override
	public void updateSamvat(Samvat samvat) {

		logger.info("Inside Edit Samvat Impl");

		String sql = "UPDATE samvat SET samvat_name = ?, description = ?, status = ?, created_by = ?, created_date = ?, ip_address = ? "
				+ "WHERE samvat_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, samvat.getSamvatName());
			ps.setString(2, samvat.getDescription());
			ps.setString(3, samvat.getStatus());
			ps.setInt(4, samvat.getCreatedBy());
			ps.setTimestamp(5, java.sql.Timestamp.valueOf(samvat.getCreatedDate()));
			ps.setString(6, samvat.getIpAddress());
			ps.setInt(7, samvat.getSamvatId());

			ps.executeUpdate();
			logger.info("Samvat updated successfully");
		} catch (SQLException e) {
			logger.error("Error updating samvat", e);
			throw new RuntimeException("Error updating samvat", e);
		}
	}

	@Override
	public boolean deleteSamvat(int samvatId) {

		logger.info("Inside Delete Samvat Impl");

		String sql = "Delete from samvat WHERE samvat_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, samvatId);
			int rowsAffected = ps.executeUpdate();

			if (rowsAffected > 0) {
				logger.info("Samvat with ID: {} marked as deleted successfully", samvatId);
				return true;
			} else {
				logger.warn("No samvat found with ID: {}", samvatId);
				return false;
			}
		} catch (SQLException e) {
			logger.error("Error deleting samvat with ID: {}", samvatId, e);
			throw new RuntimeException("Error deleting samvat", e);
		}
	}

	@Override
	public Samvat getSamvatById(int samvatId) {

		logger.info("Inside Get Samvat By Id Impl");

		String sql = "SELECT * FROM samvat WHERE samvat_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, samvatId);

			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					return new Samvat(rs.getInt("samvat_id"), rs.getString("samvat_name"), rs.getString("description"),
							rs.getString("status"), rs.getInt("created_by"), rs.getTimestamp("created_date").toString(),
							rs.getString("ip_address"));
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching samvat by ID", e);
			throw new RuntimeException("Error fetching samvat by ID", e);
		}

		return null;
	}

	@Override
	public List<Samvat> getAllSamvat() {

		logger.info("Fetching all Samvat");

		List<Samvat> samvats = new ArrayList<>();

		String sql = "SELECT * FROM samvat";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					Samvat samvat = new Samvat(rs.getInt("samvat_id"), rs.getString("samvat_name"),
							rs.getString("description"), rs.getString("status"), rs.getInt("created_by"),
							rs.getTimestamp("created_date").toString(), rs.getString("ip_address"));
					samvats.add(samvat);
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching all samvat", e);
			throw new RuntimeException("Error fetching all samvat", e);
		}

		return samvats;
	}

	@Override
	public List<Samvat> getAllActiveSamvat() {

		logger.info("Inside Get All samvat Impl");

		List<Samvat> samvats = new ArrayList<>();

		String status = "y";

		String sql = "SELECT * FROM samvat WHERE status = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, status);
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					Samvat samvat = new Samvat(rs.getInt("samvat_id"), rs.getString("samvat_name"),
							rs.getString("description"), rs.getString("status"), rs.getInt("created_by"),
							rs.getTimestamp("created_date").toString(), rs.getString("ip_address"));
					samvats.add(samvat);
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching samvat", e);
			throw new RuntimeException("Error fetching samvat", e);
		}

		return samvats;
	}
}
