package edu.spring.ex02.service;

import java.util.List;

import edu.spring.ex02.domain.Board;
import edu.spring.ex02.domain.Reply;

public interface ReplyService {
	
	List<Reply> select();
	List<Reply> select(int bno);
	Reply reSelect(int rno);
	int insert(Reply r);
	int update(Reply r);
	int delete(int rno);
	int update(Board b);
}


