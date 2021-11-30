package com.spring.k.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.k.board.BoardService;
import com.spring.k.board.BoardVo;
import com.spring.k.user.UserService;
import com.spring.k.user.UserVo;

@Controller
public class UserController {
	
	@Inject
	UserService user;
	
	@Inject
	BoardService board;
	
	//유저등록
	@RequestMapping("/userinsert.do")
	String userInsert(UserVo vo ,Model model) {
		user.insert(vo);

		return "/login/loginForm.jsp";
	}
	
	
	//custno + 1;
	@RequestMapping("/join.do")
	String custno(UserVo vo ,Model model) {
		model.addAttribute("custno", user.custno() );
		return "/login/join.jsp";
	}
	
	//유저 목록 userContent.do
	@RequestMapping("/user_list.do")
	String userList(Model  model , UserVo vo) {
		
		int pageSize = 10;
		int pageListSize =10;
		
 		model.addAttribute("tc" , user.tc(vo));
 		
		if (vo.getStartIdx() == 0) {
 		   vo.setStartIdx(1);
		}else {
		   vo.setStartIdx(vo.getStartIdx());	
		}
		
		int tc= user.tc(vo);
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

		model.addAttribute("li", user.getUserList(vo));
		
		
	return "/user/user_list.jsp";
	}
	
	//유저 상세보기
	@RequestMapping("/userContent.do")
	String usetContent(UserVo vo, Model  model) {
		
		model.addAttribute("m", user.content(vo) );
		
	return "/user/userContent.jsp";
	}
	
	//회원삭제
	@RequestMapping("/userDelete.do")
	String delete(UserVo vo ,BoardVo bvo , HttpSession session) {
		System.out.println("체크 값:" + vo.getId() + " " + vo.getCustno());
		board.userdelete(bvo);
		user.userDelete(vo);
		user.logout(session);
	return "/user_list.do";
	}	
	
	
	//회원 데이터 수정
	@RequestMapping("/userUpdate.do")
	String update(UserVo vo, Model  model) {
		System.out.println("체크 값:" + vo.getId() + " " + vo.getCustno());
		user.update(vo);
	return "/user_list.do";
	}	
	
	
	//로그인 - 틀릴시 msg / - 성공시 로그인
		@RequestMapping("/login.do")
		String login(UserVo vo, Model  model , HttpServletRequest req, RedirectAttributes rttr) {
			HttpSession session = req.getSession();
			UserVo login = user.login(vo);
			if(login == null) {
				session.setAttribute("member", null);
				model.addAttribute("msg" , "없는 아이디 이거나 잘못된 비밀번호입니다.");
				return "/login/loginForm.jsp";
			}else {
				session.setAttribute("member", login);
			}
			
		return "/index.jsp";
		}	
	
	
	//id 중복체크
	@ResponseBody
	@RequestMapping("/idCheck.do")
	String idChk(@RequestParam("id") String userId) {
		int checkResult = user.idChk(userId);
		System.out.println("체크 결과값 : " +checkResult);
		String check = Integer.toString(checkResult);
	return check;
	}	
	
	
	
	
	//로그아웃
	@RequestMapping("/logout.do")
	String logout(HttpSession session) {
		user.logout(session);
	return "/index.jsp";
	}	
	
	
}
