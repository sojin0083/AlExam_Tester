package egovframework.AIExam_Tester.home.service;

public class ResultVO {
	public String rNumOrg;
	public String rNumInst;
	public String rNumDate;
	public int rNumSeq;
	public String examType;
	public String examItemCd;
	public int examRes;
	
	public String getrNumOrg() {
		return rNumOrg;
	}
	public void setrNumOrg(String rNumOrg) {
		this.rNumOrg = rNumOrg;
	}
	public String getrNumInst() {
		return rNumInst;
	}
	public void setrNumInst(String rNumInst) {
		this.rNumInst = rNumInst;
	}
	public String getrNumDate() {
		return rNumDate;
	}
	public void setrNumDate(String rNumDate) {
		this.rNumDate = rNumDate;
	}
	public int getrNumSeq() {
		return rNumSeq;
	}
	public void setrNumSeq(int rNumSeq) {
		this.rNumSeq = rNumSeq;
	}
	public String getExamType() {
		return examType;
	}
	public void setExamType(String examType) {
		this.examType = examType;
	}
	public String getExamItemCd() {
		return examItemCd;
	}
	public void setExamItemCd(String examItemCd) {
		this.examItemCd = examItemCd;
	}
	public int getExamRes() {
		return examRes;
	}
	public void setExamRes(int examRes) {
		this.examRes = examRes;
	}
}
