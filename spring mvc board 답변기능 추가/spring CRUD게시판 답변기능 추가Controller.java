package com.javalec.practice.controller;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.javalec.practice.BDao.BDao;
import com.javalec.practice.BDao.IDao;
import com.javalec.practice.BDto.BDto;
import com.javalec.practice.util.Constant;

@Controller
public class BController {
//mybatis 를 이용한 게시판//
	
	//==>xml 에서 설정해준 SqlSession ==> myBatis 
	
	@Autowired 
	private SqlSession sqlSession;
	
	
								//답글 달기  //
	
	@RequestMapping("/reply_view")
	public String reply_view(HttpServletRequest req , Model model) {
		System.out.println("content_view()");
		// <a href="content_view?bId=${dto.bId}">${dto.bTitle}</a> 를 이용하면됨//
		// 	queryString ==> String type ==> parseInt( );
		int bId=Integer.parseInt(req.getParameter("bId"));
		//==>interface Dao <==//
		IDao dao = sqlSession.getMapper(IDao.class);
		dao.upHit(bId);//==> 게시물 조회수 +1
		BDto dto = dao.contentView(bId);
		model.addAttribute("reply_view",dto);
		return "reply_view";
	}
	@RequestMapping(value="/reply",method=RequestMethod.POST)
	public String reply(HttpServletRequest req, Model model) {
		
		String bId=req.getParameter("bId");
		String bGroup = req.getParameter("bGroup");
		String bStep =req.getParameter("bStep");
		String bIndent = req.getParameter("bIndent");
		String bName = req.getParameter("bName");
		String bTitle = req.getParameter("bTitle");
		String bContent = req.getParameter("bContent");
		System.out.println(bId);
		System.out.println(bGroup);
		System.out.println(bStep);
		System.out.println(bIndent);
		System.out.println(bName);
		System.out.println(bTitle);
		System.out.println(bContent);
		 
		//==>interface Dao <==//
		IDao dao = sqlSession.getMapper(IDao.class);
		dao.reply(bName,bTitle,bContent,Integer.parseInt(bGroup)+1,Integer.parseInt(bStep)+1,Integer.parseInt(bIndent)+1);
		dao.replyShape(Integer.parseInt(bGroup)+1,Integer.parseInt(bStep)+1);
		return "redirect:list";
	}
	
	
	
							//Read//
					//==> 글 목록 읽어오기 <==//
	@RequestMapping("/list")
	
	public String list(Model model) {
		//dao (interface) ==> xml 과 교류하면서 Data에 Access
		//1)dao 에 접근 
		IDao dao = sqlSession.getMapper(IDao.class);
		//2) select list ==> ArrayList 사용함 ex) 전체 글 목록 등
		//3) dao.list( ) xml 에서 가져온 데이터를 DTO에 전달 
		ArrayList<BDto>dtos = dao.list();
		//4)Dto 의 데이터를 model 에 담아서 view에 전달
		model.addAttribute("dtos",dtos);
		
		return "list";
	}
	//create 글작성 화면 나오게 하기//
	@RequestMapping("/write_view") // 새글 쓰기  화면 나오게 하기 
	public String write_view(HttpServletRequest req, Model model) {
		//글작성 페이지는 로그인한 유저한테 보여지게 하기위해서 session을 사용//
		HttpSession session = req.getSession();
		if(session.getAttribute("uid") == null ||session.getAttribute("uid").equals("")) {
			return "login";
		}
		
		System.out.println("write_view()");
		System.out.println("글쓰기 ");
		
		return "write_view";
	}
	
