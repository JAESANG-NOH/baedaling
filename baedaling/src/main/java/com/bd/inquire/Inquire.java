package com.bd.inquire;

public class Inquire {
	private int num;
	private int type;
	private int parent;
	private int state;
	private String userId;
	private int userIdx;
	private String email;
	private String category;
	private String subject;
	private String content;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getParent() {
		return parent;
	}
	public void setParent(int parent) {
		this.parent = parent;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getUserIdx() {
		return userIdx;
	}
	public void setUserIdx(int userIdx) {
		this.userIdx = userIdx;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

}

/*
 * CREATE TABLE inquire (
    num           NUMBER PRIMARY KEY
    ,type         NUMBER(1) DEFAULT 0
    ,parent       NUMBER DEFAULT 0
    ,state        NUMBER(1) DEFAULT 0
    ,userId       VARCHAR2(50) NOT NULL
    ,userIdx      NUMBER NOT NULL
    ,email        VARCHAR2(50)
    ,category    VARCHAR2(50) NOT NULL
    ,subject     VARCHAR2(255) NOT NULL
    ,content     CLOB NOT NULL
    ,created     DATE DEFAULT SYSDATE
    ,CONSTRAINT fk_inquire_userIdx FOREIGN KEY(userIdx)
                REFERENCES user1(userIdx)
);

 */
