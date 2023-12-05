package com.dogwalker.domain;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class BoarddogVO {

	private int seq3;
    private String writer3, title3, content3, pwd3;
    private int hit3;
    private Date regdate3;
    private MultipartFile upload3;
    private String filename3;

    
    public int getSeq3() {
		return seq3;
	}

	public void setSeq3(int seq3) {
		this.seq3 = seq3;
	}

	public String getWriter3() {
		return writer3;
	}

	public void setWriter3(String writer3) {
		this.writer3 = writer3;
	}

	public String getTitle3() {
		return title3;
	}

	public void setTitle3(String title3) {
		this.title3 = title3;
	}

	public String getContent3() {
		return content3;
	}

	public void setContent3(String content3) {
		this.content3 = content3;
	}

	public String getPwd3() {
		return pwd3;
	}

	public void setPwd3(String pwd3) {
		this.pwd3 = pwd3;
	}

	public int getHit3() {
		return hit3;
	}

	public void setHit3(int hit3) {
		this.hit3 = hit3;
	}

	public Date getRegdate3() {
		return regdate3;
	}

	public void setRegdate3(Date regdate3) {
		this.regdate3 = regdate3;
	}

	public MultipartFile getUpload3() {
		return upload3;
	}

	public void setUpload3(MultipartFile upload3) {
		this.upload3 = upload3;
	}

	public String getFilename3() {
		return filename3;
	}

	public void setFilename3(String filename3) {
		this.filename3 = filename3;
	}

    // 생성자, getter, setter 등은 생략하였습니다.

    @Override
    public String toString() {
        return "BoardVO[seq3=" + seq3 + ", writer3=" + writer3 + ", title3="
            + title3 + ", content3=" + content3 + ", pwd3=" + pwd3 + ", hit3="
            + hit3 + ", regdate3=" + regdate3 + ", upload3=" + upload3
            + ", filename3=" + filename3 + "]";
    }
}
