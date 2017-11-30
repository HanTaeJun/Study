package edu.spring.ex02.persistence;

import java.util.List;

import edu.spring.ex02.domain.Member;



public interface MemberDao {	
	
	public abstract/*추상 (생략가능)*/ int insert (Member m);
	public abstract Member login (Member m);
	public abstract List<String> search (String email);
	public abstract String search (Member m);
	public abstract int update (Member m);
	public abstract int delete (Member m);
	public abstract List<Member> select ();
	public abstract Member check (String mid);
}
