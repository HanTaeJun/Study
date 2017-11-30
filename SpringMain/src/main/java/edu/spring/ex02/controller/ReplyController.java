package edu.spring.ex02.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.spring.ex02.domain.Board;
import edu.spring.ex02.domain.Member;
import edu.spring.ex02.domain.Reply;
import edu.spring.ex02.service.BoardService;
import edu.spring.ex02.service.ReplyService;

@Controller
@RequestMapping(value="/replies")
public class ReplyController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	
	@Autowired
	private ReplyService service;
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value = "/reply",
			method = RequestMethod.GET)
	public void reply( /*int bno,*/ Model model) {
		
		int bno = 100;
		model.addAttribute("bno",bno);
	}//end reply
	
	
	
	@RequestMapping(value="/all")
	public String replies (int bno,Model model) {
		List<Reply> list = service.select(bno);
		model.addAttribute("replyList",list);
		return "reply/replies";
	}//end replies
	
	@RequestMapping(value="/update")
	public String update (int rno,Model model,HttpSession session) {
		Member m;
		String html = "reply/update";
		Reply updateReply = service.reSelect(rno);
		model.addAttribute("update",updateReply);
//		logger.info(updateReply.getRtext());
		try {
			m = (Member) session.getAttribute("loginResult");
			if (m!=null) {
				model.addAttribute("member",m);
			} else {
				
			}
		} catch (NullPointerException e) {
			
		}
		session.setAttribute("replierid", updateReply.getReplier());
		return html;
	}//end update
	
	@RequestMapping(value="/update-result")
	public String updateResult (String rtext, int rno, int bno, String userid) {
		logger.info(userid+"|"+rtext+"|"+"RNO : "+rno+ "| BNO : "+bno);
		Reply r = new Reply(rno, bno, rtext, userid, null);
		service.update(r);
		return "redirect:/board/detail?bno="+bno;
	}//end updateResult
	
	@RequestMapping(value="/insert")
	public String insert(int bno,String rtext, String userid) {
		Reply r = new Reply(0, bno, rtext, userid, null);
		Board b = boardService.select(bno);
		int replycnt = b.getReplycnt()+1;
		b.setReplycnt(replycnt);
		service.update(b);
		service.insert(r);
		return "redirect:/board/detail?bno="+bno;
	}//end insert

}





