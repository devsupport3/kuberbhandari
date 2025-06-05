package com.ui.dao;

import java.util.List;

import com.ui.model.HinduPaksh;

public interface HinduPakshDAO {

	HinduPaksh addHinduPaksh(HinduPaksh hinduPaksh);

	void updateHinduPaksh(HinduPaksh hinduPaksh);

	boolean deleteHinduPaksh(int hinduPakshId);

	HinduPaksh getHinduPakshById(int hinduPakshId);

	List<HinduPaksh> getAllHinduPaksh();

	List<HinduPaksh> getAllActiveHinduPaksh();

}
