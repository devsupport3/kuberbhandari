package com.ui.model;

import java.util.List;

public class Gallery {

	// Constructor
	public Gallery(int albumId, String albumTitle, String albumSubtitle, String albumDate, String description,
			String status, int createdBy, String createdDate, String ipAddress) {

		this.albumId = albumId;
		this.albumTitle = albumTitle;
		this.albumSubtitle = albumSubtitle;
		this.albumDate = albumDate;
		this.description = description;
		this.status = status;
		this.createdBy = createdBy;
		this.createdDate = createdDate;
		this.ipAddress = ipAddress;
	}

	// Properties
	private int albumId;
	private String albumTitle;
	private String albumSubtitle;
	private String albumDate;
	private String description;
	private String status;
	private int createdBy;
	private String createdDate;
	private String ipAddress;

	private List<GalleryImages> galleryImages;

	public int getAlbumId() {
		return albumId;
	}

	public void setAlbumId(int albumId) {
		this.albumId = albumId;
	}

	public String getAlbumTitle() {
		return albumTitle;
	}

	public void setAlbumTitle(String albumTitle) {
		this.albumTitle = albumTitle;
	}

	public String getAlbumSubtitle() {
		return albumSubtitle;
	}

	public void setAlbumSubtitle(String albumSubtitle) {
		this.albumSubtitle = albumSubtitle;
	}

	public String getAlbumDate() {
		return albumDate;
	}

	public void setAlbumDate(String albumDate) {
		this.albumDate = albumDate;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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

	public List<GalleryImages> getGalleryImages() {
		return galleryImages;
	}

	public void setGalleryImages(List<GalleryImages> galleryImages) {
		this.galleryImages = galleryImages;
	}
}
