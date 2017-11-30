package edu.spring.ex02.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.ex02.domain.Member;

@Repository
public class MemberDaoImple implements MemberDao {
	
	static final String NAMESPACE = "edu.spring.ex02.MemberMapper";
	
	@Autowired
	private SqlSession session;
	
	@Override
	public int insert(Member m) {
		return session.insert(NAMESPACE+".insert",m);
	}

	@Override
	public Member login(Member m) {
		return session.selectOne(NAMESPACE+".login", m);
	}

	@Override
	public List<String> search(String email) {
		return session.selectList(NAMESPACE+".searchId", email);
	}

	@Override
	public String search(Member m) {
		return session.selectOne(NAMESPACE+".searchPw",m);
	}

	@Override
	public int update(Member m) {
		return session.update(NAMESPACE+".update", m);
	}

	@Override
	public int delete(Member m) {
		return session.delete(NAMESPACE+".delete", m);
	}

	@Override
	public List<Member> select() {
		return session.selectList(NAMESPACE+".selectAll");
	}

	@Override
	public Member check(String mid) {
		return session.selectOne(NAMESPACE+".idCheck",mid);
	}

}
