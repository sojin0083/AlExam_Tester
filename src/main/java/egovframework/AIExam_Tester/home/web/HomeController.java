package egovframework.AIExam_Tester.home.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.AIExam_Tester.home.service.BoardService;
import egovframework.AIExam_Tester.home.service.BoardVO;
import egovframework.AIExam_Tester.home.service.InstVO;
import egovframework.AIExam_Tester.home.service.LoginService;
import egovframework.AIExam_Tester.home.service.LoginVO;
import egovframework.AIExam_Tester.home.service.ResultVO;

@Controller
public class HomeController {
	@Resource(name = "boardService")
	private BoardService boardService;
		
	//메세지처리
	String msg = null, url = null;
	
	//메인화면
	@RequestMapping(value = "/main.do")
	public String main(HttpServletRequest request,
			HttpSession session) throws Exception {
		System.out.println("메인화면");
		
		//기기사용여부 확인
		try {
			InstVO instVO = new InstVO();
			instVO.setOrgCd((String) session.getAttribute("orgCd"));
			String checkInstYn = boardService.checkInst(instVO);
			if(checkInstYn.equals("N")) {
				msg = "이기기는 사용하실수 없습니다.";
				request.setAttribute("msg", msg);
				return "message";
			}
		}catch(Exception e) {
			msg = "해당기관은 사용하실수 없습니다.";
			url = "main.do";
			request.setAttribute("msg" + "에러 : " + e, msg);
			request.setAttribute("url", url);
			return "message";
		}
		
		try {
			String orgNm = (String) session.getAttribute("orgNm");
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
	public String loading(HttpServletRequest request, @RequestParam("EXAM_TYPE") String examType) throws Exception {
		System.out.println("로딩화면");
		String notice = "";
		
		try {
			if(examType.equals("KDSQC")) {
				notice = "선택하신 검사는 인지기능장애 평가 입니다.";
			}else if(examType.equals("GDS")) {
				notice = "선택하신 검사는 가족 우울증 평가 입니다.";
			}else {
				msg = "문제 조회중 에러가 발생했습니다.";
				url = "main.do";
				request.setAttribute("msg", msg);
				request.setAttribute("url", url);
				return "message";
			}
			request.setAttribute("EXAM_TYPE", examType);
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
