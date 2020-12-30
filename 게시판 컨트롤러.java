package com.exhibition.project;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.exhibition.project.BoardDao.BoardDao;

import com.exhibition.project.BoardDto.BoardDto;


/**
 * Handles requests for the application home page.
 */
@Controller
public class BoardController {
	@Autowired
	private SqlSession sqlSession;
	private String Userid ;

	// ==> 게시판 글 읽어오기 <==//
	@RequestMapping("/new12")
	public String new12() {
		return "new12";
	}

	@RequestMapping("/board")
	public String list(Model model) {
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		ArrayList<BoardDto> dtos = dao.list();
		model.addAttribute("dtos", dtos);
		return "board";

	}

	@RequestMapping("/board_new")
	public String board_new(HttpServletRequest req, Model model) {
		// ==>로그인을 해야 게시글 작성 페이지로 redirect
		
		  HttpSession session =req.getSession();
		  if(session.getAttribute("uid")==null || session.getAttribute("uid").equals("")) {
			  return"login";
		  }
		 
		return "board_new";

	}

	@RequestMapping(value = "/board_write_view", method = RequestMethod.POST)
	public String board_write_view(HttpServletRequest req, Model model) {
		String boardtopic = req.getParameter("boardtopic");
		String userid = req.getParameter("userid");
		String board_comment = req.getParameter("board_comment");
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		dao.write(boardtopic, userid, board_comment);
		return "redirect:board";
	}

	// ==> board_view 에서 댓글 쓰기 ,삭제 , 수정기능
	@RequestMapping(value = "/board_view")
	public String board_view(HttpServletRequest req, Model model) {
		// 댓글쓰기를 보여주는 페이지//
		/*
		 * System.out.println("content_view()"); // <a
		 * href="content_view?bId=${dto.bId}">${dto.bTitle}</a> 를 이용하면됨// // queryString
		 * ==> String type ==> parseInt( ); int
		 * bId=Integer.parseInt(req.getParameter("bId")); //==>interface Dao <==// IDao
		 * dao = sqlSession.getMapper(IDao.class);
		 * 
		 * BDto dto = dao.contentView(bId); model.addAttribute("reply_view",dto); return
		 * "reply_view";
		 */

		System.out.println("댓글쓰기()");
		int board_num = Integer.parseInt(req.getParameter("board_num"));
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		BoardDto dto = dao.board_view(board_num);
		dao.upHit(board_num);
		System.out.println(board_num);
		model.addAttribute("reply_view", dto);
		model.addAttribute("Userid",Userid);
		return "board_view";
	}

	// test 용
	@RequestMapping("/reply_view")
	public String reply_view(HttpServletRequest req , Model model) {
		System.out.println("content_view()");
		// <a href="content_view?bId=${dto.bId}">${dto.bTitle}</a> 를 이용하면됨//
		// 	queryString ==> String type ==> parseInt( );
		int board_num=Integer.parseInt(req.getParameter("board_num"));
		//==>interface Dao <==//
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		
		BoardDto dto = dao.contentView(board_num);
		model.addAttribute("reply_view",dto);
		return "reply_view";
	}

	// 댓글작성하기 //
	@RequestMapping(value = "/reply", method = RequestMethod.POST)
	public String reply(HttpServletRequest req, Model model) {
		  HttpSession session =req.getSession();
		  if(session.getAttribute("uid")==null || session.getAttribute("uid").equals("")) {
			  return"login";
		  }
		
		String board_num = req.getParameter("board_num");
		String bGroup = req.getParameter("bGroup");
		String bStep = req.getParameter("bStep");
		String bIndent = req.getParameter("bIndent");
		String userid = req.getParameter("userid");
		String boardtopic = req.getParameter("boardtopic");
		String board_comment = req.getParameter("board_comment");
		System.out.println(board_num);
		System.out.println(bGroup);
		System.out.println(bStep);
		System.out.println(bIndent);
		System.out.println(userid);
		System.out.println(boardtopic);
		System.out.println(board_comment);

		// ==>interface Dao <==//
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		// dao.reply(bName,bTitle,bContent,Integer.parseInt(bGroup),Integer.parseInt(bStep)+1,Integer.parseInt(bIndent)+1);
		dao.reply(userid,boardtopic,board_comment,Integer.parseInt(bGroup),Integer.parseInt(bStep)+1,Integer.parseInt(bIndent)+1);
		// dao.replyShape(Integer.parseInt(bGroup),Integer.parseInt(bStep));
		dao.replyShape(Integer.parseInt(bGroup),Integer.parseInt(bStep));
		
		return "redirect:board";
	}

