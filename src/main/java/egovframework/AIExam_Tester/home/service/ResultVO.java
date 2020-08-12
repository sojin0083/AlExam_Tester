package egovframework.AIExam_Tester.home.service;

public class ResultVO {
	public String rNumber;
	public int rNumberSeq;
	public String trgter;
	public String examItemCd;
	public int examRes;
	public String ckUp;
	
	public String getrNumber() {
		return rNumber;
	}
	public void setrNumber(String rNumber) {
		this.rNumber = rNumber;
	}
	public int getrNumberSeq() {
		return rNumberSeq;
	}
	public void setrNumberSeq(int rNumberSeq) {
		this.rNumberSeq = rNumberSeq;
	}
	public String getTrgter() {
		return trgter;
	}
	public void setTrgter(String trgter) {
		this.trgter = trgter;
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
	public String getCkUp() {
		return ckUp;
	}
	public void setCkUp(String ckUp) {
		this.ckUp = ckUp;
	}
}
