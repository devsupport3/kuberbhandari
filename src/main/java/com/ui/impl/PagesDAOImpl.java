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

import com.ui.dao.PagesDAO;
import com.ui.model.Pages;

public class PagesDAOImpl implements PagesDAO {

	@Autowired
	private DataSource dataSource;

	private static final Logger logger = LoggerFactory.getLogger(PagesDAOImpl.class);

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	// Get all pages with status 'y'
	@Override
	public List<Pages> getAllPages() {
		logger.info("Inside Get All Pages Impl");

		List<Pages> pagesList = new ArrayList<>();
		String status = "y"; // Active pages
		String sql = "SELECT page_id, page_name, status, created_by, created_date, ip_address FROM pages WHERE status = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, status);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Pages page = new Pages(rs.getInt("page_id"), rs.getString("page_name"), rs.getString("status"),
						rs.getInt("created_by"), rs.getString("created_date"), rs.getString("ip_address"));
				pagesList.add(page);
			}
			rs.close();
		} catch (SQLException e) {
			logger.error("Error fetching pages", e);
			throw new RuntimeException(e);
		}

		return pagesList;
	}

	// Add a new page
	@Override
	public void addPage(Pages page) {
		logger.info("Inside Add Page Impl");

		String sql = "INSERT INTO pages (page_name, status, created_by, created_date, ip_address) VALUES (?, ?, ?, ?, ?)";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, page.getPageName());
			ps.setString(2, page.getStatus());
			ps.setInt(3, page.getCreatedBy());
			ps.setString(4, page.getCreatedDate());
			ps.setString(5, page.getIpAddress());

			ps.executeUpdate();
			logger.info("Page added successfully");
		} catch (SQLException e) {
			logger.error("Error adding page", e);
			throw new RuntimeException(e);
		}
	}

	// Update an existing page
	@Override
	public void editPage(Pages page) {
		logger.info("Inside Edit Page Impl");

		String sql = "UPDATE pages SET page_name = ?, status = ?, created_by = ?, created_date = ?, ip_address = ? WHERE page_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, page.getPageName());
			ps.setString(2, page.getStatus());
			ps.setInt(3, page.getCreatedBy());
			ps.setString(4, page.getCreatedDate());
			ps.setString(5, page.getIpAddress());
			ps.setInt(6, page.getPageId());

			ps.executeUpdate();
			logger.info("Page updated successfully");
		} catch (SQLException e) {
			logger.error("Error updating page", e);
			throw new RuntimeException(e);
		}
	}

	// Delete a page (soft delete by setting status to 'n')
	@Override
	public void deletePage(int pageId) {
		logger.info("Inside Delete Page Impl");

		String sql = "UPDATE pages SET status = 'n' WHERE page_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, pageId);
			ps.executeUpdate();
			logger.info("Page deleted successfully");
		} catch (SQLException e) {
			logger.error("Error deleting page", e);
			throw new RuntimeException(e);
		}
	}
}