package com.ui.dao;

import java.util.List;

import com.ui.model.HinduMonthType;

public interface HinduMonthTypeDAO {

	HinduMonthType addHinduMonthType(HinduMonthType hinduMonthType);

	void updateHinduMonthType(HinduMonthType hinduMonthType);

	boolean deleteHinduMonthType(int hinduMonthTypeId);

	HinduMonthType getHinduMonthTypeById(int hinduMonthTypeId);

	List<HinduMonthType> getAllHinduMonthType();

	List<HinduMonthType> getAllActiveHinduMonthType();

}
