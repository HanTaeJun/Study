package edu.spring.ex02.service;

import java.util.List;

import edu.spring.ex02.domain.Member;


public interface MemberService {
	
	public abstract int insert(Member m);
	public abstract Member login(Member m);
	public abstract List<String> search (String email);
	public abstract String search (Member m);
	public abstract int update (Member m);
	public abstract int delete (Member m);
	public abstract List<Member> select ();
	public abstract Member check (String mid);
	
}
