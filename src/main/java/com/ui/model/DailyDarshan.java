package com.ui.model;

import java.util.List;

public class DailyDarshan {

	// Constructor
	public DailyDarshan(int dailyDarshanId, String dailyDarshanTitle, String dailyDarshanSubtitle,
			String dailyDarshanDescription, String dailyDarshanDate, String dailyDarshanDay, String status,
			int createdBy, String createdDate, String ipAddress) {

		this.dailyDarshanId = dailyDarshanId;
		this.dailyDarshanTitle = dailyDarshanTitle;
		this.dailyDarshanSubtitle = dailyDarshanSubtitle;
		this.dailyDarshanDescription = dailyDarshanDescription;
		this.dailyDarshanDate = dailyDarshanDate;
		this.dailyDarshanDay = dailyDarshanDay;
		this.status = status;
		this.createdBy = createdBy;
		this.createdDate = createdDate;
		this.ipAddress = ipAddress;
	}

	// Properties
	private int dailyDarshanId;
	private String dailyDarshanTitle;
	private String dailyDarshanSubtitle;
	private String dailyDarshanDescription;
	private String dailyDarshanDate;
	private String dailyDarshanDay;
	private String status;
	private int createdBy;
	private String createdDate;
	private String ipAddress;

	private List<DailyDarshanImages> dailyDarshanImages;

	public List<DailyDarshanImages> getDailyDarshanImages() {
		return dailyDarshanImages;
	}

	public void setDailyDarshanImages(List<DailyDarshanImages> dailyDarshanImages) {
		this.dailyDarshanImages = dailyDarshanImages;
	}

	public int getDailyDarshanId() {
		return dailyDarshanId;
	}

	public String getDailyDarshanTitle() {
		return dailyDarshanTitle;
	}

	public String getDailyDarshanSubtitle() {
		return dailyDarshanSubtitle;
	}

	public String getDailyDarshanDescription() {
		return dailyDarshanDescription;
	}

	public String getDailyDarshanDate() {
		return dailyDarshanDate;
	}

	public String getDailyDarshanDay() {
		return dailyDarshanDay;
	}

	public String getStatus() {
		return status;
	}

	public int getCreatedBy() {
		return createdBy;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public String getIpAddress() {
		return ipAddress;
	}

	public void setDailyDarshanId(int dailyDarshanId) {
		this.dailyDarshanId = dailyDarshanId;
	}

	public void setDailyDarshanTitle(String dailyDarshanTitle) {
		this.dailyDarshanTitle = dailyDarshanTitle;
	}

	public void setDailyDarshanSubtitle(String dailyDarshanSubtitle) {
		this.dailyDarshanSubtitle = dailyDarshanSubtitle;
	}

	public void setDailyDarshanDescription(String dailyDarshanDescription) {
		this.dailyDarshanDescription = dailyDarshanDescription;
	}

	public void setDailyDarshanDate(String dailyDarshanDate) {
		this.dailyDarshanDate = dailyDarshanDate;
	}

	public void setDailyDarshanDay(String dailyDarshanDay) {
		this.dailyDarshanDay = dailyDarshanDay;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

}
