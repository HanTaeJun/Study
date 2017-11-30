package edu.spring.ex02.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import edu.spring.ex02.domain.Board;
import edu.spring.ex02.domain.Reply;

public interface ReplyMapper {
	final String table = "JUN_REPLY";
	final String bno = "bno";
	final String rtext = "rtext";
	final String replier ="replier";
	final String regdate  = "regdate";
	
	String SQL_INSERT =
			"INSERT INTO "+table+" ("+bno+", "+rtext+", "+replier+", "+regdate+")"
			+ " VALUES (#{bno}, #{rtext}, #{replier}, sysdate)";
	String SQL_UPDATE =
			"UPDATE "+table
			+ " SET rtext = #{rtext}, regdate = sysdate"
			+ " WHERE rno = #{rno}";
	String SQL_SELECT_BY_BNO = 
			"SELECT * FROM "+ table
			+ " WHERE bno = #{bno}"
			+ " ORDER BY rno DESC";
	
	String SQL_SELECT_BY_RERE = "select * from "+table
			+ " where rno = #{rno}";
	
	String SQL_UPDATE_REPLYCNT = 
			"update JUN_BOARD"
			+ " set replycnt = #{replycnt} where bno = #{bno}";
	
	@Select(SQL_SELECT_BY_BNO)
	List<Reply> read(int bno);
	// 어노테이션과 인터페이스를 사용할 때 
	// xml 파일의 id와 겹치는 이름의 메소드를 사용할 수는 없다!
	
	
	@Select(SQL_SELECT_BY_RERE)
	Reply reRead(int rno);
	
	@Insert(SQL_INSERT)
	int insert(Reply r);
	
	@Update(SQL_UPDATE)
	int update(Reply r);
	
	@Update(SQL_UPDATE_REPLYCNT)
	int updateCNT(Board b);
	
	// Mapper 인터페이스 메소드의 이름을 
	// Mapper xml 파일의 SQL 문의 id와 동일하게만 만들어 주면
	// xml 파일에 정의된 SQL문을 사용하는 메소드가 됨
	// edu.spring.ex03.mappers.ReplyMapper.delete
	int delete(int rno);
	
} // end interface ReplyMapper




