package egovframework.AIExam_Tester.home.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.AIExam_Tester.home.service.BoardService;
import egovframework.AIExam_Tester.home.service.BoardVO;
import egovframework.AIExam_Tester.home.service.InstVO;
import egovframework.AIExam_Tester.home.service.ResultVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;


@Service("boardService")
public class BoardServiceImpl extends EgovAbstractServiceImpl implements BoardService {
	@Resource(name="boardMapper")
	private BoardMapper boardDAO;
	
	//기관이름
	@Override
	public String getOrgNm() {
		return boardDAO.getOrgNm();
	}

	//질문 가져오기
	@Override
	public List<BoardVO> loadExamItem(BoardVO boardVO) {
		return boardDAO.loadExamItem(boardVO);
	}
	
	//기기사용여부확인
	@Override
	public String checkInst() {
		return boardDAO.checkInst();
	}

	//병록번호를 위한 기관/기기코드
	@Override
	public String loadOrgCd(InstVO instVO) {
		return boardDAO.loadOrgCd(instVO);
	}
	@Override
	public String loadInstCd(InstVO instVO) {
		return boardDAO.loadInstCd(instVO);
	}

	//로컬DB에 저장
	@Override
	public void saveRes(ResultVO resVO) {
		boardDAO.saveRes(resVO);
	}

	//답안가져오기
	@Override
	public List<ResultVO> loadExamRes(ResultVO resVO) {
		return boardDAO.loadExamRes(resVO);
	}

	//'O'갯수 불러오기
	@Override
	public int loadExamResCnt(ResultVO resVO) {
		return boardDAO.loadExamResCnt(resVO);
	}
}
