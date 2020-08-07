package egovframework.AIExam_Tester.home.service;

import java.util.List;

public interface BoardService {
	
	//병원 이름
	String getOrgNm();
	
	//질문 가져오기
	List<BoardVO> loadExamItem(BoardVO boardVO);

	//기기사용여부 확인
	String checkInst();

	//병록번호를 위한 기관/기기코드
	String loadOrgCd(InstVO instVO);
	String loadInstCd(InstVO instVO);

	//로컬DB에 결과 저장
	void saveRes(ResultVO resVO);

	//답안가져오기
	List<ResultVO> loadExamRes(ResultVO resVO);

	//'O'갯수 불러오기
	int loadExamResCnt(ResultVO resVO);
}
