package com.ui.dao;

import java.util.List;

import com.ui.model.GalleryImages;

public interface GalleryImagesDAO {

	void addGalleryImage(GalleryImages galleryImages);

	void updateGalleryImage(GalleryImages galleryImages);

	boolean deleteGalleryImage(int galleryImageId);

	List<GalleryImages> getAllGalleryImagesByGalleryId(int galleryId);

	List<GalleryImages> getAllGalleryImagesByAlbumId(int albumId);

	void deleteGalleryImagesByAlbumId(int albumId);

}
