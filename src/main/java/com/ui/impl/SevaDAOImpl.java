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

import com.ui.dao.SevaDAO;
import com.ui.model.Seva;

public class SevaDAOImpl implements SevaDAO {

	@Autowired
	private DataSource dataSource;

	private static final Logger logger = LoggerFactory.getLogger(SevaDAOImpl.class);

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public List<Seva> getAllSeva() {
		logger.info("Fetching all Seva");

		List<Seva> sevas = new ArrayList<>();
		String sql = "SELECT s.*, v.variation_name, f.frequency_name FROM seva s left join variation v on  v.variation_id = s.variation_id left join frequency f on f.frequency_id = s.frequency_id order by seva_id desc";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					Seva seva = new Seva(rs.getInt("seva_id"), rs.getInt("sequence"), rs.getString("seva_title"),
							rs.getString("seva_subtitle"), rs.getInt("seva_type_id"), rs.getInt("seva_category_id"),
							rs.getInt("variation_id"), rs.getInt("frequency_id"), rs.getString("book_before_days"),
							rs.getString("seva_description"), rs.getFloat("seva_price"), rs.getString("delivery"),
							rs.getString("status"), rs.getInt("created_by"), rs.getTimestamp("created_date").toString(),
							rs.getString("ip_address"), rs.getString("variation_name"), rs.getString("frequency_name"));
					sevas.add(seva);
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching all seva", e);
			throw new RuntimeException("Error fetching all seva", e);
		}

