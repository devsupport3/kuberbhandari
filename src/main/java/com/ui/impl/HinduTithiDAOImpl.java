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

import com.ui.dao.HinduTithiDAO;
import com.ui.model.HinduTithi;

public class HinduTithiDAOImpl implements HinduTithiDAO {

	@Autowired
	private DataSource dataSource;

	private static final Logger logger = LoggerFactory.getLogger(HinduTithiDAOImpl.class);

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public HinduTithi addHinduTithi(HinduTithi hinduTithi) {

		logger.info("Inside Add Hindu Tithi Impl");

		String sql = "INSERT INTO hindu_tithi (tithi_name, tithi_name_alias, description, status, created_by, ip_address) "
				+ "VALUES (?, ?, ?, ?, ?, ?)";

		try (Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

			ps.setString(1, hinduTithi.getTithiName());
			ps.setString(2, hinduTithi.getTithiNameAlias());
			ps.setString(3, hinduTithi.getDescription());
			ps.setString(4, hinduTithi.getStatus());
			ps.setInt(5, hinduTithi.getCreatedBy());
			ps.setString(6, hinduTithi.getIpAddress());

			ps.executeUpdate();
			logger.info("Hindu tithi added successfully");

			// Retrieve the generated primary key
			try (ResultSet rs = ps.getGeneratedKeys()) {
				if (rs.next()) {
					int generatedId = rs.getInt(1); // Assuming 'id' is the first column
					hinduTithi.setHinduTithiId(generatedId); // Set the generated ID back to the object if needed
					logger.info("Hindu tithi added successfully with ID: " + generatedId);
				}
			}
		} catch (SQLException e) {
			logger.error("Error adding hindu tithi", e);
			throw new RuntimeException("Error adding hindu tithi", e);
		}
		return hinduTithi;
	}

	@Override
	public void updateHinduTithi(HinduTithi hinduTithi) {

		logger.info("Inside Edit Hindu Tithi Impl");

		String sql = "UPDATE hindu_tithi SET tithi_name = ?, tithi_name_alias = ?, description = ?, status = ?, created_by = ?, created_date = ?, ip_address = ? "
				+ "WHERE hindu_tithi_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, hinduTithi.getTithiName());
			ps.setString(2, hinduTithi.getTithiNameAlias());
			ps.setString(3, hinduTithi.getDescription());
			ps.setString(4, hinduTithi.getStatus());
			ps.setInt(5, hinduTithi.getCreatedBy());
			ps.setTimestamp(6, java.sql.Timestamp.valueOf(hinduTithi.getCreatedDate()));
			ps.setString(7, hinduTithi.getIpAddress());
			ps.setInt(8, hinduTithi.getHinduTithiId());

			ps.executeUpdate();
			logger.info("Hindu tithi updated successfully");
		} catch (SQLException e) {
			logger.error("Error updating hindu tithi", e);
			throw new RuntimeException("Error updating hindu tithi", e);
		}
	}

	@Override
	public boolean deleteHinduTithi(int hinduTithiId) {

		logger.info("Inside Delete Hindu Tithi Impl");

		String sql = "Delete from hindu_tithi WHERE hindu_tithi_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, hinduTithiId);
			int rowsAffected = ps.executeUpdate();

			if (rowsAffected > 0) {
				logger.info("Hindu tithi with ID: {} marked as deleted successfully", hinduTithiId);
				return true;
			} else {
				logger.warn("No hindu tithi found with ID: {}", hinduTithiId);
				return false;
			}
		} catch (SQLException e) {
			logger.error("Error deleting hindu tithi with ID: {}", hinduTithiId, e);
			throw new RuntimeException("Error deleting hindu tithi", e);
		}
	}

	@Override
	public HinduTithi getHinduTithiById(int hinduTithiId) {

		logger.info("Inside Get Hindu Tithi By Id Impl");

		String sql = "SELECT * FROM hindu_tithi WHERE hindu_tithi_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, hinduTithiId);

			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					return new HinduTithi(rs.getInt("hindu_tithi_id"), rs.getString("tithi_name"),
							rs.getString("tithi_name_alias"), rs.getString("description"), rs.getString("status"),
							rs.getInt("created_by"), rs.getTimestamp("created_date").toString(),
							rs.getString("ip_address"));
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching hindu tithi by ID", e);
			throw new RuntimeException("Error fetching hindu tithi by ID", e);
		}

		return null;
	}

	@Override
	public List<HinduTithi> getAllHinduTithi() {

		logger.info("Fetching all hindu tithi");

		List<HinduTithi> hinduTithis = new ArrayList<>();

		String sql = "SELECT * FROM hindu_tithi";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					HinduTithi hinduTithi = new HinduTithi(rs.getInt("hindu_tithi_id"), rs.getString("tithi_name"),
							rs.getString("tithi_name_alias"), rs.getString("description"), rs.getString("status"),
							rs.getInt("created_by"), rs.getTimestamp("created_date").toString(),
							rs.getString("ip_address"));
					hinduTithis.add(hinduTithi);
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching all hindu tithi", e);
			throw new RuntimeException("Error fetching all hindu tithi", e);
		}

		return hinduTithis;
	}

	@Override
	public List<HinduTithi> getAllActiveHinduTithi() {

		logger.info("Inside Get All Hindu Tithi Impl");

		List<HinduTithi> hinduTithis = new ArrayList<>();

		String status = "y";

		String sql = "SELECT * FROM hindu_tithi WHERE status = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, status);
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					HinduTithi hinduTithi = new HinduTithi(rs.getInt("hindu_tithi_id"), rs.getString("tithi_name"),
							rs.getString("tithi_name_alias"), rs.getString("description"), rs.getString("status"),
							rs.getInt("created_by"), rs.getTimestamp("created_date").toString(),
							rs.getString("ip_address"));
					hinduTithis.add(hinduTithi);
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching hindu tithi", e);
			throw new RuntimeException("Error fetching hindu tithi", e);
		}

		return hinduTithis;
	}
}
