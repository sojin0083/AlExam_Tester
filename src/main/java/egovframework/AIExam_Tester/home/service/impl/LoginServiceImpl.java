package egovframework.AIExam_Tester.home.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.AIExam_Tester.home.service.LoginService;
import egovframework.AIExam_Tester.home.service.LoginVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;


@Service("loginService")
public class LoginServiceImpl extends EgovAbstractServiceImpl implements LoginService {
	@Resource(name="loginMapper")
	private LoginMapper loginDAO;

	//기관이름 가져오기
	@Override
	public String getOrgNm(LoginVO loginVO) {
		return loginDAO.getOrgNm(loginVO);
	}

	//자동로그인
	@Override
	public String getOrgNmAuto(LoginVO loginVO) {
		return loginDAO.getOrgNmAuto(loginVO);
	}
	
}
