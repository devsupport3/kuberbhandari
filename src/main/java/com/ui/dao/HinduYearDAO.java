package com.ui.dao;

import java.util.List;

import com.ui.model.HinduYear;

public interface HinduYearDAO {

	HinduYear addHinduYear(HinduYear hinduYear);

	void updateHinduYear(HinduYear hinduYear);

	boolean deleteHinduYear(int hinduYearId);

	HinduYear getHinduYearById(int hinduYearId);

	List<HinduYear> getAllHinduYear();

	List<HinduYear> getAllActiveHinduYear();

}
