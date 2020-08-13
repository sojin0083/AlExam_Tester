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
public class LoginController {	
	@Resource(name = "loginService")
	private LoginService loginService;
	
	//메세지처리
	String msg = null, url = null;
	
	//로그인화면
	@RequestMapping(value = "/loginPage.do")
	public String login(HttpServletRequest request) throws Exception {
		System.out.println("로그인화면");
		
		Cookie[] cookies = request.getCookies();
		System.out.println("쿠키갯수 : " + cookies.length);
		for (int i = 0; i < cookies.length; i++) { // 쿠키 배열을 반복문으로 돌린다.
			System.out.println(i + "번째 쿠키 이름 : " + cookies[i].getName()); // 쿠키의 이름을 가져온다.
			System.out.println(i + "번째 쿠키에 설정된 값 : " + cookies[i].getValue()); // 쿠키의 값을 가져온다.
		}
		
		for(int i = 0; i < cookies.length; i++) {
			if(cookies[i].getName().equals("orgCd")) {
				LoginVO loginVO = new LoginVO();
				loginVO.setOrgCd(cookies[i].getValue());
				
				String orgNm = loginService.getOrgNmAuto(loginVO);
				System.out.println("자동로그인 기관이름 : " + orgNm);
				request.setAttribute("ORG_NM", orgNm);
				return "home/main";
			}
		}

		return "home/login";
	}
	
	//로그인
	@RequestMapping(value = "/login.do")
	public String login(HttpServletRequest request,
			HttpSession session,
			HttpServletResponse response,
			@RequestParam("ORG_CD") String orgCd,
			@RequestParam("ORG_PW") String orgPw) throws Exception {
		System.out.println("로그인실행");
		
		LoginVO loginVO = new LoginVO();
		loginVO.setOrgCd(orgCd);
		loginVO.setOrgPw(orgPw);
		
		//자동로그인 체크
		String autoLogin = request.getParameter("AUTO_LOGIN");
		String orgNm = "";
		session = request.getSession();
		try {
			orgNm = loginService.getOrgNm(loginVO);
			System.out.println("기관이름 : " + orgNm);
			if(orgNm == null || orgNm.equals("")) {
				msg = "기관정보가 올바르지 않습니다.";
				url = "loginPage.do";
				request.setAttribute("msg", msg);
				request.setAttribute("url", url);
				return "message";
			}else {
				//세션에 기관정보 저장
				session.setAttribute("orgCd", orgCd);
				session.setAttribute("orgNm", orgNm);
				//쿠키생성(기관코드)저장
				Cookie info = new Cookie("orgCd", orgCd);
				if(autoLogin != null) {
					info.setMaxAge(30*24*60*60);	// 쿠키의 유효기간을 30일로 설정한다.30*24*60*60
					info.setPath("/");				// 쿠키의 유효한 디렉토리를 "/" 로 설정한다.
					response.addCookie(info);		// 클라이언트 응답에 쿠키를 추가한다.
					System.out.println("쿠키저장");
				}else {
					//체크해제시 쿠키 삭제, 유효시간 0으로 삭제
					Cookie[] cookies = request.getCookies(); // 요청정보로부터 쿠키를 가져온다.

					for(int i = 0; i < cookies.length; i++) {
						if(cookies[i].getName().equals("orgCd")) {
							cookies[i].setMaxAge(0); // 특정 쿠키를 더 이상 사용하지 못하게 하기 위해서는 쿠키의 유효시간을 만료시킨다.
							response.addCookie(cookies[i]); // 해당 쿠키를 응답에 추가(수정)한다.
						}
					}
					System.out.println("쿠키삭제후 로그인");
				}

			}
		}catch(Exception e) {
			msg = "기관정보가 없습니다.";
			url = "loginPage.do";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return "message";
		}
		request.setAttribute("ORG_NM", orgNm);
		return "home/main";
	}
	
	//로그아웃
	@RequestMapping(value = "/logout.do")
	public String logout(HttpServletRequest request,
			HttpSession session,
			HttpServletResponse response) throws Exception {
		System.out.println("로그아웃실행");
		
		//세션초기화
		session.invalidate();

		//체크해제시 쿠키 삭제, 유효시간 0으로 삭제
		Cookie[] cookies = request.getCookies(); // 요청정보로부터 쿠키를 가져온다.

		for(int i = 0; i < cookies.length; i++) {
			if((cookies[i].getName()).equals("orgCd")) {
				System.out.println("값 : " + cookies[i].getName());
				cookies[i].setMaxAge(1); // 특정 쿠키를 더 이상 사용하지 못하게 하기 위해서는 쿠키의 유효시간을 만료시킨다.
				response.addCookie(cookies[i]); // 해당 쿠키를 응답에 추가(수정)한다.
			}
		}
		
		System.out.println("쿠키삭제");
		
//		테스트
		System.out.println("쿠키갯수 : " + cookies.length);
		for (int i = 0; i < cookies.length; i++) { // 쿠키 배열을 반복문으로 돌린다.
			System.out.println(i + "번째 쿠키 이름 : " + cookies[i].getName()); // 쿠키의 이름을 가져온다.
			System.out.println(i + "번째 쿠키에 설정된 값 : " + cookies[i].getValue()); // 쿠키의 값을 가져온다.
		}
		return "home/login";
	}
}