		@RequestMapping(value="/write",method=RequestMethod.POST) //게시글 저장(등록)//
		public String write(HttpServletRequest req, Model model) {
			
			String bTitle = req.getParameter("bTitle");
			String bName = req.getParameter("bName");
			String bContent = req.getParameter("bContent");
			//==>interface Dao <==//
			IDao dao = sqlSession.getMapper(IDao.class);
			dao.write(bName,bTitle,bContent);
			return "redirect:list";
			
			
		}
		//read//
		//클릭한 게시물의 게시물 내용을 읽어오기//
		@RequestMapping("/content_view")
		public String content_view(HttpServletRequest req, Model model) {
			System.out.println("content_view()");
			// <a href="content_view?bId=${dto.bId}">${dto.bTitle}</a> 를 이용하면됨//
			// 	queryString ==> String type ==> parseInt( );
			int bId=Integer.parseInt(req.getParameter("bId"));
			//==>interface Dao <==//
			IDao dao = sqlSession.getMapper(IDao.class);
			dao.upHit(bId);//==> 게시물 조회수 +1
			BDto dto = dao.contentView(bId);
			model.addAttribute("content_view",dto);
			return "content_view";
		}
		
									//update//
		
		@RequestMapping("/modify_view")
		
					//==>게시글 수정페이지는 로그인을 한 유저에게만 보여지게 해야한다<==
		public String modify_view(HttpServletRequest req, Model model) {
			HttpSession session = req.getSession();
			if(session.getAttribute("uid") == null ||session.getAttribute("uid").equals("")) {
				return "redirect:login";
			}
			System.out.println("content_view()");
			//==>현재 페이지를 수정하게 하기위해서는 게시물 번호를 getParameter( ) 를 통해서 , where 절 로 수정 해야한다//
			
			int bId=Integer.parseInt(req.getParameter("bId"));
			//==>interface Dao <==//
			IDao dao = sqlSession.getMapper(IDao.class);
			
			BDto dto = dao.contentView(bId);
			model.addAttribute("modify_view",dto);
			return "modify_view";

		}
		
		
		@RequestMapping(value="/modify",method=RequestMethod.POST)
		public String modify(HttpServletRequest req, Model model) {
			System.out.println("modify()");
			
			String bId=req.getParameter("bId");
			String bName =req.getParameter("bName");
			String bTitle=req.getParameter("bTitle");
			String bContent=req.getParameter("bContent");
			//==>interface Dao <==//
			IDao dao = sqlSession.getMapper(IDao.class);
			
			//==> dao.modify(  ) ==> 매개변수를 받아서 sql 실행//
			dao.modify(Integer.parseInt(bId),bName,bTitle,bContent);
			//==>작업 종료시 list (path(mapping))로 redirect 
			return "redirect:list";
		}
		
		//delete//
		@RequestMapping(value="/delete")
		public String delete(HttpServletRequest req, Model model) {
			HttpSession session = req.getSession();
			//세션의 내용(계정이 null 이거나 공백일때 login 하게끔 한다)//
			if(session.getAttribute("uid") == null ||session.getAttribute("uid").equals("")) {
				return "redirect:login";
			}
			//==>게시글 번호를 기준으로 delete 해줘야함 //
			//==> bId 를 getParameter( ) 받아오고 , 
			//==> dao 에 전달 //
			
			System.out.println("delete()"); 
			String bId= req.getParameter("bId");
			IDao dao = sqlSession.getMapper(IDao.class);
			
			dao.delete(Integer.parseInt(bId));
		
			return "redirect:list";
		}
		
		@RequestMapping("/login")
		public String doLogin() {
			return "login";
		}
		@RequestMapping(value = "/member_check",method = RequestMethod.POST)
		public String doCheck(HttpServletRequest req, Model model) {
			String userid = req.getParameter("userid");
			String passcode = req.getParameter("passcode");
			//session 이용 
			HttpSession session = req.getSession();
			IDao dao = sqlSession.getMapper(IDao.class);
			int cnt = dao.memberCheck(userid,passcode);
			if(cnt==1) {
				//==> 회원정보 존재 //
				//==> uid담아줌
				session.setAttribute("uid", userid);
			}else {
				//==>회원정보 없음
				return "redirect:login";
			}
			return "redirect:list";
		}
		@RequestMapping("/logout")
		//로그아웃할때
		public String doLogout(HttpServletRequest req , Model model) {
			HttpSession session = req.getSession();
			//로그아웃시 세션종료를 하고 리스트로 돌아간다
			session.invalidate();
			model.addAttribute("logout","Y");
			return "redirect:/list";
			
		}
	}
	

