package com.ui.model;

public class EventsImages {

	private int eventImageId;
	private int eventId;
	private String eventImageTitle;
	private String eventImageDescription;
	private String eventImage;
	private String status;
	private int createdBy;
	private String createdDate;
	private String ipAddress;

	// Default Constructor
	public EventsImages() {
	}

	// Parameterized Constructor
	public EventsImages(int eventImageId, int eventId, String eventImageTitle, String eventImageDescription,
			String eventImage, String status, int createdBy, String createdDate, String ipAddress) {
		this.eventImageId = eventImageId;
		this.eventId = eventId;
		this.eventImageTitle = eventImageTitle;
		this.eventImageDescription = eventImageDescription;
		this.eventImage = eventImage;
		this.status = status;
		this.createdBy = createdBy;
		this.createdDate = createdDate;
		this.ipAddress = ipAddress;
	}

	// Getters and Setters
	public int getEventImageId() {
		return eventImageId;
	}

	public void setEventImageId(int eventImageId) {
		this.eventImageId = eventImageId;
	}

	public int getEventId() {
		return eventId;
	}

	public void setEventId(int eventId) {
		this.eventId = eventId;
	}

	public String getEventImageTitle() {
		return eventImageTitle;
	}

	public void setEventImageTitle(String eventImageTitle) {
		this.eventImageTitle = eventImageTitle;
	}

	public String getEventImageDescription() {
		return eventImageDescription;
	}

	public void setEventImageDescription(String eventImageDescription) {
		this.eventImageDescription = eventImageDescription;
	}

	public String getEventImage() {
		return eventImage;
	}

	public void setEventImage(String eventImage) {
		this.eventImage = eventImage;
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

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}
}
