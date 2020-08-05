package egovframework.AIExam_Tester.home.service;

import java.util.List;

public interface BoardService {
	
	//병원 이름
	String getOrgNm();
	
	//테스트이름
	String getTestName();

	//안내문
	String getNotice();

	//초기질문 가져오기
	String getQuestion();

	//다음질문 가져오기
	String getQuestion(int qNo);

}
