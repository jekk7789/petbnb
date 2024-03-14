package com.himedia.pet.DTO;

import lombok.Data;

@Data
public class noticeDTO {
	int id;
	String title;
	String writer;
	String detail;
	String image;
	String created_at;
	int views;
}

