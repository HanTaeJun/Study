package edu.spring.ex02.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.ex02.domain.Board;
import edu.spring.ex02.domain.Reply;
import edu.spring.ex02.persistence.ReplyDao;

@Service
public class ReplyServiceImple implements ReplyService {

	@Autowired ReplyDao replyDao;
	
	@Override
	public List<Reply> select() {
		return replyDao.read();
	}

	@Override
	public int insert(Reply r) {
		// TODO: 댓글 입력이 성공하면 게시글 테이블의 댓글 갯수를 업데이트
		return replyDao.create(r);
	}

	@Override
	public int update(Reply r) {
		return replyDao.update(r);
	}

	@Override
	public int delete(int rno) {
		// TODO: 댓글 삭제 후 Board 테이블의 댓글 갯수도 수정
		return replyDao.delete(rno);
	}

	@Override
	public List<Reply> select(int bno) {
		return replyDao.read(bno);
	}

	@Override
	public Reply reSelect(int rno) {
		return replyDao.reRead(rno);
	}

	@Override
	public int update(Board b) {
		return replyDao.update(b);
	}

} // end class ReplyServiceImple


