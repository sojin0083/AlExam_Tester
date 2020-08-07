package egovframework.AIExam_Tester.home.service;

public class ResultVO {
	public String rNumber;
	public String trgter;
	public String examItemCd;
	public String resOx;
	public String ckUp;
	
	public String getrNumber() {
		return rNumber;
	}
	public void setrNumber(String rNumber) {
		this.rNumber = rNumber;
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
	public String getResOx() {
		return resOx;
	}
	public void setResOx(String resOx) {
		this.resOx = resOx;
	}
	public String getCkUp() {
		return ckUp;
	}
	public void setCkUp(String ckUp) {
		this.ckUp = ckUp;
	}
}
