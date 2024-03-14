package com.himedia.pet;
import lombok.Data;

@Data
public class LoginDTO {
	int id;
	String email;
	String password;
	String kakaoId;
	String naverId;
	String googleId;
}

