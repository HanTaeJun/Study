package edu.spring.ex02.persistence;

import java.util.List;
import java.util.Map;

import edu.spring.ex02.domain.Board;
import edu.spring.ex02.pageutil.PaginationCriteria;

public interface BoardDao {
	
	List<Board> read();
	Board read(int bno);
	List<Board> read(String title);
	List<Board> read_id(String userid);
	List<Board> read(String title, String content);
	int create(Board b);
	int delete(int bno);
	int update(Board b);
	List<Board> read(Map<String, Integer> args);
	List<Board> read(PaginationCriteria c);
	List<Board> read_id(PaginationCriteria c);
	List<Board> read_title (PaginationCriteria c);
	List<Board> read_title_content (PaginationCriteria c);
	int getTotalCount();
	int getSearchCountId(String searchWord);
	int getSearchCountTitle(String searchWord);
	int getSearchCountTitleContent (String searchWord);
}
