package com.ui.model;

public class GalleryImages {

	// Constructor
	public GalleryImages(int albumImageId, int albumId, String imageTitle, String imageDescription, String image,
			String status, int createdBy, String createdDate, String ipAddress) {

		this.albumImageId = albumImageId;
		this.albumId = albumId;
		this.imageTitle = imageTitle;
		this.imageDescription = imageDescription;
		this.image = image;
		this.status = status;
		this.createdBy = createdBy;
		this.createdDate = createdDate;
		this.ipAddress = ipAddress;
	}

	// Properties
	private int albumImageId;
	private int albumId;
	private String imageTitle;
	private String imageDescription;
	private String image;
	private String status;
	private int createdBy;
	private String createdDate;
	private String ipAddress;

	// Getters
	public int getAlbumImageId() {
		return albumImageId;
	}

	public int getAlbumId() {
		return albumId;
	}

	public String getImageTitle() {
		return imageTitle;
	}

	public String getImageDescription() {
		return imageDescription;
	}

	public String getImage() {
		return image;
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

	// Setters
	public void setAlbumImageId(int albumImageId) {
		this.albumImageId = albumImageId;
	}

	public void setAlbumId(int albumId) {
		this.albumId = albumId;
	}

	public void setImageTitle(String imageTitle) {
		this.imageTitle = imageTitle;
	}

	public void setImageDescription(String imageDescription) {
		this.imageDescription = imageDescription;
	}

	public void setImage(String image) {
		this.image = image;
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
