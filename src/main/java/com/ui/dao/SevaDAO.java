package com.ui.dao;

import java.util.List;

import com.ui.model.Seva;

public interface SevaDAO {

	Seva addSeva(Seva seva);

	boolean deleteSeva(int sevaId);

	void updateSeva(Seva seva);

	Seva getSevaById(int sevaId);

	List<Seva> getAllActiveSeva();

	List<Seva> getAllSeva();

}
