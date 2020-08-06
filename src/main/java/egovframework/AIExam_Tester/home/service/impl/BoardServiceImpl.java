package egovframework.AIExam_Tester.home.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.AIExam_Tester.home.service.BoardService;
import egovframework.AIExam_Tester.home.service.BoardVO;
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
}
