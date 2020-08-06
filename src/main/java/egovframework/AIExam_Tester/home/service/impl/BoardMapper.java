package egovframework.AIExam_Tester.home.service.impl;

import java.util.List;

import egovframework.AIExam_Tester.home.service.BoardVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("boardMapper")
public interface BoardMapper {

	//병원이름
	String getOrgNm();
	
	//질문 가져오기
	List<BoardVO> loadExamItem(BoardVO boardVO);

}
