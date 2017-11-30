package edu.spring.ex02.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.ex02.domain.Board;
import edu.spring.ex02.pageutil.PaginationCriteria;
//@Repository: 스프링 프레임워크에게 DB를 사용하는 
//영속성(persistence) 계층의 콤포넌트임을 등록하는 어노테이션
//root-context.xml 파일에서 bean으로 등록을 해야 함(context:component-scan)
@Repository
public class BoardDaoImple implements BoardDao {

	static final String NAMESPACE = "edu.spring.ex02.BoardMapper";
	
	@Autowired //의존성 주입(DI)
	private SqlSession session;
	
	@Override
	public List<Board> read() {
		return session.selectList(NAMESPACE+".selectAll");
	}

	@Override
	public Board read(int bno) {
		return session.selectOne(NAMESPACE + ".selectByBno", bno);
	}

	@Override
	public List<Board> read(String title) {
		String arg = "%" + title + "%";
		Board b = new Board();
		b.setTitle(arg);
		return session.selectList(NAMESPACE+".selectByTitle", b);
	}

	@Override
	public List<Board> read_id(String userid) {
		String arg = "%" + userid + "%";
		Board b = new Board();
		b.setUserid(arg);
		return session.selectList(NAMESPACE+".selectByUserid", b);
	}

	@Override
	public List<Board> read(String title, String content) {
		String arg = "%" + title + "%";
		String arg2 = "%" + content + "%";
		Board b = new Board();
		b.setTitle(arg);
		b.setContent(arg2);
		return session.selectList(NAMESPACE+".selectByTitleAndContent", b);
	}

	@Override
	public int create(Board b) {
		return session.insert(NAMESPACE+".insert", b);
	}

	@Override
	public int delete(int bno) {
		Board b = new Board();
		b.setBno(bno);
		return session.delete(NAMESPACE+".delete", b);
	}

	@Override
	public int update(Board b) {
		return session.update(NAMESPACE+".update", b);
	}

	@Override
	public List<Board> read(Map<String, Integer> args) {
		return session.selectList(NAMESPACE + ".selectPage", args);
	}

	@Override
	public int getTotalCount() {
		return session.selectOne(NAMESPACE+".totalCount");
	}

	@Override
	public List<Board> read(PaginationCriteria c) {
		return session.selectList(NAMESPACE + ".selectPage", c);
	}

	@Override
	public List<Board> read_id(PaginationCriteria c) {
		String s = c.getsearchWord();
		c.setsearchWord("%"+s+"%");
		return session.selectList(NAMESPACE+".searchWord", c);
	}

	@Override
	public int getSearchCountId(String searchWord) {
		return session.selectOne(NAMESPACE+".searchCount", "%"+searchWord+"%");
	}

	@Override
	public List<Board> read_title(PaginationCriteria c) {
		String s = c.getsearchWord();
		c.setsearchWord("%"+s+"%");
		return session.selectList(NAMESPACE+".searchWord2", c);
	}

	@Override
	public List<Board> read_title_content(PaginationCriteria c) {
		String s = c.getsearchWord();
		c.setsearchWord("%"+s+"%");
		return session.selectList(NAMESPACE+".searchWord3", c);
	}

	@Override
	public int getSearchCountTitle(String searchWord) {
		return session.selectOne(NAMESPACE+".searchCount2", "%"+searchWord+"%");
	}

	@Override
	public int getSearchCountTitleContent(String searchWord) {
		return session.selectOne(NAMESPACE+".searchCount3", "%"+searchWord+"%");
	}






}
