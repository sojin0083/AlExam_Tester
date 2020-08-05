package egovframework.AIExam_Tester.home.service.impl;

import java.util.List;

import egovframework.AIExam_Tester.home.service.BoardVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("boardMapper")
public interface BoardMapper {

	//병원이름
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
