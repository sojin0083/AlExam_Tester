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
				notice = "선택하신 검사는 본인 치매검사 입니다.";
			}else if(trgter.equals("P")) {
				notice = "선택하신 검사는 가족 치매검사 입니다.";
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
	
	//테스트화면
	@RequestMapping(value = "/testPage.do")
	public String testPage(HttpServletRequest request,  HttpSession session, 
			@RequestParam("TRGTER") String trgter) throws Exception {
		System.out.println("테스트화면");
		
		BoardVO boardVO = new BoardVO();
		boardVO.setTrgter(trgter);
		
		//문제 갯수, 테이블width
		int examCnt = 0;
		double tableWidth = 0;
		
		//문제 불러오기
		List<BoardVO> loadExamItem = null;
		try {
			loadExamItem = boardService.loadExamItem(boardVO);
			examCnt = boardService.examCnt(boardVO);
			tableWidth = 100 / (double)examCnt;
			
		}catch(Exception e) {
			msg = "문제 조회중 에러가 발생했습니다.";
			url = "main.do";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return "message";
		}
		request.setAttribute("loadExamItem", loadExamItem);
		request.setAttribute("examCnt", examCnt);
		request.setAttribute("tableWidth", tableWidth);
		request.setAttribute("trgter", trgter);
		return "home/board";
	}
	
	//결과 불러오기
	@RequestMapping(value = "/result_load.do")
	public String result_load(HttpServletRequest request,  HttpSession session, 
			@RequestParam("examItemCd") String[] examItemCd,
			@RequestParam("res") String[] res, 
			@RequestParam("TRGTER") String trgter) throws Exception {
		System.out.println("결과 불러오기 화면");
				
		String orgCd, instCd, rNumber = "";
		int resCnt = 0;
		
		InstVO instVO = new InstVO();
		ResultVO resVO = new ResultVO();
		try {
			//기기사용여부 확인
			String checkInstYn = boardService.checkInst();
			if(checkInstYn.equals("N")) {
				msg = "이기기는 사용하실수 없습니다.";
				request.setAttribute("msg", msg);
				return "message";
			}
			
			//기관코드, 기기코드 가져오기
			instVO.setUseYn("Y");
			orgCd = boardService.loadOrgCd(instVO);
			instCd = boardService.loadInstCd(instVO);
			
			//날짜가져오기
			SimpleDateFormat format1 = new SimpleDateFormat ( "-yyMMdd-HHmm");
			Date time = new Date();
			String now = format1.format(time);
			
			//병록번호 제작
			rNumber = orgCd + instCd + now;
			
			//DB저장
			resVO.setrNumber(rNumber);
			resVO.setTrgter(trgter);
			resVO.setCkUp("N");
			for(int i = 0; i < res.length; i++) {
				resVO.setExamItemCd(examItemCd[i]);
				resVO.setResOx(res[i]);
				boardService.saveRes(resVO);
			}
		}catch(Exception e) {
			msg = "DB가 올바르지 않습니다.";
			url = "main.do";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return "message";
		}
		
		//결과 불러오기
		BoardVO boardVO = new BoardVO();
		boardVO.setTrgter(trgter);
		resVO.setrNumber(rNumber);
		//문제 불러오기
		List<BoardVO> loadExamItem = null;
		//답안 불러오기
		List<ResultVO> loadExamRes = null;
		try {
			//문제,답안불러오기 (사용안함).
			//loadExamItem = boardService.loadExamItem(boardVO);
			//loadExamRes = boardService.loadExamRes(resVO);
			//O갯수 불러오기
			resCnt = boardService.loadExamResCnt(resVO);
		}catch(Exception e) {
			msg = "정보를 불러오는데 실패했습니다.";
			url = "main.do";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return "message";
		}
		//request.setAttribute("loadExamItem", loadExamItem);
		//request.setAttribute("loadExamRes", loadExamRes);
		request.setAttribute("resCnt", resCnt);
		
		return "home/result";
	}
	
}
