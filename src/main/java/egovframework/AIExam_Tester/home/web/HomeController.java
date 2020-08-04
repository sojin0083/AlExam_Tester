package egovframework.AIExam_Tester.home.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
		
		List<BoardVO> infoList = null;
		try {
			infoList = boardService.selectHpInfo();
			request.setAttribute("infoList", infoList);
		}catch(Exception e) {
			System.out.println("에러 : " + e);
			request.setAttribute("msg", "조회중 에러가 발생했습니다.");
			return "index";
		}
		
		return "home/main";
	}
	
	//로딩화면
	@RequestMapping(value = "/loading.do")
	public String loading(HttpServletRequest request) throws Exception {
		System.out.println("로딩화면");
				
		return "home/loading";
	}
	
	//테스트화면
	@RequestMapping(value = "/testPage.do")
	public String testPage(HttpServletRequest request) throws Exception {
		System.out.println("테스트화면");
				
		return "home/board";
	}
}
