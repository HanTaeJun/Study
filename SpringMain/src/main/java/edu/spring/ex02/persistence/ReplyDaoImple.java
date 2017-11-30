package edu.spring.ex02.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.ex02.domain.Board;
import edu.spring.ex02.domain.Reply;
import edu.spring.ex02.mappers.ReplyMapper;

@Repository
public class ReplyDaoImple implements ReplyDao {

	private static final String NAMESPACE =
			"edu.spring.ex02.mappers.ReplyMapper";
	
	@Autowired private SqlSession session;
	@Autowired private ReplyMapper mapper;
	
	@Override
	public List<Reply> read() {
		return session.selectList(NAMESPACE + ".selectAll");
	}
	
	@Override
	public List<Reply> read(int bno) {
		return mapper.read(bno);
	}

	@Override
	public int create(Reply r) {
		return mapper.insert(r);
	}
	
	@Override
	public int update(Reply r) {
		return mapper.update(r);
	}
	
	@Override
	public int delete(int rno) {
		return mapper.delete(rno);
	}

	@Override
	public Reply reRead(int rno) {
		return mapper.reRead(rno);
	}

	@Override
	public int update(Board b) {
		return mapper.updateCNT(b);
	}
	
} // end class ReplyDaoImple







