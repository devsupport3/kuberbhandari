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

import com.ui.dao.ImportantDatesDAO;
import com.ui.model.ImportantDates;

public class ImportantDatesDAOImpl implements ImportantDatesDAO {

	@Autowired
	private DataSource dataSource;

	private static final Logger logger = LoggerFactory.getLogger(ImportantDatesDAOImpl.class);

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public ImportantDates addImportantDates(ImportantDates importantDates) {

		logger.info("Inside Add Important Dates Impl");

		String sql = "INSERT INTO important_date (festival_id, english_date, english_day, samvat_id, hindu_year_id, hindu_month_id, hindu_paksh_id, tithi_number, hindu_tithi_id, "
				+ "hindu_month_type_id, description, status, created_by, ip_address) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try (Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

			ps.setInt(1, importantDates.getFestivalId());
			ps.setString(2, importantDates.getEnglishDate());
			ps.setString(3, importantDates.getEnglishDay());
			ps.setInt(4, importantDates.getSamvatId());
			ps.setInt(5, importantDates.getHinduYearId());
			ps.setInt(6, importantDates.getHinduMonthId());
			ps.setInt(7, importantDates.getHinduPakshId());
			ps.setInt(8, importantDates.getTithiNumber());
			ps.setInt(9, importantDates.getHinduTithiId());
			ps.setInt(10, importantDates.getHinduMonthTypeId());
			ps.setString(11, importantDates.getImpDateDescription());
			ps.setString(12, importantDates.getStatus());
			ps.setInt(13, importantDates.getCreatedBy());
			ps.setString(14, importantDates.getIpAddress());

			ps.executeUpdate();
			logger.info("Important dates added successfully");

			// Retrieve the generated primary key
			try (ResultSet rs = ps.getGeneratedKeys()) {
				if (rs.next()) {
					int generatedId = rs.getInt(1); // Assuming 'id' is the first column
					importantDates.setImportantDateId(generatedId); // Set the generated ID back to the object if
																	// needed
					logger.info("Important dates added successfully with ID: " + generatedId);
				}
			}
		} catch (SQLException e) {
			logger.error("Error adding important dates", e);
			throw new RuntimeException("Error adding important dates", e);
		}
		return importantDates;
	}

	@Override
	public void updateImportantDates(ImportantDates importantDates) {

		logger.info("Inside Edit Important Dates Impl");

		String sql = "UPDATE important_date SET festival_id = ?, english_date = ?, english_day = ?, samvat_id = ?, hindu_year_id = ?, hindu_month_id = ?, "
				+ "hindu_paksh_id = ?, tithi_number = ?, hindu_tithi_id = ?, hindu_month_type_id = ?, description = ?, "
				+ "status = ?, created_by = ?, created_date = ?, ip_address = ? WHERE important_date_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, importantDates.getFestivalId());
			ps.setString(2, importantDates.getEnglishDate());
			ps.setString(3, importantDates.getEnglishDay());
			ps.setInt(4, importantDates.getSamvatId());
			ps.setInt(5, importantDates.getHinduYearId());
			ps.setInt(6, importantDates.getHinduMonthId());
			ps.setInt(7, importantDates.getHinduPakshId());
			ps.setInt(8, importantDates.getTithiNumber());
			ps.setInt(9, importantDates.getHinduTithiId());
			ps.setInt(10, importantDates.getHinduMonthTypeId());
			ps.setString(11, importantDates.getImpDateDescription());
			ps.setString(12, importantDates.getStatus());
			ps.setInt(13, importantDates.getCreatedBy());
			ps.setTimestamp(14, java.sql.Timestamp.valueOf(importantDates.getCreatedDate()));
			ps.setString(15, importantDates.getIpAddress());
			ps.setInt(16, importantDates.getImportantDateId());

			ps.executeUpdate();
			logger.info("Important Dates updated successfully");
		} catch (SQLException e) {
			logger.error("Error updating Important Dates", e);
			throw new RuntimeException("Error updating Important Dates", e);
		}
	}

	@Override
	public boolean deleteImportantDates(int importantDateId) {

		logger.info("Inside Delete Important Dates Impl");

		String sql = "Delete from important_date WHERE important_date_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, importantDateId);
			int rowsAffected = ps.executeUpdate();

			if (rowsAffected > 0) {
				logger.info("Important dates with ID: {} marked as deleted successfully", importantDateId);
				return true;
			} else {
				logger.warn("No important dates found with ID: {}", importantDateId);
				return false;
			}
		} catch (SQLException e) {
			logger.error("Error deleting important dates with ID: {}", importantDateId, e);
			throw new RuntimeException("Error deleting important dates", e);
		}

	}

	@Override
	public ImportantDates getImportantDateById(int importantDateId) {

		logger.info("Inside Get Important Dates By Id Impl");

		// String sql = "SELECT * from important_date WHERE important_date_id = ?";
		String sql = "SELECT id.*, " + "f.festival_name, " + "s.samvat_name, " + "hy.hindu_year, "
				+ "hm.hindu_month_name, " + "hp.paksh_name, " + "ht.tithi_name, " + "hmt.hindu_month_type "
				+ "FROM important_date id " + "LEFT JOIN festival f ON f.festival_id = id.festival_id "
				+ "LEFT JOIN samvat s ON s.samvat_id = id.samvat_id "
				+ "LEFT JOIN hindu_year hy ON hy.hindu_year_id = id.hindu_year_id "
				+ "LEFT JOIN hindu_month hm ON hm.hindu_month_id = id.hindu_month_id "
				+ "LEFT JOIN hindu_paksh hp ON hp.hindu_paksh_id = id.hindu_paksh_id "
				+ "LEFT JOIN hindu_tithi ht ON ht.hindu_tithi_id = id.hindu_tithi_id "
				+ "LEFT JOIN hindu_month_type hmt ON hmt.hindu_month_type_id = id.hindu_month_type_id "
				+ "WHERE id.important_date_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, importantDateId);

			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					return new ImportantDates(rs.getInt("important_date_id"), rs.getInt("festival_id"),
							rs.getString("english_date"), rs.getString("english_day"), rs.getInt("samvat_id"),
							rs.getInt("hindu_year_id"), rs.getInt("hindu_month_id"), rs.getInt("hindu_paksh_id"),
							rs.getInt("tithi_number"), rs.getInt("hindu_tithi_id"), rs.getInt("hindu_month_type_id"),
							rs.getString("description"), rs.getString("status"), rs.getInt("created_by"),
							rs.getTimestamp("created_date").toString(), rs.getString("ip_address"),
							rs.getString("festival_name"), rs.getString("samvat_name"), rs.getString("hindu_year"),
							rs.getString("hindu_month_name"), rs.getString("paksh_name"), rs.getString("tithi_name"),
							rs.getString("hindu_month_type"));
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching important dates by ID", e);
			throw new RuntimeException("Error fetching important dates by ID", e);
		}

		return null; // return null if no record found
	}

	@Override
	public List<ImportantDates> getAllImportantDates() {

		logger.info("Fetching all important dates");

		List<ImportantDates> importantDate = new ArrayList<>();

		// String sql = "SELECT * from important_date order by important_date_id desc";
		String sql = "SELECT id.*, " + "f.festival_name, " + "s.samvat_name, " + "hy.hindu_year, "
				+ "hm.hindu_month_name, " + "hp.paksh_name, " + "ht.tithi_name, " + "hmt.hindu_month_type "
				+ "FROM important_date id " + "LEFT JOIN festival f ON f.festival_id = id.festival_id "
				+ "LEFT JOIN samvat s ON s.samvat_id = id.samvat_id "
				+ "LEFT JOIN hindu_year hy ON hy.hindu_year_id = id.hindu_year_id "
				+ "LEFT JOIN hindu_month hm ON hm.hindu_month_id = id.hindu_month_id "
				+ "LEFT JOIN hindu_paksh hp ON hp.hindu_paksh_id = id.hindu_paksh_id "
				+ "LEFT JOIN hindu_tithi ht ON ht.hindu_tithi_id = id.hindu_tithi_id "
				+ "LEFT JOIN hindu_month_type hmt ON hmt.hindu_month_type_id = id.hindu_month_type_id "
				+ "ORDER BY id.important_date_id DESC";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					ImportantDates importantDates = new ImportantDates(rs.getInt("important_date_id"),
							rs.getInt("festival_id"), rs.getString("english_date"), rs.getString("english_day"),
							rs.getInt("samvat_id"), rs.getInt("hindu_year_id"), rs.getInt("hindu_month_id"),
							rs.getInt("hindu_paksh_id"), rs.getInt("tithi_number"), rs.getInt("hindu_tithi_id"),
							rs.getInt("hindu_month_type_id"), rs.getString("description"), rs.getString("status"),
							rs.getInt("created_by"), rs.getTimestamp("created_date").toString(),
							rs.getString("ip_address"), rs.getString("festival_name"), rs.getString("samvat_name"),
							rs.getString("hindu_year"), rs.getString("hindu_month_name"), rs.getString("paksh_name"),
							rs.getString("tithi_name"), rs.getString("hindu_month_type"));
					importantDate.add(importantDates);
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching all important dates", e);
			throw new RuntimeException("Error fetching all important dates", e);
		}

		return importantDate;
	}

	@Override
	public List<ImportantDates> getAllActiveImportantDates() {

		logger.info("Inside Get All Important Dates Impl");

		List<ImportantDates> importantDate = new ArrayList<>();

		String status = "y";

		// String sql = "SELECT * from important_date WHERE status = ?";
		String sql = "SELECT id.*, " + "f.festival_name, " + "s.samvat_name, " + "hy.hindu_year, "
				+ "hm.hindu_month_name, " + "hp.paksh_name, " + "ht.tithi_name, " + "hmt.hindu_month_type "
				+ "FROM important_date id " + "LEFT JOIN festival f ON f.festival_id = id.festival_id "
				+ "LEFT JOIN samvat s ON s.samvat_id = id.samvat_id "
				+ "LEFT JOIN hindu_year hy ON hy.hindu_year_id = id.hindu_year_id "
				+ "LEFT JOIN hindu_month hm ON hm.hindu_month_id = id.hindu_month_id "
				+ "LEFT JOIN hindu_paksh hp ON hp.hindu_paksh_id = id.hindu_paksh_id "
				+ "LEFT JOIN hindu_tithi ht ON ht.hindu_tithi_id = id.hindu_tithi_id "
				+ "LEFT JOIN hindu_month_type hmt ON hmt.hindu_month_type_id = id.hindu_month_type_id "
				+ "WHERE id.status = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, status);
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					ImportantDates importantDates = new ImportantDates(rs.getInt("important_date_id"),
							rs.getInt("festival_id"), rs.getString("english_date"), rs.getString("english_day"),
							rs.getInt("samvat_id"), rs.getInt("hindu_year_id"), rs.getInt("hindu_month_id"),
							rs.getInt("hindu_paksh_id"), rs.getInt("tithi_number"), rs.getInt("hindu_tithi_id"),
							rs.getInt("hindu_month_type_id"), rs.getString("description"), rs.getString("status"),
							rs.getInt("created_by"), rs.getTimestamp("created_date").toString(),
							rs.getString("ip_address"), rs.getString("festival_name"), rs.getString("samvat_name"),
							rs.getString("hindu_year"), rs.getString("hindu_month_name"), rs.getString("paksh_name"),
							rs.getString("tithi_name"), rs.getString("hindu_month_type"));
					importantDate.add(importantDates);
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching important dates", e);
			throw new RuntimeException("Error fetching important dates", e);
		}

		return importantDate;
	}
}
