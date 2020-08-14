package egovframework.AIExam_Tester.home.service;

import java.util.List;

public interface BoardService {
	
	//기관이름
	String getOrgNm();
	
	//문제갯수 불러오기
	int examCnt(BoardVO boardVO);
	
	//질문 가져오기
	List<BoardVO> loadExamItem(BoardVO boardVO);

	//기기사용여부 확인
	String checkInst(InstVO instVO);

	//병록번호를 위한 기관/기기코드
	String loadOrgCd(InstVO instVO);
	String loadInstCd(InstVO instVO);

	//로컬DB에 결과 저장
	void saveRes(ResultVO resVO);

	//점수가져오기
	int loadExamResScore(ResultVO resVO);

	//병록번호 시퀀스 가져오기
	int getSeqMax(ResultVO resVO);

}
