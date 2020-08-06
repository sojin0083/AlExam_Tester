package egovframework.AIExam_Tester.home.service;

import java.util.List;

public interface BoardService {
	
	//병원 이름
	String getOrgNm();
	
	//질문 가져오기
	List<BoardVO> loadExamItem(BoardVO boardVO);

}