		return sevas;
	}

	@Override
	public List<Seva> getAllActiveSeva() {
		logger.info("Inside Get All Sevas Impl");

		List<Seva> sevas = new ArrayList<>();
		String status = "y";
		String sql = "SELECT s.*, v.variation_name, f.frequency_name FROM seva s left join variation v on  v.variation_id = s.variation_id left join frequency f on f.frequency_id = s.frequency_id WHERE s.status = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, status);
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					Seva seva = new Seva(rs.getInt("seva_id"), rs.getInt("sequence"), rs.getString("seva_title"),
							rs.getString("seva_subtitle"), rs.getInt("seva_type_id"), rs.getInt("seva_category_id"),
							rs.getInt("variation_id"), rs.getInt("frequency_id"), rs.getString("book_before_days"),
							rs.getString("seva_description"), rs.getFloat("seva_price"), rs.getString("delivery"),
							rs.getString("status"), rs.getInt("created_by"), rs.getTimestamp("created_date").toString(),
							rs.getString("ip_address"), rs.getString("variation_name"), rs.getString("frequency_name"));
					sevas.add(seva);
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching sevas", e);
			throw new RuntimeException("Error fetching sevas", e);
		}

		return sevas;
	}

	@Override
	public Seva addSeva(Seva seva) {
		logger.info("Inside Add Seva Impl");

		String sql = "INSERT INTO seva (sequence, seva_title, seva_subtitle, seva_type_id, seva_category_id, variation_id, frequency_id, "
				+ "book_before_days, seva_description, seva_price, delivery, status, created_by, ip_address) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try (Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

			ps.setInt(1, seva.getSequence());
			ps.setString(2, seva.getSevaTitle());
			ps.setString(3, seva.getSevaSubtitle());
			ps.setInt(4, seva.getSevaTypeId());
			ps.setInt(5, seva.getSevaCategoryId());
			ps.setInt(6, seva.getVariationId());
			ps.setInt(7, seva.getFrequencyId());
			ps.setString(8, seva.getBookBeforeDays());
			ps.setString(9, seva.getSevaDescription());
			ps.setDouble(10, seva.getSevaPrice());
			ps.setString(11, seva.getDelivery());
			ps.setString(12, seva.getStatus());
			ps.setInt(13, seva.getCreatedBy());
			ps.setString(14, seva.getIpAddress());

			ps.executeUpdate();
			logger.info("Seva added successfully");
			// Retrieve the generated primary key
			try (ResultSet rs = ps.getGeneratedKeys()) {
				if (rs.next()) {
					int generatedId = rs.getInt(1); // Assuming 'id' is the first column
					seva.setSevaId(generatedId); // Set the generated ID back to the object if needed
					logger.info("Seva added successfully with ID: " + generatedId);
				}
			}
		} catch (SQLException e) {
			logger.error("Error adding seva", e);
			throw new RuntimeException("Error adding seva", e);
		}
		return seva;
	}

	@Override
	public void updateSeva(Seva seva) {
		logger.info("Inside Edit Seva Impl");

		String sql = "UPDATE seva SET sequence = ?, seva_title = ?, seva_subtitle = ?, seva_type_id = ?, seva_category_id = ?, "
				+ "variation_id = ?, frequency_id = ?, book_before_days = ?, seva_description = ?, seva_price = ?, "
				+ "delivery = ?, status = ?, created_by = ?, created_date = ?, ip_address = ? WHERE seva_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, seva.getSequence());
			ps.setString(2, seva.getSevaTitle());
			ps.setString(3, seva.getSevaSubtitle());
			ps.setInt(4, seva.getSevaTypeId());
			ps.setInt(5, seva.getSevaCategoryId());
			ps.setInt(6, seva.getVariationId());
			ps.setInt(7, seva.getFrequencyId());
			ps.setString(8, seva.getBookBeforeDays());
			ps.setString(9, seva.getSevaDescription());
			ps.setDouble(10, seva.getSevaPrice());
			ps.setString(11, seva.getDelivery());
			ps.setString(12, seva.getStatus());
			ps.setInt(13, seva.getCreatedBy());
			ps.setTimestamp(14, java.sql.Timestamp.valueOf(seva.getCreatedDate()));
			ps.setString(15, seva.getIpAddress());
			ps.setInt(16, seva.getSevaId());

			ps.executeUpdate();
			logger.info("Seva updated successfully");
		} catch (SQLException e) {
			logger.error("Error updating seva", e);
			throw new RuntimeException("Error updating seva", e);
		}
	}

	@Override
	public boolean deleteSeva(int sevaId) {
		logger.info("Inside Delete Seva Impl");

		String sql = "Delete from seva WHERE seva_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, sevaId);
			int rowsAffected = ps.executeUpdate();

			if (rowsAffected > 0) {
				logger.info("Seva with ID: {} marked as deleted successfully", sevaId);
				return true;
			} else {
				logger.warn("No Seva found with ID: {}", sevaId);
				return false;
			}
		} catch (SQLException e) {
			logger.error("Error deleting seva with ID: {}", sevaId, e);
			throw new RuntimeException("Error deleting seva", e);
		}

	}

	@Override
	public Seva getSevaById(int sevaId) {
		logger.info("Inside Get Seva By Id Impl");

		String sql = "SELECT s.*, v.variation_name, f.frequency_name FROM seva s left join variation v on  v.variation_id = s.variation_id left join frequency f on f.frequency_id = s.frequency_id WHERE s.seva_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, sevaId);

			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					return new Seva(rs.getInt("seva_id"), rs.getInt("sequence"), rs.getString("seva_title"),
							rs.getString("seva_subtitle"), rs.getInt("seva_type_id"), rs.getInt("seva_category_id"),
							rs.getInt("variation_id"), rs.getInt("frequency_id"), rs.getString("book_before_days"),
							rs.getString("seva_description"), rs.getFloat("seva_price"), rs.getString("delivery"),
							rs.getString("status"), rs.getInt("created_by"), rs.getTimestamp("created_date").toString(),
							rs.getString("ip_address"), rs.getString("variation_name"), rs.getString("frequency_name"));
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching seva by ID", e);
			throw new RuntimeException("Error fetching seva by ID", e);
		}

		return null; // return null if no record found
	}
}
