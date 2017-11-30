package edu.spring.ex02.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import edu.spring.ex02.domain.Member;
import edu.spring.ex02.service.MemberService;


@Controller
@RequestMapping(value="/member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService service;
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	private String memberRegister() {
		return "member/register";
	}//end MemberRegister
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	private String memberRegister(Member m, Model model) {	
			service.insert(m);
		return "member/register-complete";
	}//end MemberRegister
	
	@ResponseBody
	@RequestMapping(value="/test", method=RequestMethod.POST)
	private String idCheck(String mid) {
		String result = "";
		Member m = service.check(mid);
		if(m==null) { //중복없음 생성가능
			result = "<script>"
					+ "$(document).ready(function() {"
					+ "$('#idtbl').removeClass(\"has-error has-feedback\");"
					+ "$('#idtbl').addClass(\"has-success has-feedback\");"
					+ "});"
					+ "</script> ";
		}else { // 중복있음 생성 불가
			result = "<script>"
					+ "$(document).ready(function() {"
					+ "$('#idtbl').removeClass(\"has-success has-feedback\");"
					+ "$('#idtbl').addClass(\"has-error has-feedback\");"
					+ "});"
					+ "</script> ";
		}
			return result;
	}//end idCheck
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	private void memberLogin(String fail, Model model) {
		model.addAttribute("fail",fail);
	}//end memberLogin
	
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	private String memberLogin(Member m, HttpSession session) {
//		logger.info(m.getMid());
		Member result = service.login(m);
		String html = "";
		if (result!=null) { //로그인 성공
			session.setAttribute("loginResult", result);
			html = "redirect:/board/list";
		}else { //로그인 실패
			html = "member/login";
		}
		return html;
	}//end memberLogin
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	private String memberLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/board/list";
	}//end memberLogout
	
	@RequestMapping(value="/info", method=RequestMethod.GET)
	private void memberInfo(HttpSession session) {
		Member m = (Member) session.getAttribute("loginResult");
	}//end memberInfo
	
	
	
}//end class
