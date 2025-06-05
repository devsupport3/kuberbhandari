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

import com.ui.dao.EventsDAO;
import com.ui.model.Events;

public class EventsDAOImpl implements EventsDAO {

	@Autowired
	private DataSource dataSource;

	private static final Logger logger = LoggerFactory.getLogger(EventsDAOImpl.class);

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public List<Events> getAllEvents() {
		logger.info("Fetching all events");
		List<Events> events = new ArrayList<>();
		String sql = "SELECT * FROM events ORDER BY event_id DESC";

		try (Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {

			while (rs.next()) {
				Events event = new Events(rs.getInt("event_id"), rs.getString("event_title"),
						rs.getString("event_location"), rs.getString("event_date"), rs.getString("event_description"),
						rs.getString("status"), rs.getInt("created_by"), rs.getString("ip_address"));
				events.add(event);
			}
		} catch (SQLException e) {
			logger.error("Error fetching events", e);
			throw new RuntimeException("Error fetching events", e);
		}
		return events;
	}

	@Override
	public Events getEventById(int eventId) {
		logger.info("Fetching event by ID: " + eventId);
		String sql = "SELECT * FROM events WHERE event_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, eventId);
			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					return new Events(rs.getInt("event_id"), rs.getString("event_title"),
							rs.getString("event_location"), rs.getString("event_date"),
							rs.getString("event_description"), rs.getString("status"), rs.getInt("created_by"),
							rs.getString("ip_address"));
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching event by ID", e);
			throw new RuntimeException("Error fetching event by ID", e);
		}
		return null;
	}

	@Override
	public Events addEvent(Events event) {
		logger.info("Adding new event");
		String sql = "INSERT INTO events (event_title, event_location, event_date, event_description, status, created_by, ip_address) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?)";

		try (Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

			ps.setString(1, event.getEventTitle());
			ps.setString(2, event.getEventLocation());
			ps.setString(3, event.getEventDate());
			ps.setString(4, event.getEventDescription());
			ps.setString(5, event.getStatus());
			ps.setInt(6, event.getCreatedBy());
			ps.setString(7, event.getIpAddress());

			ps.executeUpdate();
			try (ResultSet rs = ps.getGeneratedKeys()) {
				if (rs.next()) {
					event.setEventId(rs.getInt(1));
				}
			}
		} catch (SQLException e) {
			logger.error("Error adding event", e);
			throw new RuntimeException("Error adding event", e);
		}
		return event;
	}

	@Override
	public void updateEvent(Events event) {
		logger.info("Updating event with ID: " + event.getEventId());
		String sql = "UPDATE events SET event_title = ?, event_location = ?, event_date = ?, event_description = ?, status = ?, created_by = ?, ip_address = ? WHERE event_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, event.getEventTitle());
			ps.setString(2, event.getEventLocation());
			ps.setString(3, event.getEventDate());
			ps.setString(4, event.getEventDescription());
			ps.setString(5, event.getStatus());
			ps.setInt(6, event.getCreatedBy());
			ps.setString(7, event.getIpAddress());
			ps.setInt(8, event.getEventId());

			ps.executeUpdate();
		} catch (SQLException e) {
			logger.error("Error updating event", e);
			throw new RuntimeException("Error updating event", e);
		}
	}

	@Override
	public boolean deleteEvent(int eventId) {
		logger.info("Deleting event with ID: " + eventId);
		String sql = "DELETE FROM events WHERE event_id = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, eventId);
			int rowsAffected = ps.executeUpdate();
			return rowsAffected > 0;
		} catch (SQLException e) {
			logger.error("Error deleting event", e);
			throw new RuntimeException("Error deleting event", e);
		}
	}

	@Override
	public List<Events> getAllActiveEvents() {
		logger.info("Fetching all active events");

		List<Events> events = new ArrayList<>();
		String status = "y";
		String sql = "SELECT * FROM events WHERE status = ? ORDER BY event_id DESC";

		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, status);
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					Events event = new Events(rs.getInt("event_id"), rs.getString("event_title"),
							rs.getString("event_location"), rs.getString("event_date"),
							rs.getString("event_description"), rs.getString("status"), rs.getInt("created_by"),
							rs.getString("ip_address"));
					events.add(event);
				}
			}
		} catch (SQLException e) {
			logger.error("Error fetching active events", e);
			throw new RuntimeException("Error fetching active events", e);
		}

		return events;
	}

}
