package com.ui.dao;

import java.util.List;

import com.ui.model.HinduMonth;

public interface HinduMonthDAO {

	HinduMonth addHinduMonth(HinduMonth hinduMonth);

	void updateHinduMonth(HinduMonth hinduMonth);

	boolean deleteHinduMonth(int hinduMonthId);

	HinduMonth getHinduMonthById(int hinduMonthId);

	List<HinduMonth> getAllHinduMonth();

	List<HinduMonth> getAllActiveHinduMonth();

}
