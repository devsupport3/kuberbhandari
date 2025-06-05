package com.ui.dao;

import java.util.List;

import com.ui.model.DailyDarshan;

public interface DailyDarshanDAO {

	DailyDarshan addDailyDarshan(DailyDarshan dailyDarshan);

	void updateDailyDarshan(DailyDarshan dailyDarshan);

	boolean deleteDailyDarshan(int dailyDarshanId);

	DailyDarshan getDailyDarshanById(int dailyDarshanId);

	List<DailyDarshan> getAllDailyDarshan();

	List<DailyDarshan> getAllActiveDailyDarshan(boolean filterToday);
}
