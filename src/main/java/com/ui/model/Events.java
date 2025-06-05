package com.ui.model;

import java.util.List;

public class Events {

	// Constructor
	public Events(int eventId, String eventTitle, String eventLocation, String eventDate, String eventDescription,
			String status, int createdBy, String ipAddress) {
		this.eventId = eventId;
		this.eventTitle = eventTitle;
		this.eventLocation = eventLocation;
		this.eventDate = eventDate;
		this.eventDescription = eventDescription;
		this.status = status;
		this.createdBy = createdBy;
		this.ipAddress = ipAddress;
	}

	public Events() {
	}

	// Properties
	private int eventId;
	private String eventTitle;
	private String eventLocation;
	private String eventDate;
	private String eventDescription;
	private String status;
	private int createdBy;
	private String ipAddress;

	private List<EventsImages> eventsImages;

	public List<EventsImages> getEventsImages() {
		return eventsImages;
	}

	public void setEventsImages(List<EventsImages> eventsImages) {
		this.eventsImages = eventsImages;
	}

	public int getEventId() {
		return eventId;
	}

	public void setEventId(int eventId) {
		this.eventId = eventId;
	}

	public String getEventTitle() {
		return eventTitle;
	}

	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}

	public String getEventLocation() {
		return eventLocation;
	}

	public void setEventLocation(String eventLocation) {
		this.eventLocation = eventLocation;
	}

	public String getEventDate() {
		return eventDate;
	}

	public void setEventDate(String eventDate) {
		this.eventDate = eventDate;
	}

	public String getEventDescription() {
		return eventDescription;
	}

	public void setEventDescription(String eventDescription) {
		this.eventDescription = eventDescription;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}

	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}
}
