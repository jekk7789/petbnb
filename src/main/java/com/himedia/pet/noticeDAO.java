package com.himedia.pet;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface noticeDAO {
	ArrayList<noticeDTO> notice(int page); 
	noticeDTO textView(int id);
	
	// 공지사항 추가 & 업데이트
	int modify(int id, String title, String writer, String ori_file_name, String detail);
	int addNotice(String title, String writer, String ori_file_name, String detail, int views, String created_at);
	
	//공지사항 상세 리스트 보이기
	noticeDTO noticeList(int n);
	
	//공지사항 삭제
	int remove(int id);
	
	//조회수
	int updateViews(int id);
	
	//페이징
	int total();
}
