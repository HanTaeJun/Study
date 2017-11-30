package edu.spring.ex02.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.ex02.domain.Member;
import edu.spring.ex02.persistence.MemberDao;


@Service
public class MemberServiceImple implements MemberService {

	@Autowired
	private MemberDao dao;
	
	@Override
	public int insert(Member m) {
		return dao.insert(m);
	}

	@Override
	public Member login(Member m) {
		return dao.login(m);
	}

	@Override
	public List<String> search(String email) {
		return dao.search(email);
	}

	@Override
	public String search(Member m) {
		return dao.search(m);
	}

	@Override
	public int update(Member m) {
		return dao.update(m);
	}

	@Override
	public int delete(Member m) {
		return dao.delete(m);
	}

	@Override
	public List<Member> select() {
		return dao.select();
	}

	@Override
	public Member check(String mid) {
		return dao.check(mid);
	}

}
