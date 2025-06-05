package com.ui.dao;

import java.util.List;

import com.ui.model.DailyDarshanImages;

public interface DailyDarshanImagesDAO {

	void addDailyDarshanImage(DailyDarshanImages dailyDarshanImages);

	void updateDailyDarshanImage(DailyDarshanImages dailyDarshanImages);

	boolean deleteDailyDarshanImage(int dailyDarshanImageId);

	List<DailyDarshanImages> getAllDailyDarshanImages();

	DailyDarshanImages getDailyDarshanImageById(int dailyDarshanImageId);

	List<DailyDarshanImages> getAllActiveDailyDarshanImages();

	List<DailyDarshanImages> getAllDailyDarshanImagesByDailyDarshanId(int dailyDarshanId);

	boolean deleteDailyDarshanImages(int dailyDarshanId);

}
