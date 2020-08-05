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

	//테스트이름
	@Override
	public String getTestName() {
		// TODO Auto-generated method stub
		return boardDAO.getTestName();
	}

	//안내문
	@Override
	public String getNotice() {
		// TODO Auto-generated method stub
		return boardDAO.getNotice();
	}

	//초기질문 가져오기
	@Override
	public String getQuestion() {
		// TODO Auto-generated method stub
		return boardDAO.getQuestion();
	}

	//다음질문가져오기
	@Override
	public String getQuestion(int qNo) {
		// TODO Auto-generated method stub
		return boardDAO.getQuestion(qNo);
	}

}
