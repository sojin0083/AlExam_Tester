package egovframework.AIExam_Tester.home.service;

import java.util.List;

public interface LoginService {

	//기관이름 가져오기
	String getOrgNm(LoginVO loginVO);

	//자동로그인
	String getOrgNmAuto(LoginVO loginVO);

}
