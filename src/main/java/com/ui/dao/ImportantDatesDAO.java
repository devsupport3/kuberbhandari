package com.ui.dao;

import java.util.List;

import com.ui.model.ImportantDates;

public interface ImportantDatesDAO {

	ImportantDates addImportantDates(ImportantDates importantDates);

	void updateImportantDates(ImportantDates importantDates);

	boolean deleteImportantDates(int importantDateId);

	ImportantDates getImportantDateById(int importantDateId);

	List<ImportantDates> getAllImportantDates();

	List<ImportantDates> getAllActiveImportantDates();

}
