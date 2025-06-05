package com.ui.dao;

import java.util.List;

import com.ui.model.SevaImages;

public interface SevaImagesDAO {

	void addSevaImage(SevaImages sevaImages);

	void editSevaImage(SevaImages sevaImages);

	boolean deleteSevaImage(int sevaImageId);

	SevaImages getSevaImageById(int sevaImageId);

	List<SevaImages> getAllActiveSevaImages();

	List<SevaImages> getAllSevaImagesBySevaId(int sevaId);

	List<SevaImages> getAllSevaImages();

}
