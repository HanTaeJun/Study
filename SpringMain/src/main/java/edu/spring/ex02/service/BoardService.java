package edu.spring.ex02.service;

import java.util.List;
import java.util.Map;

import edu.spring.ex02.domain.Board;
import edu.spring.ex02.domain.Member;
import edu.spring.ex02.pageutil.PaginationCriteria;

public interface BoardService {
	
	List<Board> select(); // 전체 검색
	Board select(int bno); // 글번호 검색
	List<Board> select_id(String userid); // 작성자 아이디 검색
	List<Board> select(String title);
	List<Board> select(String title, String content);// 글제목 + 글내용 검색
	int insert(Board b); // 새 글 작성
	int update(Board b); // 글 수정
	int delete(int bno); // 글 삭제
	List<Board> select (Map<String, Integer> args);
	int getTotalCount();
	List<Board> select (PaginationCriteria c);
	List<Board> select_id (PaginationCriteria c);
	List<Board> select_title (PaginationCriteria c);
	List<Board> select_title_content (PaginationCriteria c);
	int getSearchCountId(String searchWord);
	int getSearchCountTitle(String searchWord);
	int getSearchCountTitleContent (String searchWord);
}





