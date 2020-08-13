package egovframework.AIExam_Tester.home.service.impl;

import java.util.List;

import egovframework.AIExam_Tester.home.service.BoardVO;
import egovframework.AIExam_Tester.home.service.InstVO;
import egovframework.AIExam_Tester.home.service.LoginVO;
import egovframework.AIExam_Tester.home.service.ResultVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("loginMapper")
public interface LoginMapper {

	//기관이름 가져오기
	String getOrgNm(LoginVO loginVO);

	//자동로그인
	String getOrgNmAuto(LoginVO loginVO);

}
