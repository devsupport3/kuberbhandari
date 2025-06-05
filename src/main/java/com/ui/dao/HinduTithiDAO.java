package com.ui.dao;

import java.util.List;

import com.ui.model.HinduTithi;

public interface HinduTithiDAO {

	HinduTithi addHinduTithi(HinduTithi hinduTithi);

	void updateHinduTithi(HinduTithi hinduTithi);

	boolean deleteHinduTithi(int hinduTithiId);

	HinduTithi getHinduTithiById(int hinduTithiId);

	List<HinduTithi> getAllHinduTithi();

	List<HinduTithi> getAllActiveHinduTithi();

}
