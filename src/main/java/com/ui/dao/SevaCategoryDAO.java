package com.ui.dao;

import java.util.List;

import com.ui.model.SevaCategory;

public interface SevaCategoryDAO {

	SevaCategory addSevaCategory(SevaCategory sevaCategory);

	void updateSevaCategory(SevaCategory sevaCategory);

	boolean deleteSevaCategory(int sevaCategoryId);

	SevaCategory getSevaCategoryById(int sevaCategoryId);

	List<SevaCategory> getAllActiveSevaCategories();

	List<SevaCategory> getAllSevaCategories();

}
