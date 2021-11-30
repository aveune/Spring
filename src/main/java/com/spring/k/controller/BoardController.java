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
public class BoardController {
	
	@Autowired
	BoardService board;
	
	@Autowired
	ReplyService reply;
	
	//게시물 등록
	@RequestMapping("/boardInsert.do")
	String boardInsert(BoardVo vo) {
		board.insert(vo);
		return "/board_list.do";
	}
	
	
	//bno + 1;
		@RequestMapping("/board.do")
		String custno(BoardVo vo ,Model model) {
			model.addAttribute("bno", board.bno() );
			return "/board/board.jsp";
		}
	
	
	//게시물 목록 및 페이징 처리
	@RequestMapping("/board_list.do")
	String boardList(Model  model , BoardVo vo) {
		
		int pageSize = 10;
		int pageListSize =10;
		
 		model.addAttribute("tc" , board.tc(vo));
 		
		if (vo.getStartIdx() == 0) {
 		   vo.setStartIdx(1);
		}else {
		   vo.setStartIdx(vo.getStartIdx());	
		}
		
		int tc= board.tc(vo);
		int totalPage= (int) Math.ceil(tc/10.0); // 전체페이지 수 
		int nowPage = (vo.getStartIdx() / 10 ) + 1 ;
		int endPage = (totalPage - 1) * 10 + 1 ;
		int listStratPage =  (nowPage-1)/ pageListSize * pageListSize + 1 ;
		int listEndPage = listStratPage + pageListSize -1 ;
		
		model.addAttribute("ch1", vo.getCh1());
		model.addAttribute("ch2", vo.getCh2());
		
		model.addAttribute("listStratPage",listStratPage );
		model.addAttribute("listEndPage",listEndPage );
		model.addAttribute("pageSize",pageSize );
		model.addAttribute("pageListSize",pageListSize );
		
		model.addAttribute("totalPage",totalPage );
		model.addAttribute("nowPage",nowPage );
		model.addAttribute("endPage", endPage);
		
		model.addAttribute("startIdx",vo.getStartIdx() );

		model.addAttribute("li", board.getBoardList(vo));
		
		
	return "/board/boardList.jsp";
	}
	
	//게시물 상세 보기 조회수 + 1
	@RequestMapping("/boardContent.do")
	String boardContent(Model  model , BoardVo vo , ReplyVo rvo) {
		model.addAttribute("m" , board.content(vo));
		model.addAttribute("li" , reply.getreplyList(rvo));
		board.cnt(vo);
	return "/board/boardContent.jsp";
	}
	
	
	//수정할 페이지로
	@RequestMapping("/boardUpdatePage.do")
	String boardUpdatePage(Model  model , BoardVo vo) {
		model.addAttribute("m" , board.content(vo));
	return "/board/boardUpdate.jsp";
	}
	
	
	//게시물 수정
	@RequestMapping("/boardUpdate.do")
	String boardUpdate(Model  model , BoardVo vo) {
		board.update(vo);
	return "/board_list.do";
	}
	
	//게시물 삭제
		@RequestMapping("/boardDelete.do")
		String boardDelete(Model  model , BoardVo vo) {
			board.boardelete(vo);
		return "/board_list.do";
		}
		
	
	
}
