package com.ui.model;

import java.util.List;

public class Seva {

	// Constructor
	public Seva(int sevaId, int sequence, String sevaTitle, String sevaSubtitle, int sevaTypeId, int sevaCategoryId,
			int variationId, int frequencyId, String bookBeforeDays, String sevaDescription, double sevaPrice,
			String delivery, String status, int createdBy, String createdDate, String ipAddress, String variationName,
			String frequencyName) {
		this.sevaId = sevaId;
		this.sequence = sequence;
		this.sevaTitle = sevaTitle;
		this.sevaSubtitle = sevaSubtitle;
		this.sevaTypeId = sevaTypeId;
		this.sevaCategoryId = sevaCategoryId;
		this.variationId = variationId;
		this.frequencyId = frequencyId;
		this.bookBeforeDays = bookBeforeDays;
		this.sevaDescription = sevaDescription;
		this.sevaPrice = sevaPrice;
		this.delivery = delivery;
		this.status = status;
		this.createdBy = createdBy;
		this.createdDate = createdDate;
		this.ipAddress = ipAddress;
		this.variationName = variationName;
		this.frequencyName = frequencyName;
	}

	// Properties
	private int sevaId;
	private int sequence;
	private String sevaTitle;
	private String sevaSubtitle;
	private int sevaTypeId;
	private int sevaCategoryId;
	private int variationId;
	private int frequencyId;
	private String bookBeforeDays;
	private String sevaDescription;
	private double sevaPrice;
	private String delivery;
	private String status;
	private int createdBy;
	private String createdDate;
	private String ipAddress;
	private String variationName;
	private String frequencyName;

	private List<SevaImages> sevaImages;

	public List<SevaImages> getSevaImages() {
		return sevaImages;
	}

	public void setSevaImages(List<SevaImages> sevaImages) {
		this.sevaImages = sevaImages;
	}

	public int getSevaId() {
		return sevaId;
	}

	public void setSevaId(int sevaId) {
		this.sevaId = sevaId;
	}

	public int getSequence() {
		return sequence;
	}

	public void setSequence(int sequence) {
		this.sequence = sequence;
	}

	public String getSevaTitle() {
		return sevaTitle;
	}

	public void setSevaTitle(String sevaTitle) {
		this.sevaTitle = sevaTitle;
	}

	public String getSevaSubtitle() {
		return sevaSubtitle;
	}

	public void setSevaSubtitle(String sevaSubtitle) {
		this.sevaSubtitle = sevaSubtitle;
	}

	public int getSevaTypeId() {
		return sevaTypeId;
	}

	public void setSevaTypeId(int sevaTypeId) {
		this.sevaTypeId = sevaTypeId;
	}

	public int getSevaCategoryId() {
		return sevaCategoryId;
	}

	public void setSevaCategoryId(int sevaCategoryId) {
		this.sevaCategoryId = sevaCategoryId;
	}

	public int getVariationId() {
		return variationId;
	}

	public void setVariationId(int variationId) {
		this.variationId = variationId;
	}

	public int getFrequencyId() {
		return frequencyId;
	}

	public void setFrequencyId(int frequencyId) {
		this.frequencyId = frequencyId;
	}

	public String getBookBeforeDays() {
		return bookBeforeDays;
	}

	public void setBookBeforeDays(String bookBeforeDays) {
		this.bookBeforeDays = bookBeforeDays;
	}

	public String getSevaDescription() {
		return sevaDescription;
	}

	public void setSevaDescription(String sevaDescription) {
		this.sevaDescription = sevaDescription;
	}

	public double getSevaPrice() {
		return sevaPrice;
	}

	public void setSevaPrice(double sevaPrice) {
		this.sevaPrice = sevaPrice;
	}

	public String getDelivery() {
		return delivery;
	}

	public void setDelivery(String delivery) {
		this.delivery = delivery;
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

	public String getVariationName() {
		return variationName;
	}

	public String getFrequencyName() {
		return frequencyName;
	}

	public void setVariationName(String variationName) {
		this.variationName = variationName;
	}

	public void setFrequencyName(String frequencyName) {
		this.frequencyName = frequencyName;
	}
}
