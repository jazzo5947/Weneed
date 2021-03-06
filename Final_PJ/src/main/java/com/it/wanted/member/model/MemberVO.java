package com.it.wanted.member.model;

import java.security.Timestamp;

public class MemberVO {
	private int memNo;
	private String name;
	private String hp;
	private String email;
	private String pwd;
	private Timestamp joindate;
	private Timestamp outdate;
	private int point;
	private String fileName;
	private long fileSize;
	private String originalFileName;
	private String jikgun_code;
	
	
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public Timestamp getJoindate() {
		return joindate;
	}
	public void setJoindate(Timestamp joindate) {
		this.joindate = joindate;
	}
	public Timestamp getOutdate() {
		return outdate;
	}
	public void setOutdate(Timestamp outdate) {
		this.outdate = outdate;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	public String getJikgun_code() {
		return jikgun_code;
	}
	public void setJikgun_code(String jikgun_code) {
		this.jikgun_code = jikgun_code;
	}
	
	@Override
	public String toString() {
		return "MemberVO [memNo=" + memNo + ", name=" + name + ", hp=" + hp + ", email=" + email + ", pwd=" + pwd
				+ ", joindate=" + joindate + ", outdate=" + outdate + ", point=" + point + ", fileName=" + fileName
				+ ", fileSize=" + fileSize + ", originalFileName=" + originalFileName + ", jikgun_code=" + jikgun_code
				+ "]";
	}
	
}
