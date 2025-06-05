package com.ui.dao;

import java.util.List;

import com.ui.model.Festival;

public interface FestivalDAO {

	Festival addFestival(Festival festival);

	void updateFestival(Festival festival);

	boolean deleteFestival(int festivalId);

	Festival getFestivalById(int festivalId);

	List<Festival> getAllFestivals();

	List<Festival> getAllActiveFestivals();

}
