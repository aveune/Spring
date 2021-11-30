package com.spring.k.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.k.board.BoardService;
import com.spring.k.board.BoardVo;
import com.spring.k.reply.ReplyService;
import com.spring.k.reply.ReplyVo;

@Controller
public class ReplyController {
	
	@Autowired
	BoardService board;
	
	@Autowired
	ReplyService reply;
	
	
		//댓글 등록
		@RequestMapping("/replyInsert.do")
		String replyInsert(ReplyVo vo) {
			reply.insert(vo);
			return "replyInsert_ok.do";
		}
	
		//등록 후 목록
		@RequestMapping("/replyInsert_ok.do")
		String insertOk(ReplyVo vo , BoardVo bvo , Model model) {
			
			model.addAttribute("m" , board.content(bvo));
			model.addAttribute("li", reply.getreplyList(vo));
			
			return "/board/boardContent.jsp";
		}
	
		
		//댓글 수정페이지
		@RequestMapping("/replyUpdatePage.do")
		String replyUpdatePage(ReplyVo vo , Model model) {
			model.addAttribute("rep" , reply.content(vo));
			System.out.println(" 체크값 : " +reply.content(vo));
			
			return "/board/replyUpdate.jsp";
		}
		
		
		//댓글 수정
		@RequestMapping("/replyUpdate.do")
		String replyUpdate(ReplyVo vo , Model model) {
			reply.update(vo);
			System.out.println(vo.toString());
		return "/replyInsert_ok.do";
		}
				
		
		
		
		//댓글 삭제
		
		@RequestMapping("/replyDelete.do")
		String replyDelte(ReplyVo vo , Model model) {
			reply.replydelete(vo);
			System.out.println("delete : " + vo.toString());
		return "/replyInsert_ok.do";
		}
	
}
