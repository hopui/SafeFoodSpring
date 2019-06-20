package com.ssafy.dto;

import java.sql.Date;

public class Board {

	private Integer boardId;
	private String title;
	private String userEmail;
	private Integer hit;
	private Date regDate;
	private String content;
	private String name;
	
	public Board() {
		// TODO Auto-generated constructor stub
	}

	public Integer getBoardId() {
		return boardId;
	}

	public void setBoardId(Integer boardId) {
		this.boardId = boardId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public Integer getHit() {
		return hit;
	}

	public void setHit(Integer hit) {
		this.hit = hit;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Board [boardId=" + boardId + ", title=" + title + ", userEmail=" + userEmail + ", hit=" + hit
				+ ", regDate=" + regDate + ", content=" + content + ", name=" + name + "]";
	}
	
	
}