	@RequestMapping(value = "/board_update")
	public String board_update(HttpServletRequest req, Model model) {
		
		HttpSession session = req.getSession(); if(session.getAttribute("uid") == null ||session.getAttribute("uid").equals("")) { return "redirect:login"; } 
	    int board_num = Integer.parseInt(req.getParameter("board_num"));
		// ==>interface Dao <==//
		System.out.println(board_num);
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		System.out.println("debug1");
		BoardDto dto = dao.board_view(board_num);
		System.out.println("debug2");
		model.addAttribute("board_update", dto);
		System.out.println("debug3");
		return "board_update";
	}

	// ==>board_update view==> 삭제 , 수정 동시에 가능<==//
	@RequestMapping(value = "/Doboard_update")
	public String Doboard_update(HttpServletRequest req, Model model) {
		/*
		 * HttpSession session = req.getSession(); if(session.getAttribute("uid") ==
		 * null ||session.getAttribute("uid").equals("")) { return "redirect:login"; }
		 */
		System.out.println("content_view()");
		// ==>현재 페이지를 수정하게 하기위해서는 게시물 번호를 getParameter( ) 를 통해서 , where 절 로 수정 해야한다//

		String hidden = req.getParameter("hidden");
		System.out.println(hidden);
		if (hidden.equals("modify")) {
			String board_num = req.getParameter("board_num");
			String boardtopic = req.getParameter("boardtopic");
			String userid = req.getParameter("userid");
			String board_comment = req.getParameter("board_comment");
			System.out.println(board_num);
			System.out.println(boardtopic);
			System.out.println(userid);
			System.out.println(board_comment);

			// ==>interface Dao <==//
			BoardDao dao = sqlSession.getMapper(BoardDao.class);

			dao.Doboard_update(Integer.parseInt(board_num), boardtopic, userid, board_comment);
			model.addAttribute("board_view", dao);
			return "redirect:board";
		} else {

			String board_num = req.getParameter("board_num");

			// ==>interface Dao <==//
			BoardDao dao = sqlSession.getMapper(BoardDao.class);

			dao.Doboard_delete(Integer.parseInt(board_num));
			model.addAttribute("board_view", dao);
			return "redirect:board";

		}

	}

	@RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
	public String loginCheck(HttpServletRequest req, Model model) {
		String id = req.getParameter("id");
		String passwd = req.getParameter("passwd");
		// session 이용
		HttpSession session = req.getSession();
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		int cnt = dao.loginCheck(id, passwd);
		if (cnt == 1) {
			// ==> 회원정보 존재 //
			// ==> uid담아줌
			session.setAttribute("uid", id);
			Userid = id;
		} else {
			// ==>회원정보 없음
			return "redirect:login";
		}
		return "redirect:list";
	}

	@RequestMapping("/logout")
	// 로그아웃할때
	public String doLogout(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		// 로그아웃시 세션종료를 하고 리스트로 돌아간다
		session.invalidate();
		model.addAttribute("logout", "Y");
		return "redirect:/list";

	}

	@RequestMapping("AboutUs")
	public String AboutUs() {
		return "AboutUs";

	}

	@RequestMapping("email_check")
	public String email_check() {
		return "email_check";

	}

	@RequestMapping("getId")
	public String getId() {
		return "getId";

	}

	@RequestMapping("getPw")
	public String getPw() {
		return "getPw";

	}

	@RequestMapping("home")
	public String home() {
		return "home";

	}

	@RequestMapping("login")
	public String login() {
		return "login";

	}

	@RequestMapping("/myInfo")
	public String myInfo(Model model) {
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		ArrayList<BoardDto> dto = dao.list();
		model.addAttribute("dto", dto);
		return "myInfo";
	}

	@RequestMapping("myInfoEdit")
	public String myInfoEdit() {
		return "myInfoEdit";

	}

	@RequestMapping("myItems")
	public String myItems() {
		return "myItems";

	}

	@RequestMapping("paint_new")
	public String paint_new() {
		return "paint_new";

	}

	@RequestMapping("paint")
	public String paint() {
		return "paint";

	}

	@RequestMapping("Signup")
	public String Signup() {
		return "Signup";

	}

	@RequestMapping("welcomeSignup")
	public String welcomeSignup() {
		return "welcomeSignup";

	}

	@RequestMapping("myList")
	public String myList() {
		return "myList";

	}

}
