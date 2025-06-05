package com.ui.model;

public class OrderSevaDetails {

	private int orderSevaDetailsId;
	private int orderSevaId;
	private String orderSevaTitle;
	private String orderSevaDescription;
	private double orderSevaPrice;
	private int orderSevaQuantity;
	private String orderSevaImages;
	private int userId;
	private String orderNumber;
	private int orderVariationId;
	private int orderFrequencyId;
	private String bookingDate;
	private String variationName;
	private String frequencyName;
	private String orderDelivery;

	// Parameterized Constructor
	public OrderSevaDetails(int orderSevaDetailsId, int orderSevaId, String orderSevaTitle, String orderSevaDescription,
			double orderSevaPrice, int orderSevaQuantity, String orderSevaImages, int userId, String orderNumber,
			int orderVariationId, int orderFrequencyId, String bookingDate, String variationName, String frequencyName,
			String orderDelivery) {
		this.orderSevaDetailsId = orderSevaDetailsId;
		this.orderSevaId = orderSevaId;
		this.orderSevaTitle = orderSevaTitle;
		this.orderSevaDescription = orderSevaDescription;
		this.orderSevaPrice = orderSevaPrice;
		this.orderSevaQuantity = orderSevaQuantity;
		this.orderSevaImages = orderSevaImages;
		this.userId = userId;
		this.orderNumber = orderNumber;
		this.orderVariationId = orderVariationId;
		this.orderFrequencyId = orderFrequencyId;
		this.bookingDate = bookingDate;
		this.variationName = variationName;
		this.frequencyName = frequencyName;
		this.orderDelivery = orderDelivery;
	}

	public OrderSevaDetails() {
		// TODO Auto-generated constructor stub
	}

	public int getOrderSevaDetailsId() {
		return orderSevaDetailsId;
	}

	public int getOrderSevaId() {
		return orderSevaId;
	}

	public String getOrderSevaTitle() {
		return orderSevaTitle;
	}

	public String getOrderSevaDescription() {
		return orderSevaDescription;
	}

	public double getOrderSevaPrice() {
		return orderSevaPrice;
	}

	public int getOrderSevaQuantity() {
		return orderSevaQuantity;
	}

	public String getOrderSevaImages() {
		return orderSevaImages;
	}

	public int getUserId() {
		return userId;
	}

	public String getOrderNumber() {
		return orderNumber;
	}

	public int getOrderVariationId() {
		return orderVariationId;
	}

	public int getOrderFrequencyId() {
		return orderFrequencyId;
	}

	public void setOrderSevaDetailsId(int orderSevaDetailsId) {
		this.orderSevaDetailsId = orderSevaDetailsId;
	}

	public void setOrderSevaId(int orderSevaId) {
		this.orderSevaId = orderSevaId;
	}

	public void setOrderSevaTitle(String orderSevaTitle) {
		this.orderSevaTitle = orderSevaTitle;
	}

	public void setOrderSevaDescription(String orderSevaDescription) {
		this.orderSevaDescription = orderSevaDescription;
	}

	public void setOrderSevaPrice(double orderSevaPrice) {
		this.orderSevaPrice = orderSevaPrice;
	}

	public void setOrderSevaQuantity(int orderSevaQuantity) {
		this.orderSevaQuantity = orderSevaQuantity;
	}

	public void setOrderSevaImages(String orderSevaImages) {
		this.orderSevaImages = orderSevaImages;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}

	public void setOrderVariationId(int orderVariationId) {
		this.orderVariationId = orderVariationId;
	}

	public void setOrderFrequencyId(int orderFrequencyId) {
		this.orderFrequencyId = orderFrequencyId;
	}

	public String getBookingDate() {
		return bookingDate;
	}

	public void setBookingDate(String bookingDate) {
		this.bookingDate = bookingDate;
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

	public String getOrderDelivery() {
		return orderDelivery;
	}

	public void setOrderDelivery(String orderDelivery) {
		this.orderDelivery = orderDelivery;
	}

}
