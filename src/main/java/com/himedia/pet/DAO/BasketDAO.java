package com.himedia.pet.DAO;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.himedia.pet.DTO.BasketDTO;


@Mapper
public interface BasketDAO {
	ArrayList<BasketDTO> basketList();
	ArrayList<BasketDTO> userbasketList(String userid);
	
	int basketadd(int orderid, int id, String title, int price,
			int amount, int count, String img);
	
}
