package com.himedia.pet;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginDAO {
    int log(String email, String password);
    
    int saveKakao(String email, String KakaoId);
    int saveNaver(String email, String naverId);
    int saveGoogle(String email, String googleId);

    int savelog(String email, String password);
    
    boolean nemailExists(String email, String naverId);
    boolean kemailExists(String email, String kakaoId);
    boolean gemailExists(String email, String googleId);
    
    int getuserid(String email);
    int adLogin(String email);
    ArrayList<LoginDTO> updateMyList(int id);
}

