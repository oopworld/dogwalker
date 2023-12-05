package com.dogwalker.domain;

import java.sql.Date;//테이블의 필드로써의 날짜자료형

import org.springframework.web.multipart.MultipartFile;
//import java.util.Date; //보편적인 작성날짜

//테이블의 필드와 연관이 있는 클래스(DTO or VO)
public class BoardfreeVO {

	private int seq2;
	private String writer2,title2,content2,pwd2;//작성자,제목,내용,암호
	private int hit2;//조회수
	private Date regdate2;//작성날짜
	//추가
	private MultipartFile upload2;//업로드할때 필요로하는 객체
	private String filename2;//업로드한 파일명
	
	public int getSeq2() {
		return seq2;
	}
	public void setSeq2(int seq2) {
		this.seq2 = seq2;
	}
	public String getWriter2() {
		return writer2;
	}
	public void setWriter2(String writer2) {
		this.writer2 = writer2;
	}
	public String getTitle2() {
		return title2;
	}
	public void setTitle2(String title2) {
		this.title2 = title2;
	}
	public String getContent2() {
		return content2;
	}
	public void setContent2(String content2) {
		this.content2 = content2;
	}
	public String getPwd2() {
		return pwd2;
	}
	public void setPwd2(String pwd2) {
		this.pwd2 = pwd2;
	}
	public int getHit2() {
		return hit2;
	}
	public void setHit2(int hit2) {
		this.hit2 = hit2;
	}
	public Date getRegdate2() {
		return regdate2;
	}
	public void setRegdate2(Date regdate2) {
		this.regdate2 = regdate2;
	}
	public MultipartFile getUpload2() {
		return upload2;
	}
	public void setUpload2(MultipartFile upload2) {
		this.upload2 = upload2;
	}
	public String getFilename2() {
		return filename2;
	}
	public void setFilename2(String filename2) {
		this.filename2 = filename2;
	}
	

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "BoardVO[seq2="+seq2+",writer2="+writer2+",title2="
				   +title2+",content2="+content2+",pwd2="+pwd2+",hit2="
				   +hit2+",regdate2="+regdate2+",upload2="+upload2
				   +",filename2="+filename2+"]";
	}
	
	
}
