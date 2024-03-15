package com.himedia.pet.DAO;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.himedia.pet.DTO.AnswersDTO;
import com.himedia.pet.DTO.QnaDTO;
import com.himedia.pet.DTO.boardDTO;
import com.himedia.pet.DTO.dataDTO;

@Mapper
public interface dataDAO {
   ArrayList<dataDTO> searchList(String input,int page);
   int searchTotal(String input);
   
//a 행거로 카테고리별 목록 뽑아오기
   ArrayList<dataDTO> getHos(String name,int page);      

   //문화시설 - 카페,문예회관,음식점 3가지 모아서
   ArrayList<dataDTO> getTotal(String name,String name1,String name2,int page);
   
   String hospital(String name);
   
   //카테고리별 페이징만들기 총갯수구하기
   int getHos_cnt(String name);

   int getTotal_cnt(String name,String name1,String name2);
   
   //상세페이지 찾아오기
   ArrayList<dataDTO> getInf(int id);
   //찜하기
   int jjim(int uid,int pid);
   int chekJjim(int uid,int pid);
   int getJjimid(int uid,int pid);
   void delJjim(int jjim_id);
   
   
//상세페이지+리뷰페이징
   dataDTO view(int id);
   int write(int pName, String writer, String content);
   
   ArrayList<boardDTO> reviewLoad(int pName,int start);
   int rDelete(int id);
   int rUpdate(String content, int id);
   boardDTO reLoad(int idDisplay);
   int reviewTotal(int id);
   
	//Qna 게시판
	int QnaWrite(String title,String writer, String content);
	ArrayList<QnaDTO> QnaLoad(int start); 
	int QnaTotal();
	int Qmodify(String title, String content, int id);
	int QDelete(int uniq);
	int comment(int qnaid, String awriter, String comment);
	ArrayList<AnswersDTO> QnAanswer();
	int commentModify(int parseInt, String comment);
	int commentDelete(int parseInt);
}