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
public class ProcessController {
	@Resource(name = "boardService")
	private BoardService boardService;
	
	//메세지처리
	String msg = null, url = null;
	
	//인지기능장애 평가도구 판별
	String KDSQC = "M";
	//GDS판별
	String GDS = "P";
		
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
		
		if(trgter.equals(KDSQC)) {
			return "home/boardM";
		}else if(trgter.equals(GDS)) {
			return "home/boardP";
		}else {
			msg = "문제 조회중 에러가 발생했습니다.";
			url = "main.do";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return "message";
		}
	}
	
	//결과 불러오기
	@RequestMapping(value = "/result_load.do")
	public String result_load(HttpServletRequest request,  HttpSession session, 
			@RequestParam("examItemCd") String[] examItemCd,
			@RequestParam("res") int[] res,
			@RequestParam("TRGTER") String trgter) throws Exception {
		System.out.println("결과 불러오기 화면");
		
		String orgCd, instCd, rNumber = "";
		int resScore = 0;
		int rNumberSeq = 0;
		
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
			SimpleDateFormat format1 = new SimpleDateFormat ( "-yyMMdd");
			Date time = new Date();
			String now = format1.format(time);
						
			//병록번호 제작1
			rNumber = orgCd + instCd + now;
			
			//병록번호 시퀀스 가져오기
			rNumberSeq = boardService.getSeqMax(rNumber) + 1;
						
			//DB저장
			resVO.setrNumber(rNumber);
			resVO.setrNumberSeq(rNumberSeq);
			resVO.setTrgter(trgter);
			resVO.setCkUp("N");
			for(int i = 0; i < res.length; i++) {
				resVO.setExamItemCd(examItemCd[i]);
				resVO.setExamRes(res[i]);
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
		resVO.setrNumberSeq(rNumberSeq);

		try {
			//치매검사 점수계산
//			if(trgter.equals(KDSQC)) {
//				resScore = boardService.loadExamResScore(resVO);
//			}else if(trgter.equals(GDS)) {
//				resScore = boardService.loadExamResScore(resVO);
//			}
			resScore = boardService.loadExamResScore(resVO); 
		}catch(Exception e) {
			msg = "정보를 불러오는데 실패했습니다.";
			url = "main.do";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return "message";
		}
		request.setAttribute("resScore", resScore);
		request.setAttribute("trgter", trgter);
		
		return "home/result";
	}
	
}
