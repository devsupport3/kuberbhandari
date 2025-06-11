package com.ui.dao;

import java.util.List;

import com.ui.model.SevaType;

public interface SevaTypeDAO {

	List<SevaType> getAllSevaTypes();

	SevaType addSevaType(SevaType sevaType);

	boolean updateSevaType(SevaType sevaType);

	boolean deleteSevaType(int sevaTypeId);

	SevaType getSevaTypeById(int sevaTypeId);

	List<SevaType> getAllActiveSevaTypes();
	boolean softDeleteByIds(List<Integer> ids);


}
