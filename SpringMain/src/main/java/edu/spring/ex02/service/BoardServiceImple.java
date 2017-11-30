package edu.spring.ex02.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.ex02.domain.Board;
import edu.spring.ex02.domain.Member;
import edu.spring.ex02.pageutil.PaginationCriteria;
import edu.spring.ex02.persistence.BoardDao;

// @Service: 스프링 프레임워크에게 Business(Service) 계층 콤포넌트임을
// 설정하는 어노테이션
// root-context.xml에서 bean으로 등록해야 함
@Service
public class BoardServiceImple implements BoardService {
	@Autowired
	private BoardDao boardDao;
	
	@Override
	public List<Board> select() {
		return boardDao.read();
	}

	@Override
	public Board select(int bno) {
		return boardDao.read(bno);
	}

	@Override
	public List<Board> select(String title) {
		return boardDao.read(title);
	}

	@Override
	public List<Board> select(String title, String content) {
		return boardDao.read(title, content);
	}

	@Override
	public int insert(Board b) {
		return boardDao.create(b);
	}

	@Override
	public int update(Board b) {
		return boardDao.update(b);
	}

	@Override
	public int delete(int bno) {
		return boardDao.delete(bno);
	}

	@Override
	public List<Board> select_id(String userid) {
		return boardDao.read_id(userid);
	}

	@Override
	public List<Board> select(Map<String, Integer> args) {
		return boardDao.read(args);
	}

	@Override
	public int getTotalCount() {
		return boardDao.getTotalCount();
	}

	@Override
	public List<Board> select(PaginationCriteria c) {
		return boardDao.read(c);
	}

	@Override
	public List<Board> select_id(PaginationCriteria c) {
		return boardDao.read_id(c);
	}

	@Override
	public int getSearchCountId(String searchWord) {
		return boardDao.getSearchCountId(searchWord);
	}

	@Override
	public List<Board> select_title(PaginationCriteria c) {
		return boardDao.read_title(c);
	}

	@Override
	public List<Board> select_title_content(PaginationCriteria c) {
		return boardDao.read_title_content(c);
	}

	@Override
	public int getSearchCountTitle(String searchWord) {
		return boardDao.getSearchCountTitle(searchWord);
	}

	@Override
	public int getSearchCountTitleContent(String searchWord) {
		return boardDao.getSearchCountTitleContent(searchWord);
	}



}
