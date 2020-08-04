package egovframework.AIExam_Tester.home.service.impl;

import java.util.List;

import egovframework.AIExam_Tester.home.service.BoardVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("boardMapper")
public interface BoardMapper {
	//메인화면 병원정보 표시
	List<BoardVO> selectHpInfo();

}
