package com.himedia.pet.DAO;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.himedia.pet.DTO.calendarDTO;

@Mapper
public interface calendarDAO {
   int addCalendar(String userName, String title, String start,
               String end, String backgroundColor);
   ArrayList<calendarDTO> selectCal(String userName);
}
