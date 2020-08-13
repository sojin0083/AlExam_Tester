package egovframework.AIExam_Tester.home.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.AIExam_Tester.home.service.BoardService;
import egovframework.AIExam_Tester.home.service.BoardVO;
import egovframework.AIExam_Tester.home.service.InstVO;
import egovframework.AIExam_Tester.home.service.ResultVO;

@Controller
public class HomeController {
	@Resource(name = "boardService")
	private BoardService boardService;
	
	//메세지처리
	String msg = null, url = null;
	
	//로그인화면
	@RequestMapping(value = "/login.do")
	public String login(HttpServletRequest request) throws Exception {
		System.out.println("로그인화면");
		
		try {
			
		}catch(Exception e) {
			msg = "조회중 에러가 발생했습니다.";
			url = "main.do";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return "message";
		}
		
		return "home/login";
	}
	
	//메인화면
	@RequestMapping(value = "/main.do")
	public String main(HttpServletRequest request) throws Exception {
		System.out.println("메인화면");
		
		//기기사용여부 확인
		String checkInstYn = boardService.checkInst();
		if(checkInstYn.equals("N")) {
			msg = "이기기는 사용하실수 없습니다.";
			request.setAttribute("msg", msg);
			return "message";
		}
		
		String orgNm = "";
		try {
			orgNm = boardService.getOrgNm();
			request.setAttribute("ORG_NM", orgNm);
		}catch(Exception e) {
			msg = "조회중 에러가 발생했습니다.";
			url = "main.do";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return "message";
		}
		
		return "home/main";
	}
	
	//로딩화면
	@RequestMapping(value = "/loading.do")
	public String loading(HttpServletRequest request, @RequestParam("TRGTER") String trgter) throws Exception {
		System.out.println("로딩화면");
		String notice = "";
		
		try {
			if(trgter.equals("M")) {
				notice = "선택하신 검사는 인지기능장애 평가 입니다.";
			}else if(trgter.equals("P")) {
				notice = "선택하신 검사는 가족 우울증 평가 입니다.";
			}else {
				msg = "문제 조회중 에러가 발생했습니다.";
				url = "main.do";
				request.setAttribute("msg", msg);
				request.setAttribute("url", url);
				return "message";
			}
			request.setAttribute("TRGTER", trgter);
			request.setAttribute("notice", notice);
		}catch(Exception e) {
			msg = "문제 조회중 에러가 발생했습니다.";
			url = "main.do";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return "message";
		}
		
		return "home/loading";
	}	
}
