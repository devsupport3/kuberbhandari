package com.ui.dao;

import java.util.List;

import com.ui.model.Events;

public interface EventsDAO {

	Events addEvent(Events event);

	void updateEvent(Events event);

	boolean deleteEvent(int eventId);

	List<Events> getAllEvents();

	Events getEventById(int eventId);

	List<Events> getAllActiveEvents();
}
