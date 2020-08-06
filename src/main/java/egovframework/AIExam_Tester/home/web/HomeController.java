package egovframework.AIExam_Tester.home.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.AIExam_Tester.home.service.BoardService;
import egovframework.AIExam_Tester.home.service.BoardVO;

@Controller
public class HomeController {
	@Resource(name = "boardService")
	private BoardService boardService;
	
	//메인화면
	@RequestMapping(value = "/main.do")
	public String main(HttpServletRequest request) throws Exception {
		System.out.println("메인화면");
		
		String orgNm = "";
		try {
			orgNm = boardService.getOrgNm();
			request.setAttribute("ORG_NM", orgNm);
		}catch(Exception e) {
			System.out.println("에러 : " + e);
			request.setAttribute("msg", "조회중 에러가 발생했습니다.");
			return "index";
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
				notice = "선택하신 검사는 본인 치매검사 입니다.";
			}else if(trgter.equals("P")) {
				notice = "선택하신 검사는 가족 치매검사 입니다.";
			}else {
				return "index";
			}
			request.setAttribute("TRGTER", trgter);
			request.setAttribute("notice", notice);
		}catch(Exception e) {
			System.out.println("에러 : " + e);
			request.setAttribute("msg", "조회중 에러가 발생했습니다.");
			return "index";
		}
		
		return "home/loading";
	}
	
	//테스트화면
	@RequestMapping(value = "/testPage.do")
	public String testPage(HttpServletRequest request,  HttpSession session, 
			@RequestParam("TRGTER") String trgter) throws Exception {
		System.out.println("테스트화면");
		
		BoardVO boardVO = new BoardVO();
		boardVO.setTrgter(trgter);
		
		//작성한 업무보고 불러오기
		List<BoardVO> loadExamItem = null;
		try {
			loadExamItem = boardService.loadExamItem(boardVO);
		}catch(Exception e) {
			System.out.println("에러 : " + e);
			request.setAttribute("msg", "문제 조회중 에러가 발생했습니다.");
			return "index";
		}
		request.setAttribute("loadExamItem", loadExamItem);
		
//		int a = 1;
//		
//		System.out.println(String.format("%02d", a));
//
//		int qNo = 1;
//		String question = "";
//		try {
//			question = boardService.getQuestion();
//			request.setAttribute("question", question);
//			request.setAttribute("qNo", qNo);
//		}catch(Exception e) {
//			System.out.println("에러 : " + e);
//			request.setAttribute("msg", "조회중 에러가 발생했습니다.");
//			return "index";
//		}
		
		return "home/board";
	}
	
}
