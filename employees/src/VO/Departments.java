package VO;

public class Departments {
	//쿼리의 내용을 저장할 변수를 접근자 private으로 생성 
	private String deptNo;
	private String deptName;
	//private에 숨겨진 값을 불러오거나 변경할때 쓰는 getter setter문
	public String getDeptNo() {
		return deptNo;
	}
	public void setDeptNo(String deptNo) {
		this.deptNo = deptNo;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
}
