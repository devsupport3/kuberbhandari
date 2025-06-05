package com.ui.dao;

import java.util.List;

import com.ui.model.Gallery;

public interface GalleryDAO {

	Gallery addGallery(Gallery gallery);

	void updateGallery(Gallery gallery);

	boolean deleteGallery(int albumId);

	List<Gallery> getAllGallery();

	Gallery getGalleryById(int albumId);

	List<Gallery> getAllActiveGallery();

}
