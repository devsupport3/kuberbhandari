package com.ui.dao;

import java.util.List;

import com.ui.model.EventsImages;

public interface EventsImagesDAO {

	void addEventImage(EventsImages eventImage);

	void updateEventImage(EventsImages eventImage);

	boolean deleteEventImage(int eventImageId);

	List<EventsImages> getAllEventImages();

	List<EventsImages> getAllEventImagesByEventId(int eventId);

	EventsImages getEventImageById(int eventImageId);

	List<EventsImages> getAllActiveEventImages();

}
