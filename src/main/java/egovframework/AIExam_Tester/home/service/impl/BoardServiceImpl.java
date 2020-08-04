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
	
	//로그인체크
	@Override
	public List<BoardVO> selectHpInfo() {
		return boardDAO.selectHpInfo();
	}
}
