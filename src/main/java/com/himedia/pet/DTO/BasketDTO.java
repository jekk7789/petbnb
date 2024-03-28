package com.himedia.pet.DTO;

import lombok.Data;

@Data
public class BasketDTO {
	int id;
	int userid;
	int orderid;
	String title;
	int price;
	int amount;
	int count;
	String img;
	String created;
	
}
