package com.himedia.pet.DAO;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface calendarDAO {
	int addCalendar(String title, String start,
					String end, String backgroundColor);
}
